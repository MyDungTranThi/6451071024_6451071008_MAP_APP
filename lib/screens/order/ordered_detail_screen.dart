import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../controller/auth_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/order_controller.dart';
import '../../data/models/order_model.dart';
import '../../data/models/review_model.dart';
import '../../data/repositories/review_repository.dart';
import '../../routes/app_routes.dart';
import '../../utils/currency_formatter.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = Get.arguments as OrderModel;
    final catalog = Get.find<BookCatalogController>();
    final orderController = Get.find<OrderController>();
    final reviewRepository = Get.find<ReviewRepository>();
    final currentUser = Get.find<AuthController>().currentUser.value;
    final orderCode = order.orderCode.isNotEmpty
        ? order.orderCode
        : 'ORD-${order.id.length >= 8 ? order.id.substring(0, 8) : order.id}';
    final canCancel = orderController.canCancel(order);
    final isDelivered = order.status == OrderController.deliveredStatus;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Chi tiết đơn hàng',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade700, Colors.blue.shade400],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _OrderHeader(order: order, orderCode: orderCode),
            const SizedBox(height: 16),
            _DeliveryStepper(status: order.status),
            const SizedBox(height: 16),
            const Text(
              'Sản phẩm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...order.items.map((item) {
              final book = catalog.findById(item.bookId);
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    if (book != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          book.coverImage,
                          width: 50,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book?.title ?? item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Số lượng: ${item.quantity}'),
                          if (isDelivered &&
                              book != null &&
                              currentUser != null)
                            _ReviewActionButton(
                              orderId: order.id,
                              productId: book.id,
                              userId: currentUser.id,
                              reviewRepository: reviewRepository,
                              onWriteReview: () => Get.toNamed(
                                AppRoutes.writeReview,
                                arguments: {'book': book, 'orderId': order.id},
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      CurrencyFormatter.formatVnd(
                        item.unitPrice * item.quantity,
                      ),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tổng cộng',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CurrencyFormatter.formatVnd(order.total),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            if (canCancel) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _confirmCancel(orderController, order),
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Hủy đơn hàng'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red.shade700,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _confirmCancel(OrderController controller, OrderModel order) {
    Get.defaultDialog(
      title: 'Hủy đơn hàng',
      middleText: 'Bạn có chắc muốn hủy đơn hàng mới tạo này?',
      textConfirm: 'Hủy đơn',
      textCancel: 'Đóng',
      confirmTextColor: Colors.white,
      onConfirm: () {
        controller.cancelOrder(order.id);
        Get.back();
        Get.back();
      },
    );
  }
}

class _ReviewActionButton extends StatelessWidget {
  const _ReviewActionButton({
    required this.orderId,
    required this.productId,
    required this.userId,
    required this.reviewRepository,
    required this.onWriteReview,
  });

  final String orderId;
  final String productId;
  final String userId;
  final ReviewRepository reviewRepository;
  final VoidCallback onWriteReview;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReviewModel?>(
      future: reviewRepository.getUserReviewForOrderProduct(
        userId: userId,
        orderId: orderId,
        productId: productId,
      ),
      builder: (context, snapshot) {
        final hasReview = snapshot.data != null;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;

        return TextButton.icon(
          onPressed: isLoading || hasReview ? null : onWriteReview,
          icon: Icon(
            hasReview ? Icons.check_circle_outline : Icons.rate_review_outlined,
          ),
          label: Text(
            isLoading
                ? 'Đang kiểm tra...'
                : hasReview
                ? 'Đã đánh giá'
                : 'Viết đánh giá',
          ),
        );
      },
    );
  }
}

class _OrderHeader extends StatelessWidget {
  const _OrderHeader({required this.order, required this.orderCode});

  final OrderModel order;
  final String orderCode;

  @override
  Widget build(BuildContext context) {
    final status = _statusInfo(order.status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Mã đơn: $orderCode',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                status.label,
                style: TextStyle(
                  color: status.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('Ngày đặt: ${timeago.format(order.createdAt, locale: 'vi')}'),
          Text('Địa chỉ: ${order.address}'),
          Text(
            'Phương thức thanh toán: ${order.paymentMethod == 'COD' ? 'Tiền mặt' : 'Chuyển khoản'}',
          ),
        ],
      ),
    );
  }
}

class _DeliveryStepper extends StatelessWidget {
  const _DeliveryStepper({required this.status});

  final String status;

  static const _steps = [
    _OrderStep(OrderController.createdStatus, 'Chờ duyệt'),
    _OrderStep(OrderController.processingStatus, 'Đang xử lý'),
    _OrderStep(OrderController.shippingStatus, 'Đang giao'),
    _OrderStep(OrderController.deliveredStatus, 'Đã giao'),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(status);
    final isStopped =
        status == OrderController.cancelledStatus ||
        status == OrderController.returnedStatus;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hành trình giao hàng',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final completed = !isStopped && index <= currentIndex;
            final color = completed ? Colors.blue.shade700 : Colors.grey;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: color,
                      child: Icon(
                        completed ? Icons.check : Icons.circle,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                    if (index != _steps.length - 1)
                      Container(
                        width: 2,
                        height: 28,
                        color: Colors.grey.shade300,
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    step.label,
                    style: TextStyle(
                      color: color,
                      fontWeight: completed ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          }),
          if (isStopped) ...[
            const SizedBox(height: 8),
            Text(
              status == OrderController.cancelledStatus
                  ? 'Đơn hàng đã bị hủy.'
                  : 'Đơn hàng đã được hoàn trả.',
              style: TextStyle(
                color: status == OrderController.cancelledStatus
                    ? Colors.red
                    : Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  int _currentIndex(String status) {
    if (status == OrderController.pendingStatus) return 0;
    final index = _steps.indexWhere((step) => step.status == status);
    return index == -1 ? 0 : index;
  }
}

class _OrderStep {
  const _OrderStep(this.status, this.label);

  final String status;
  final String label;
}

_OrderStatusInfo _statusInfo(String status) {
  switch (status) {
    case OrderController.createdStatus:
    case OrderController.pendingStatus:
      return _OrderStatusInfo('Chờ duyệt', Colors.deepOrange);
    case OrderController.processingStatus:
      return _OrderStatusInfo('Đang xử lý', Colors.orange);
    case OrderController.shippingStatus:
      return _OrderStatusInfo('Đang giao', Colors.blue);
    case OrderController.deliveredStatus:
      return _OrderStatusInfo('Đã giao', Colors.green);
    case OrderController.cancelledStatus:
      return _OrderStatusInfo('Đã hủy', Colors.red);
    case OrderController.returnedStatus:
      return _OrderStatusInfo('Hoàn trả', Colors.purple);
    default:
      return _OrderStatusInfo('Đang xử lý', Colors.orange);
  }
}

class _OrderStatusInfo {
  const _OrderStatusInfo(this.label, this.color);

  final String label;
  final Color color;
}
