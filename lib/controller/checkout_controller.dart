import 'package:get/get.dart';

import '../data/models/order_model.dart';
import '../data/repositories/order_repository.dart';
import 'auth_controller.dart';
import 'book_catalog_controller.dart';
import 'cart_controller.dart';

class CheckoutController extends GetxController {
  CheckoutController(this._orderRepository);

  final OrderRepository _orderRepository;

  final RxString recipientName = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString address = ''.obs;
  final RxString note = ''.obs;

  final RxBool isPlacingOrder = false.obs;
  final RxString lastOrderCode = ''.obs;
  final RxDouble lastOrderTotal = 0.0.obs;
  final RxString lastErrorMessage = ''.obs;

  bool get hasShippingInfo =>
      recipientName.value.isNotEmpty &&
      phoneNumber.value.isNotEmpty &&
      address.value.isNotEmpty;

  void setShippingInfo({
    required String name,
    required String phone,
    required String deliveryAddress,
    String customerNote = '',
  }) {
    recipientName.value = name;
    phoneNumber.value = phone;
    address.value = deliveryAddress;
    note.value = customerNote;
  }

  Future<String?> placeOrder({
    required CartController cartController,
    required double total,
  }) async {
    lastErrorMessage.value = '';

    if (!hasShippingInfo) {
      lastErrorMessage.value = 'Vui lòng chọn địa chỉ giao hàng.';
      return null;
    }

    if (cartController.isEmpty) {
      lastErrorMessage.value = 'Giỏ hàng đang trống.';
      return null;
    }

    final user = Get.find<AuthController>().currentUser.value;
    if (user == null || user.id.isEmpty) {
      lastErrorMessage.value = 'Vui lòng đăng nhập lại trước khi đặt hàng.';
      return null;
    }

    isPlacingOrder.value = true;

    final catalogController = Get.find<BookCatalogController>();

    final orderItems = <OrderItemModel>[];
    for (final entry in cartController.items.entries) {
      final book = catalogController.findById(entry.key);
      if (book == null) {
        continue;
      }

      final salePrice = book.salePrice;
      final unitPrice =
          salePrice != null && salePrice > 0 && salePrice < book.price
          ? salePrice
          : book.price;

      orderItems.add(
        OrderItemModel(
          bookId: book.id,
          title: book.title,
          unitPrice: unitPrice,
          quantity: entry.value,
        ),
      );
    }

    if (orderItems.isEmpty) {
      lastErrorMessage.value =
          'Không tìm thấy sản phẩm hợp lệ. Vui lòng tải lại và thử lại.';
      isPlacingOrder.value = false;
      return null;
    }

    try {
      final orderCode =
          'ORD-${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}';

      final order = OrderModel(
        id: '',
        userId: user.id,
        orderCode: orderCode,
        recipientName: recipientName.value,
        phoneNumber: phoneNumber.value,
        address: address.value,
        note: note.value,
        total: total,
        totalItems: cartController.totalItems,
        items: orderItems,
        createdAt: DateTime.now(),
        status: 'created',
      );

      await _orderRepository.createOrder(order);

      lastOrderCode.value = orderCode;
      lastOrderTotal.value = total;

      await cartController.clear();

      return orderCode;
    } catch (_) {
      lastErrorMessage.value =
          'Không thể đồng bộ đơn hàng lên Firebase. Vui lòng thử lại.';
      return null;
    } finally {
      isPlacingOrder.value = false;
    }
  }
}
