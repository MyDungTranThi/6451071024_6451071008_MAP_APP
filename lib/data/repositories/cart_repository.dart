import '../models/book_model.dart';
import '../models/cart_item_model.dart';
import '../services/cart_firestore_service.dart';

class CartRepository {
  CartRepository(this._cartFirestoreService);

  final CartFirestoreService _cartFirestoreService;

  Stream<List<CartItemModel>> watchCartItems() {
    return _cartFirestoreService.watchCartItems();
  }

  Future<void> setQuantity({
    required String bookId,
    required BookFormat format,
    required int quantity,
  }) {
    return _cartFirestoreService.setQuantity(
      bookId: bookId,
      format: format,
      quantity: quantity,
    );
  }

  Future<void> remove(String itemId) {
    return _cartFirestoreService.remove(itemId);
  }

  Future<void> clear() {
    return _cartFirestoreService.clear();
  }
}
