import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/cart_controller.dart';
import '../../controller/checkout_controller.dart';
import '../../routes/app_routes.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.find<CheckoutController>();
    final cartController = Get.find<CartController>();
    final catalogController = Get.find<BookCatalogController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Shipping address')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Recipient name'),
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone number'),
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _addressController,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Delivery address'),
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _noteController,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Note (optional)'),
            ),
            const SizedBox(height: 20),
            Obx(
              () => PrimaryButton(
                title: 'Place order',
                isLoading: checkoutController.isPlacingOrder.value,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  checkoutController.setShippingInfo(
                    name: _nameController.text.trim(),
                    phone: _phoneController.text.trim(),
                    deliveryAddress: _addressController.text.trim(),
                    customerNote: _noteController.text.trim(),
                  );

                  final total = cartController.totalPrice(catalogController);
                  final orderCode = await checkoutController.placeOrder(
                    cartController: cartController,
                    total: total,
                  );

                  if (orderCode != null) {
                    Get.offNamed(AppRoutes.orderConfirmation);
                    return;
                  }

                  if (checkoutController.lastErrorMessage.value.isNotEmpty) {
                    Get.snackbar(
                      'Order sync failed',
                      checkoutController.lastErrorMessage.value,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
