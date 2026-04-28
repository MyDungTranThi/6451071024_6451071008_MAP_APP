import 'package:get/get.dart';

import '../data/models/order_model.dart';
import '../data/repositories/order_repository.dart';
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
    if (!hasShippingInfo || cartController.isEmpty) {
      return null;
    }

    isPlacingOrder.value = true;
    lastErrorMessage.value = '';

    final catalogController = Get.find<BookCatalogController>();

    final orderItems = <OrderItemModel>[];
    for (final entry in cartController.items.entries) {
      final book = catalogController.findById(entry.key);
      if (book == null) {
        continue;
      }

      orderItems.add(
        OrderItemModel(
          bookId: book.id,
          title: book.title,
          unitPrice: book.price,
          quantity: entry.value,
        ),
      );
    }

    if (orderItems.isEmpty) {
      lastErrorMessage.value =
          'No valid cart items to sync. Please refresh and try again.';
      isPlacingOrder.value = false;
      return null;
    }

    try {
      final orderCode =
          'ORD-${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}';

      final order = OrderModel(
        orderCode: orderCode,
        recipientName: recipientName.value,
        phoneNumber: phoneNumber.value,
        address: address.value,
        note: note.value,
        total: total,
        totalItems: cartController.totalItems,
        items: orderItems,
        createdAt: DateTime.now(),
      );

      await _orderRepository.createOrder(order);

      lastOrderCode.value = orderCode;
      lastOrderTotal.value = total;

      cartController.clear();

      return orderCode;
    } catch (_) {
      lastErrorMessage.value =
          'Cannot sync order to Firebase right now. Please try again.';
      return null;
    } finally {
      isPlacingOrder.value = false;
    }
  }
}
