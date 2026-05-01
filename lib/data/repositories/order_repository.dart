import '../models/order_model.dart';
import '../services/order_firestore_service.dart';

class OrderRepository {
  OrderRepository(this._orderFirestoreService);

  final OrderFirestoreService _orderFirestoreService;

  Future<String> createOrder(OrderModel order) {
    return _orderFirestoreService.createOrder(order);
  }

  Future<List<OrderModel>> fetchUserOrders(String userId) {
    return _orderFirestoreService.fetchUserOrders(userId);
  }

  Stream<List<OrderModel>> watchUserOrders(String userId) {
    return _orderFirestoreService.watchUserOrders(userId);
  }

  Future<void> cancelOrder(String orderId) {
    return _orderFirestoreService.cancelOrder(orderId);
  }

  Future<void> updateOrderStatus(String orderId, String status) {
    return _orderFirestoreService.updateOrderStatus(orderId, status);
  }

  Future<bool> hasUserPurchasedProduct({
    required String userId,
    required String productId,
  }) {
    return _orderFirestoreService.hasUserPurchasedProduct(
      userId: userId,
      productId: productId,
    );
  }
}
