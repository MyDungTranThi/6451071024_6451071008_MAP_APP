import '../models/notification_model.dart';
import '../services/notification_firestore_service.dart';

class NotificationRepository {
  final NotificationFirestoreService _service = NotificationFirestoreService();

  Future<void> createOrderNotification({
    required String userId,
    required String orderId,
    required String orderStatus,
    required String message,
  }) {
    return _service.createOrderNotification(
      userId: userId,
      orderId: orderId,
      orderStatus: orderStatus,
      message: message,
    );
  }

  Stream<List<NotificationModel>> getUserNotifications(String userId) {
    return _service.getUserNotifications(userId);
  }

  Future<void> markAsRead(String docId) {
    return _service.markAsRead(docId);
  }
}
