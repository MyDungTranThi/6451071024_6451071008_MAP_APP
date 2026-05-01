import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/cart_controller.dart';
import '../../controller/checkout_controller.dart';
import '../../data/models/address_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/currency_formatter.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({super.key});

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  final CheckoutController checkout = Get.find<CheckoutController>();
  final CartController cart = Get.find<CartController>();
  final BookCatalogController catalog = Get.find<BookCatalogController>();
  final AddressController addressController = AddressController();
  final TextEditingController couponController = TextEditingController();
  final RxString paymentMethod = 'cash'.obs;
  final RxDouble discountAmount = 0.0.obs;
  final double shippingFee = 0.0;

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Kiểm tra đơn hàng',
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
        leading: const BackButton(),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildSectionTitle('Sản phẩm trong đơn'),
                  _buildCartItemsCard(),
                  _buildSectionTitle('Mã khuyến mãi'),
                  const SizedBox(height: 8),
                  _buildCouponCard(),
                  _buildSectionTitle('Phương thức thanh toán'),
                  const SizedBox(height: 8),
                  _buildPaymentCard(),
                  _buildSectionTitle('Địa chỉ giao hàng'),
                  _buildShippingCard(),
                ],
              ),
            ),
            _buildBottomCheckout(),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemsCard() {
    final lines = cart.lines;

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: lines.asMap().entries.map((entry) {
          final index = entry.key;
          final line = entry.value;
          final book = catalog.findById(line.key);
          if (book == null) return const SizedBox.shrink();

          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      book.coverImage,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.menu_book, size: 30),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        book.publisher,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Icon(Icons.verified, size: 14, color: Colors.blue),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '${book.title} (x${line.value})',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      CurrencyFormatter.formatVnd(book.price * line.value),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 18,
                    ),
                  ],
                ),
              ),
              if (index != lines.length - 1)
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Colors.grey.shade100,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCouponCard() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(Icons.confirmation_number_outlined, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: couponController,
              decoration: const InputDecoration(
                hintText: 'Nhập mã giảm giá',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            onPressed: () {
              if (couponController.text.trim().isEmpty) {
                Get.snackbar('Thông báo', 'Vui lòng nhập mã');
                return;
              }

              discountAmount.value = 0;
              Get.snackbar('Thông báo', 'Mã khuyến mãi chưa được hỗ trợ');
            },
            child: const Text('Áp dụng'),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPaymentOption(
            title: 'Tiền mặt khi nhận hàng (COD)',
            value: 'cash',
            icon: Icons.payments_outlined,
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          _buildPaymentOption(
            title: 'Chuyển khoản ngân hàng',
            value: 'bank',
            icon: Icons.account_balance_outlined,
          ),
          Obx(() {
            if (paymentMethod.value != 'bank') return const SizedBox.shrink();

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Column(
                children: [
                  const Text(
                    'Quét mã để thanh toán',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Image.network(
                      'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=S-Store-payment',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildShippingCard() {
    return StreamBuilder<List<AddressModel>>(
      stream: addressController.getAddresses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.only(top: 8, bottom: 30),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return _buildAddressMessageCard(
            icon: Icons.error_outline,
            title: 'Không thể tải địa chỉ',
            message: 'Vui lòng kiểm tra kết nối và thử lại.',
            actionText: 'Thử lại',
            onPressed: () => setState(() {}),
          );
        }

        final addresses = snapshot.data ?? <AddressModel>[];
        if (addresses.isEmpty) {
          if (checkout.hasShippingInfo) {
            checkout.setShippingInfo(
              name: '',
              phone: '',
              deliveryAddress: '',
              customerNote: '',
            );
          }

          return _buildAddressMessageCard(
            icon: Icons.location_off_outlined,
            title: 'Bạn chưa có địa chỉ giao hàng',
            message:
                'Hãy thêm địa chỉ trong mục Địa chỉ của tôi trước khi đặt hàng.',
            actionText: 'Thêm địa chỉ',
            onPressed: () => Get.toNamed(AppRoutes.myShippingAddressview),
          );
        }

        final selectedAddress = _resolveSelectedAddress(addresses);
        if (selectedAddress != null) {
          _syncSelectedAddress(selectedAddress);
        }

        return Container(
          margin: const EdgeInsets.only(top: 8, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.location_on, color: Colors.blue),
                ),
                title: Text(
                  selectedAddress?.fullAddress ?? 'Chưa chọn địa chỉ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    selectedAddress == null
                        ? 'Vui lòng chọn địa chỉ giao hàng'
                        : 'Người nhận: ${selectedAddress.receiverName}\nSố điện thoại: ${selectedAddress.phoneNumber}',
                  ),
                ),
                trailing: TextButton(
                  onPressed: () => _showAddressSelector(addresses),
                  child: const Text(
                    'Chọn',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade100),
              TextButton.icon(
                onPressed: () => Get.toNamed(AppRoutes.myShippingAddressview),
                icon: const Icon(Icons.add_location_alt_outlined, size: 18),
                label: const Text('Quản lý / thêm địa chỉ khác'),
              ),
            ],
          ),
        );
      },
    );
  }

  AddressModel? _resolveSelectedAddress(List<AddressModel> addresses) {
    if (addresses.isEmpty) return null;

    final selectedFullAddress = checkout.address.value;
    if (selectedFullAddress.isNotEmpty) {
      for (final address in addresses) {
        if (address.fullAddress == selectedFullAddress) {
          return address;
        }
      }
    }

    for (final address in addresses) {
      if (address.isDefault) return address;
    }

    return addresses.first;
  }

  void _syncSelectedAddress(AddressModel address) {
    if (checkout.address.value == address.fullAddress &&
        checkout.recipientName.value == address.receiverName &&
        checkout.phoneNumber.value == address.phoneNumber) {
      return;
    }

    checkout.setShippingInfo(
      name: address.receiverName,
      phone: address.phoneNumber,
      deliveryAddress: address.fullAddress,
      customerNote: checkout.note.value,
    );
  }

  void _showAddressSelector(List<AddressModel> addresses) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxHeight: 520),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: SizedBox(
                  width: 48,
                  child: Divider(thickness: 4, color: Colors.black26),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Chọn địa chỉ giao hàng',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    final isSelected =
                        checkout.address.value == address.fullAddress;

                    return RadioListTile<String>(
                      value: address.fullAddress,
                      groupValue: checkout.address.value,
                      activeColor: Colors.blue,
                      onChanged: (_) {
                        _syncSelectedAddress(address);
                        Get.back();
                      },
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              address.receiverName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (address.isDefault)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Mặc định',
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          if (isSelected) const SizedBox(width: 8),
                          if (isSelected)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 18,
                            ),
                        ],
                      ),
                      subtitle: Text(
                        '${address.phoneNumber}\n${address.fullAddress}',
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.myShippingAddressview);
                  },
                  icon: const Icon(Icons.add_location_alt_outlined),
                  label: const Text('Thêm địa chỉ mới'),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildAddressMessageCard({
    required IconData icon,
    required String title,
    required String message,
    required String actionText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8, bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 44, color: Colors.blue.shade300),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            message,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
            ),
            child: Text(actionText),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCheckout() {
    final subtotal = cart.totalPrice(catalog);
    final total = (subtotal + shippingFee - discountAmount.value)
        .clamp(0, double.infinity)
        .toDouble();

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _row('Tạm tính', subtotal),
            const SizedBox(height: 8),
            _row('Phí vận chuyển', shippingFee),
            const SizedBox(height: 8),
            _row('Giảm giá', -discountAmount.value, color: Colors.red),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(),
            ),
            _row(
              'Tổng thanh toán',
              total,
              bold: true,
              fontSize: 18,
              color: Colors.blue.shade800,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.blue.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: checkout.isPlacingOrder.value
                    ? null
                    : () async {
                        if (!checkout.hasShippingInfo) {
                          Get.snackbar(
                            'Lỗi',
                            'Vui lòng chọn địa chỉ giao hàng từ Địa chỉ của tôi',
                            backgroundColor: Colors.red.shade400,
                            colorText: Colors.white,
                          );
                          return;
                        }

                        final code = await checkout.placeOrder(
                          cartController: cart,
                          total: total,
                        );

                        if (code != null) {
                          Get.offNamed(AppRoutes.orderConfirmation);
                          return;
                        }

                        if (checkout.lastErrorMessage.value.isNotEmpty) {
                          Get.snackbar(
                            'Lỗi',
                            checkout.lastErrorMessage.value,
                            backgroundColor: Colors.red.shade400,
                            colorText: Colors.white,
                          );
                        }
                      },
                child: checkout.isPlacingOrder.value
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'XÁC NHẬN ĐẶT HÀNG',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D2D2D),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Obx(() {
      final isSelected = paymentMethod.value == value;

      return InkWell(
        onTap: () => paymentMethod.value = value,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: RadioListTile<String>(
            value: value,
            groupValue: paymentMethod.value,
            onChanged: (newValue) => paymentMethod.value = newValue!,
            activeColor: Colors.blue,
            secondary: Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.black87,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _row(
    String label,
    double value, {
    Color? color,
    bool bold = false,
    double? fontSize,
  }) {
    final text = value < 0
        ? '- ${CurrencyFormatter.formatVnd(value.abs())}'
        : CurrencyFormatter.formatVnd(value);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: bold ? Colors.black87 : Colors.grey,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize ?? 14,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: bold ? FontWeight.bold : FontWeight.w500,
            fontSize: fontSize ?? 14,
          ),
        ),
      ],
    );
  }
}
