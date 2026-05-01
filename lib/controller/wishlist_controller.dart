import 'dart:async';

import 'package:get/get.dart';

import '../data/models/book_model.dart';
import '../data/repositories/wishlist_repository.dart';
import 'book_catalog_controller.dart';

class WishlistController extends GetxController {
  WishlistController(this._wishlistRepository);

  final WishlistRepository _wishlistRepository;
  final RxSet<String> bookIds = <String>{}.obs;
  final RxBool isLoading = false.obs;
  StreamSubscription<Set<String>>? _wishlistSubscription;

  @override
  void onInit() {
    super.onInit();
    watchWishlist();
  }

  @override
  void onClose() {
    _wishlistSubscription?.cancel();
    super.onClose();
  }

  bool isInWishlist(String bookId) => bookIds.contains(bookId);

  void watchWishlist() {
    _wishlistSubscription?.cancel();
    _wishlistSubscription = _wishlistRepository.watchWishlistItems().listen((
      ids,
    ) {
      bookIds
        ..clear()
        ..addAll(ids);
      bookIds.refresh();
    });
  }

  Future<void> toggle(BookModel book) async {
    if (isLoading.value) return;

    final wasInWishlist = bookIds.contains(book.id);
    isLoading.value = true;

    if (wasInWishlist) {
      bookIds.remove(book.id);
    } else {
      bookIds.add(book.id);
    }
    bookIds.refresh();

    try {
      if (wasInWishlist) {
        await _wishlistRepository.remove(book.id);
      } else {
        await _wishlistRepository.add(book.id);
      }
    } catch (error) {
      if (wasInWishlist) {
        bookIds.add(book.id);
      } else {
        bookIds.remove(book.id);
      }
      bookIds.refresh();
      Get.snackbar('Lỗi', error.toString().replaceFirst('Bad state: ', ''));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleWishlist(BookModel book) => toggle(book);

  List<BookModel> get wishlistBooks {
    final catalog = Get.find<BookCatalogController>();
    return bookIds
        .map(catalog.findById)
        .whereType<BookModel>()
        .toList(growable: false);
  }
}
