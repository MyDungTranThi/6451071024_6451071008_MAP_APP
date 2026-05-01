import 'dart:async';

import 'package:get/get.dart';

import '../data/models/book_model.dart';
import '../data/repositories/cart_repository.dart';
import 'book_catalog_controller.dart';

class CartController extends GetxController {
  CartController(this._cartRepository);

  final CartRepository _cartRepository;
  final RxMap<String, int> items = <String, int>{}.obs;
  StreamSubscription<Map<String, int>>? _cartSubscription;

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

  int quantityFor(String bookId) => items[bookId] ?? 0;

  int get totalItems => items.values.fold(0, (sum, qty) => sum + qty);

  bool get isEmpty => items.isEmpty;

  List<MapEntry<String, int>> get lines => items.entries.toList();

  Future<void> addBook(BookModel book, {int quantity = 1}) async {
    final current = items[book.id] ?? 0;
    await _cartRepository.setQuantity(book.id, current + quantity);
  }

  Future<void> increase(String bookId) async {
    await _cartRepository.setQuantity(bookId, (items[bookId] ?? 0) + 1);
  }

  Future<void> decrease(String bookId) async {
    final current = items[bookId] ?? 0;
    await _cartRepository.setQuantity(bookId, current - 1);
  }

  Future<void> remove(String bookId) async {
    await _cartRepository.remove(bookId);
  }

  double totalPrice(BookCatalogController catalogController) {
    double total = 0;
    for (final entry in items.entries) {
      final book = catalogController.findById(entry.key);
      if (book != null) {
        total += _sellingPrice(book) * entry.value;
      }
    }
    return total;
  }

  double _sellingPrice(BookModel book) {
    final salePrice = book.salePrice;
    if (salePrice != null && salePrice > 0 && salePrice < book.price) {
      return salePrice;
    }
    return book.price;
  }

  Future<void> clear() async {
    await _cartRepository.clear();
  }
}
