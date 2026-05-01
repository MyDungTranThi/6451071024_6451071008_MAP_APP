import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
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
  void initState() {
    super.initState();
    final checkout = Get.find<CheckoutController>();
    _nameController.text = checkout.recipientName.value;
    _phoneController.text = checkout.phoneNumber.value;
    _addressController.text = checkout.address.value;
    _noteController.text = checkout.note.value;
  }

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

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Địa chỉ giao hàng',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildInputCard(
              child: Column(
                children: [
                  _buildTextField(
                    controller: _nameController,
                    label: 'Người nhận',
                    hint: 'Nhập họ và tên người nhận',
                    icon: Icons.person_outline,
                    validatorMessage: 'Vui lòng nhập tên người nhận',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Số điện thoại',
                    hint: 'Nhập số điện thoại',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validatorMessage: 'Vui lòng nhập số điện thoại',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _addressController,
                    label: 'Địa chỉ nhận hàng',
                    hint: 'Số nhà, đường, phường/xã, quận/huyện, tỉnh/thành',
                    icon: Icons.location_on_outlined,
                    maxLines: 3,
                    validatorMessage: 'Vui lòng nhập địa chỉ giao hàng',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _noteController,
                    label: 'Ghi chú',
                    hint: 'Ghi chú cho người bán hoặc đơn vị vận chuyển',
                    icon: Icons.sticky_note_2_outlined,
                    maxLines: 2,
                    required: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => PrimaryButton(
                title: 'Tiếp tục kiểm tra đơn hàng',
                isLoading: checkoutController.isPlacingOrder.value,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  checkoutController.setShippingInfo(
                    name: _nameController.text.trim(),
                    phone: _phoneController.text.trim(),
                    deliveryAddress: _addressController.text.trim(),
                    customerNote: _noteController.text.trim(),
                  );

                  Get.toNamed(AppRoutes.orderReview);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_shipping_outlined,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thông tin nhận hàng',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  'Vui lòng nhập đầy đủ thông tin để đơn hàng được giao chính xác.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? validatorMessage,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool required = true,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue.shade700, width: 1.4),
        ),
      ),
      validator: required
          ? (value) => (value == null || value.trim().isEmpty)
                ? validatorMessage ?? 'Vui lòng nhập thông tin'
                : null
          : null,
    );
  }
}
