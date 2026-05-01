import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order_model.dart';

class OrderFirestoreService {
  OrderFirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _ordersRef =>
      _firestore.collection('orders');

  Future<String> createOrder(OrderModel order) async {
    final docRef = _ordersRef.doc();
    await docRef.set({
      ...order.toJson(),
      'id': docRef.id,
      'serverCreatedAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  Future<List<OrderModel>> fetchUserOrders(String userId) async {
    final snapshot = await _ordersRef.where('userId', isEqualTo: userId).get();
    final orders = snapshot.docs.map((doc) {
      final data = doc.data();
      data['docId'] = doc.id;
      return OrderModel.fromJson(data);
    }).toList();

    orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return orders;
  }

  Stream<List<OrderModel>> watchUserOrders(String userId) {
    return _ordersRef.where('userId', isEqualTo: userId).snapshots().map((
      snapshot,
    ) {
      final orders = snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return OrderModel.fromJson(data);
      }).toList();

      orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return orders;
    });
  }

  Future<void> cancelOrder(String orderId) async {
    await _ordersRef.doc(orderId).update({
      'status': 'cancelled',
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    await _ordersRef.doc(orderId).update({
      'status': status,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<bool> hasUserPurchasedProduct({
    required String userId,
    required String productId,
  }) async {
    final snapshot = await _ordersRef
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'delivered')
        .get();

    for (final doc in snapshot.docs) {
      final orderData = doc.data();
      final items = orderData['items'] as List<dynamic>? ?? [];
      for (final item in items) {
        if (item['bookId'] == productId) {
          return true;
        }
      }
    }
    return false;
  }
}
