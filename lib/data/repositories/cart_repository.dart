import '../services/cart_firestore_service.dart';

class CartRepository {
  CartRepository(this._cartFirestoreService);

  final CartFirestoreService _cartFirestoreService;

  Stream<Map<String, int>> watchCartItems() {
    return _cartFirestoreService.watchCartItems();
  }

  Future<void> setQuantity(String bookId, int quantity) {
    return _cartFirestoreService.setQuantity(bookId, quantity);
  }

  Future<void> remove(String bookId) {
    return _cartFirestoreService.remove(bookId);
  }

  Future<void> clear() {
    return _cartFirestoreService.clear();
  }
}
