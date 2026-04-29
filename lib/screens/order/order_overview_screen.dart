import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/checkout_controller.dart';
import '../../routes/app_routes.dart';
// TODO: OrderController chưa tồn tại, tạm dùng CheckoutController có sẵn
// import '../../controller/order_controller.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({super.key});

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  final CheckoutController checkout = Get.find<CheckoutController>();
  final CartController cart = Get.find<CartController>();
  final BookCatalogController catalog = Get.find<BookCatalogController>();
  final TextEditingController couponController = TextEditingController();
  final RxString paymentMethod = 'cash'.obs;

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
        title: const Text("Kiểm tra đơn hàng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                  _buildSectionTitle("Sách trong đơn"),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))],
                    ),
                    child: Column(
                      children: cart.lines.asMap().entries.map((entry) {
                        final index = entry.key;
                        final line = entry.value;
                        final book = catalog.findById(line.key);
                        if (book == null) return const SizedBox.shrink();
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.shade100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(book.coverImage, width: 60, height: 60, fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => const Icon(Icons.menu_book, size: 30)),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(book.publisher,
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700, fontSize: 13)),
                                  ),
                                  const Icon(Icons.verified, size: 14, color: Colors.blue),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text("${book.title} (x${line.value})",
                                  style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                              ),
                              trailing: Text('\$${(book.price * line.value).toStringAsFixed(2)}',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            if (index != cart.lines.length - 1)
                              Divider(height: 1, indent: 16, endIndent: 16, color: Colors.grey.shade100),
                          ],
                        );
                      }).toList(),
                    ),
                  ),

                  _buildSectionTitle("Mã khuyến mãi"),
                  const SizedBox(height: 8),
                  Container(
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
                            decoration: const InputDecoration(hintText: "Nhập mã giảm giá", border: InputBorder.none, hintStyle: TextStyle(fontSize: 14)),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (couponController.text.isEmpty) {
                              Get.snackbar("Thông báo", "Vui lòng nhập mã");
                            }
                            // TODO: Implement coupon logic
                          },
                          child: const Text("Áp dụng"),
                        ),
                      ],
                    ),
                  ),

                  _buildSectionTitle("Phương thức thanh toán"),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        _buildPaymentOption(title: "Tiền mặt khi nhận hàng (COD)", value: "cash", icon: Icons.payments_outlined),
                        Divider(height: 1, color: Colors.grey.shade100),
                        _buildPaymentOption(title: "Chuyển khoản ngân hàng", value: "bank", icon: Icons.account_balance_outlined),
                      ],
                    ),
                  ),

                  _buildSectionTitle("Thông tin giao hàng"),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 30),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.location_on, color: Colors.blue),
                      ),
                      title: Obx(() => Text(
                        checkout.address.value.isNotEmpty ? checkout.address.value : "Chưa thiết lập",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )),
                      subtitle: Obx(() => Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text("SĐT: ${checkout.phoneNumber.value.isNotEmpty ? checkout.phoneNumber.value : 'Chưa nhập'}"),
                      )),
                      trailing: TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.shippingAddress),
                        child: const Text("Thay đổi", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildBottomCheckout(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCheckout() {
    final total = cart.totalPrice(catalog);
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, -5))],
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _row("Tạm tính", total),
            const SizedBox(height: 8),
            _row("Phí vận chuyển", 0.0),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider()),
            _row("Tổng thanh toán", total, bold: true, fontSize: 18, color: Colors.blue.shade800),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () async {
                  if (!checkout.hasShippingInfo) {
                    Get.snackbar("Lỗi", "Vui lòng nhập địa chỉ giao hàng",
                      backgroundColor: Colors.red.shade400, colorText: Colors.white);
                    return;
                  }
                  final code = await checkout.placeOrder(cartController: cart, total: total);
                  if (code != null) {
                    Get.offNamed(AppRoutes.orderConfirmation);
                  }
                },
                child: const Text("XÁC NHẬN ĐẶT HÀNG", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2D2D2D)));
  }

  Widget _buildPaymentOption({required String title, required String value, required IconData icon}) {
    return Obx(() {
      final isSelected = paymentMethod.value == value;
      return InkWell(
        onTap: () => paymentMethod.value = value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.black87,
                )),
              ),
              Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: isSelected ? Colors.blue : Colors.grey),
            ],
          ),
        ),
      );
    });
  }

  Widget _row(String label, double val, {Color? color, bool bold = false, double? fontSize}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(
          color: bold ? Colors.black87 : Colors.grey,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize ?? 14,
        )),
        Text("\$${val.toStringAsFixed(2)}", style: TextStyle(
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.w500,
          fontSize: fontSize ?? 14,
        )),
      ],
    );
  }
}
