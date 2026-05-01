import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../controller/notification_controller.dart';
import '../../controller/order_controller.dart';
import '../../data/models/notification_model.dart';
import '../../routes/app_routes.dart';

class MyNotificationsScreen extends StatelessWidget {
  const MyNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
        Get.find<NotificationController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Thông báo'), centerTitle: true),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_off_outlined,
                  size: 80,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Chưa có thông báo nào",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final noti = controller.notifications[index];
            return _buildNotificationItem(noti, controller);
          },
        );
      }),
    );
  }

  Widget _buildNotificationItem(
    NotificationModel noti,
    NotificationController controller,
  ) {
    IconData iconData;
    Color iconColor;

    switch (noti.orderStatus) {
      case 'processing':
        iconData = Icons.inventory_2;
        iconColor = Colors.orange;
        break;
      case 'shipping':
        iconData = Icons.local_shipping;
        iconColor = Colors.blue;
        break;
      case 'delivered':
        iconData = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case 'cancelled':
        iconData = Icons.cancel;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.notifications;
        iconColor = Colors.grey;
    }

    return InkWell(
      onTap: () async {
        await controller.markAsRead(noti);
        if (noti.orderId.isEmpty) return;

        final order = Get.find<OrderController>().findOrderById(noti.orderId);
        if (order == null) {
          Get.snackbar('Thông báo', 'Không tìm thấy đơn hàng tương ứng');
          return;
        }

        Get.toNamed(AppRoutes.orderDetail, arguments: order);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: noti.isRead ? Colors.white : Colors.blue.shade50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noti.message,
                    style: TextStyle(
                      fontWeight: noti.isRead
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    timeago.format(noti.createdAt, locale: 'vi'),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
