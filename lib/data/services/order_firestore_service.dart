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
      'serverCreatedAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }
}
