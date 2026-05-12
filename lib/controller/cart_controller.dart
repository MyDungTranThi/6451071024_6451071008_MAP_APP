import 'dart:async';

import 'package:get/get.dart';

import '../data/models/book_model.dart';
import '../data/models/cart_item_model.dart';
import '../data/repositories/cart_repository.dart';
import 'book_catalog_controller.dart';

class CartController extends GetxController {
  CartController(this._cartRepository);

  final CartRepository _cartRepository;
  final RxList<CartItemModel> items = <CartItemModel>[].obs;
  StreamSubscription<List<CartItemModel>>? _cartSubscription;

  @override
  void onInit() {
    super.onInit();
    _cartSubscription = _cartRepository.watchCartItems().listen((remoteItems) {
      items.assignAll(remoteItems);
    });
  }

  @override
  void onClose() {
    _cartSubscription?.cancel();
    super.onClose();
  }

  int quantityFor(String bookId, BookFormat format) {
    final item = _findItem(bookId, format);
    return item?.quantity ?? 0;
  }

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;

  List<CartItemModel> get lines => items.toList();

  Future<void> addBook(
    BookModel book, {
    required BookFormat format,
    int quantity = 1,
  }) async {
    final current = quantityFor(book.id, format);
    await _cartRepository.setQuantity(
      bookId: book.id,
      format: format,
      quantity: current + quantity,
    );
  }

  Future<void> increase(CartItemModel item) async {
    await _cartRepository.setQuantity(
      bookId: item.bookId,
      format: item.format,
      quantity: item.quantity + 1,
    );
  }

  Future<void> decrease(CartItemModel item) async {
    await _cartRepository.setQuantity(
      bookId: item.bookId,
      format: item.format,
      quantity: item.quantity - 1,
    );
  }

  Future<void> remove(CartItemModel item) async {
    await _cartRepository.remove(item.id);
  }

  double totalPrice(BookCatalogController catalogController) {
    double total = 0;
    for (final item in items) {
      final book = catalogController.findById(item.bookId);
      if (book != null) {
        total += sellingPrice(book) * item.quantity;
      }
    }
    return total;
  }

  double sellingPrice(BookModel book) {
    final salePrice = book.salePrice;
    if (salePrice != null && salePrice > 0 && salePrice < book.price) {
      return salePrice;
    }
    return book.price;
  }

  CartItemModel? _findItem(String bookId, BookFormat format) {
    for (final item in items) {
      if (item.bookId == bookId && item.format == format) {
        return item;
      }
    }
    return null;
  }

  Future<void> clear() async {
    await _cartRepository.clear();
  }
}
