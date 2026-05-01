import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../controller/order_controller.dart';
import '../../data/models/order_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/currency_formatter.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<OrderController>()
        ? Get.find<OrderController>()
        : Get.put(OrderController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.orders.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.orders.isEmpty) {
                return _buildEmptyState(controller);
              }

              final filteredOrders = controller.filteredOrders;

              return RefreshIndicator(
                onRefresh: controller.fetchMyOrders,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: filteredOrders.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _OrderFilterBar(controller: controller);
                    }

                    final order = filteredOrders[index - 1];
                    return _OrderCard(
                      order: order,
                      canCancel: controller.canCancel(order),
                      onCancel: () => _confirmCancel(controller, order),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade700, Colors.blue.shade400],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Đơn hàng của tôi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 2, 24, 24),
              child: Text(
                'Theo dõi trạng thái, thông tin giao hàng và tổng thanh toán của các đơn sách đã đặt.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(OrderController controller) {
    return RefreshIndicator(
      onRefresh: controller.fetchMyOrders,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 28),
        children: [
          const SizedBox(height: 110),
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.receipt_long_outlined,
              size: 78,
              color: Colors.blue.shade200,
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Chưa có đơn hàng nào',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sau khi đặt hàng thành công, đơn hàng sẽ tự động hiển thị tại đây.',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          ElevatedButton.icon(
            onPressed: controller.fetchMyOrders,
            icon: const Icon(Icons.refresh),
            label: const Text('Tải lại đơn hàng'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmCancel(OrderController controller, OrderModel order) {
    Get.defaultDialog(
      title: 'Hủy đơn',
      middleText: 'Bạn có chắc muốn hủy đơn hàng này?',
      textConfirm: 'Đồng ý',
      textCancel: 'Đóng',
      confirmTextColor: Colors.white,
      onConfirm: () {
        controller.cancelOrder(order.id);
        Get.back();
      },
    );
  }
}

class _OrderFilterBar extends StatelessWidget {
  const _OrderFilterBar({required this.controller});

  final OrderController controller;

  static const _filters = [
    _OrderStatusFilter(OrderController.allStatusFilter, 'Tất cả'),
    _OrderStatusFilter(OrderController.createdStatus, 'Chờ duyệt'),
    _OrderStatusFilter(OrderController.processingStatus, 'Đang xử lý'),
    _OrderStatusFilter(OrderController.shippingStatus, 'Đang giao'),
    _OrderStatusFilter(OrderController.deliveredStatus, 'Đã giao'),
    _OrderStatusFilter(OrderController.cancelledStatus, 'Đã hủy'),
    _OrderStatusFilter(OrderController.returnedStatus, 'Hoàn trả'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: controller.updateSearchQuery,
          decoration: InputDecoration(
            hintText: 'Tìm kiếm theo mã đơn hàng',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final filter = _filters[index];
              final selected = controller.selectedStatus.value == filter.value;
              return ChoiceChip(
                label: Text(filter.label),
                selected: selected,
                selectedColor: Colors.blue.shade700,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : Colors.blueGrey.shade700,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                ),
                onSelected: (_) => controller.selectStatus(filter.value),
              );
            },
          ),
        ),
        if (controller.filteredOrders.isNotEmpty)
          const SizedBox(height: 16)
        else
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              'Không tìm thấy đơn hàng phù hợp.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
      ],
    );
  }
}

class _OrderStatusFilter {
  const _OrderStatusFilter(this.value, this.label);

  final String value;
  final String label;
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.order,
    required this.canCancel,
    required this.onCancel,
  });

  final OrderModel order;
  final bool canCancel;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final status = _statusInfo(order.status);
    final orderCode = order.orderCode.isNotEmpty
        ? order.orderCode
        : 'ORD-${order.id.length >= 8 ? order.id.substring(0, 8) : order.id}';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.local_shipping_outlined,
                  color: Colors.blue.shade700,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderCode,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Đặt ${timeago.format(order.createdAt, locale: 'vi')}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusChip(label: status.label, color: status.color),
            ],
          ),
          const SizedBox(height: 16),
          _InfoRow(
            icon: Icons.person_outline,
            text: '${order.recipientName} • ${order.phoneNumber}',
          ),
          const SizedBox(height: 8),
          _InfoRow(icon: Icons.location_on_outlined, text: order.address),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _SummaryItem(
                    label: 'Sản phẩm',
                    value: '${order.totalItems} cuốn',
                  ),
                ),
                Container(width: 1, height: 34, color: Colors.grey.shade200),
                Expanded(
                  child: _SummaryItem(
                    label: 'Thanh toán',
                    value: CurrencyFormatter.formatVnd(order.total),
                    highlight: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () =>
                      Get.toNamed(AppRoutes.orderDetail, arguments: order),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue.shade700,
                    side: BorderSide(color: Colors.blue.shade100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Chi tiết'),
                ),
              ),
              if (canCancel) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                      foregroundColor: Colors.red.shade600,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('Hủy đơn'),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
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
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade500),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black87, height: 1.35),
          ),
        ),
      ],
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: highlight ? Colors.blue.shade800 : Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _OrderStatusInfo {
  const _OrderStatusInfo(this.label, this.color);

  final String label;
  final Color color;
}
