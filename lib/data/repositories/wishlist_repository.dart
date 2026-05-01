import '../services/wishlist_firestore_service.dart';

class WishlistRepository {
  WishlistRepository(this._wishlistFirestoreService);

  final WishlistFirestoreService _wishlistFirestoreService;

  Stream<Set<String>> watchWishlistItems() {
    return _wishlistFirestoreService.watchWishlistItems();
  }

  Future<void> add(String bookId) {
    return _wishlistFirestoreService.add(bookId);
  }

  Future<void> remove(String bookId) {
    return _wishlistFirestoreService.remove(bookId);
  }
}
