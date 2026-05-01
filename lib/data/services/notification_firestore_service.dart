import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationFirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<void> createOrderNotification({
    required String userId,
    required String orderId,
    required String orderStatus,
    required String message,
  }) async {
    await _db.collection('notifications').add({
      'userId': userId,
      'orderId': orderId,
      'orderStatus': orderStatus,
      'message': message,
      'isRead': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<NotificationModel>> getUserNotifications(String userId) {
    return _db
        .collection('notifications')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => NotificationModel.fromFirestore(doc))
              .toList();
        });
  }

  Future<void> markAsRead(String docId) async {
    await _db.collection('notifications').doc(docId).update({"isRead": true});
  }
}
