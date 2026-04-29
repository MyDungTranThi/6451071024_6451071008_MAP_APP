import '../models/order_model.dart';
import '../services/order_firestore_service.dart';

class OrderRepository {
  OrderRepository(this._orderFirestoreService);

  final OrderFirestoreService _orderFirestoreService;

  Future<String> createOrder(OrderModel order) {
    return _orderFirestoreService.createOrder(order);
  }
}
