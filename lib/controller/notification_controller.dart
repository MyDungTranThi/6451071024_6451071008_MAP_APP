import 'package:get/get.dart';
import '../data/models/notification_model.dart';
import '../data/models/user_model.dart';
import '../data/repositories/notification_repository.dart';
import 'auth_controller.dart';

class NotificationController extends GetxController {
  NotificationController(this._repository);

  final NotificationRepository _repository;
  
  final notifications = <NotificationModel>[].obs;
  final unreadCount = 0.obs;

  late AuthController authController;

  @override
  void onInit() {
    super.onInit();
    authController = Get.find<AuthController>();
    
    // Listen to current user changes
    ever(authController.currentUser, (UserModel? user) {
      if (user != null) {
        _repository.getUserNotifications(user.id).listen((data) {
          notifications.value = data;
          unreadCount.value = data.where((n) => n.isRead == false).length;
        });
      } else {
        notifications.clear();
        unreadCount.value = 0;
      }
    });

    // Initial check
    final user = authController.currentUser.value;
    if (user != null) {
      _repository.getUserNotifications(user.id).listen((data) {
        notifications.value = data;
        unreadCount.value = data.where((n) => n.isRead == false).length;
      });
    }
  }

  Future<void> markAsRead(NotificationModel noti) async {
    if (noti.isRead) return;
    await _repository.markAsRead(noti.id);
  }
}
