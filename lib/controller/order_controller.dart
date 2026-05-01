import 'dart:async';

import 'package:get/get.dart';

import '../data/models/order_model.dart';
import '../data/models/user_model.dart';
import '../data/repositories/notification_repository.dart';
import '../data/repositories/order_repository.dart';
import 'auth_controller.dart';

class OrderController extends GetxController {
  final OrderRepository _repository = Get.find<OrderRepository>();
  final NotificationRepository _notificationRepository =
      Get.find<NotificationRepository>();
  final AuthController _authController = Get.find<AuthController>();

  static const allStatusFilter = 'all';
  static const createdStatus = 'created';
  static const pendingStatus = 'pending';
  static const processingStatus = 'processing';
  static const shippingStatus = 'shipping';
  static const deliveredStatus = 'delivered';
  static const cancelledStatus = 'cancelled';
  static const returnedStatus = 'returned';

  final RxBool isLoading = false.obs;
  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final RxString selectedStatus = allStatusFilter.obs;
  final RxString searchQuery = ''.obs;

  Worker? _userWorker;
  StreamSubscription<List<OrderModel>>? _ordersSubscription;

  @override
  void onInit() {
    super.onInit();
    _userWorker = ever<UserModel?>(_authController.currentUser, (user) {
      _listenToOrders(user?.id ?? '');
    });
    _listenToOrders(_authController.currentUser.value?.id ?? '');
  }

  @override
  void onClose() {
    _userWorker?.dispose();
    _ordersSubscription?.cancel();
    super.onClose();
  }

  Future<void> fetchMyOrders() async {
    final userId = _authController.currentUser.value?.id ?? '';
    if (userId.isEmpty) {
      orders.clear();
      return;
    }

    isLoading.value = true;
    try {
      final userOrders = await _repository.fetchUserOrders(userId);
      orders.assignAll(userOrders);
    } catch (_) {
      Get.snackbar('Lỗi', 'Không thể tải danh sách đơn hàng');
    } finally {
      isLoading.value = false;
    }
  }

  void _listenToOrders(String userId) {
    _ordersSubscription?.cancel();

    if (userId.isEmpty) {
      orders.clear();
      isLoading.value = false;
      return;
    }

    isLoading.value = true;
    _ordersSubscription = _repository
        .watchUserOrders(userId)
        .listen(
          (userOrders) {
            orders.assignAll(userOrders);
            isLoading.value = false;
          },
          onError: (_) {
            isLoading.value = false;
            Get.snackbar('Lỗi', 'Không thể tải danh sách đơn hàng');
          },
        );
  }

  List<OrderModel> get filteredOrders {
    final status = selectedStatus.value;
    final query = searchQuery.value.trim().toLowerCase();

    return orders.where((order) {
      final matchesStatus = status == allStatusFilter || order.status == status;
      final orderCode = order.orderCode.isNotEmpty ? order.orderCode : order.id;
      final matchesQuery =
          query.isEmpty || orderCode.toLowerCase().contains(query);
      return matchesStatus && matchesQuery;
    }).toList();
  }

  void selectStatus(String status) {
    selectedStatus.value = status;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  bool canCancel(OrderModel order) => order.status == createdStatus;

  OrderModel? findOrderById(String orderId) {
    return orders.firstWhereOrNull((order) => order.id == orderId);
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      final order = orders.firstWhereOrNull((item) => item.id == orderId);
      if (order == null) {
        Get.snackbar('Lỗi', 'Không tìm thấy đơn hàng');
        return;
      }

      await _repository.updateOrderStatus(orderId, status);
      await _notificationRepository.createOrderNotification(
        userId: order.userId,
        orderId: order.id,
        orderStatus: status,
        message: _statusNotificationMessage(order, status),
      );

      final index = orders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        orders[index] = order.copyWith(status: status);
      }
    } catch (_) {
      Get.snackbar('Lỗi', 'Không thể cập nhật trạng thái đơn hàng');
    }
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      final order = orders.firstWhereOrNull((item) => item.id == orderId);
      if (order == null || !canCancel(order)) {
        Get.snackbar('Không thể hủy', 'Chỉ đơn hàng mới tạo mới được hủy.');
        return;
      }

      await updateOrderStatus(orderId, cancelledStatus);
      Get.snackbar('Thành công', 'Đã hủy đơn hàng');
    } catch (_) {
      Get.snackbar('Lỗi', 'Không thể hủy đơn hàng');
    }
  }

  String _statusNotificationMessage(OrderModel order, String status) {
    final orderCode = order.orderCode.isNotEmpty ? order.orderCode : order.id;
    final label = switch (status) {
      createdStatus => 'đang chờ duyệt',
      pendingStatus => 'đang chờ duyệt',
      processingStatus => 'đang xử lý',
      shippingStatus => 'đang giao',
      deliveredStatus => 'đã giao thành công',
      cancelledStatus => 'đã được hủy',
      returnedStatus => 'đã hoàn trả',
      _ => 'đã được cập nhật',
    };

    return 'Đơn hàng $orderCode $label.';
  }
}
