import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/cart_controller.dart';
import '../../controller/product_detail_controller.dart';
import '../../data/models/book_model.dart';
// TODO: Các import sau sẽ bổ sung khi tạo controller tương ứng
// import '../../controller/order_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final bookId = args?['bookId'] as String? ?? '';
    final catalogController = Get.find<BookCatalogController>();
    final detailController = Get.find<ProductDetailController>();
    final cartController = Get.find<CartController>();

    final book = catalogController.findById(bookId);

    if (book == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Không tìm thấy')),
        body: const Center(child: Text('Sách không tồn tại.')),
      );
    }

    detailController.initForBook(book);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                pinned: true,
                stretch: true,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: BackButton(color: Colors.blue.shade800),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    book.coverImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.menu_book, size: 80),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Publisher
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.store, color: Colors.blue.shade700, size: 20),
                          ),
                          const SizedBox(width: 8),
                          Text(book.publisher, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(width: 4),
                          const Icon(Icons.verified, color: Colors.blue, size: 16),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// Title & Price
                      Text(book.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(book.author, style: TextStyle(color: Colors.grey.shade600)),
                      const SizedBox(height: 8),
                      Text(
                        "\$${book.price.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.blue.shade800),
                      ),
                      const SizedBox(height: 12),

                      /// Genre & Pages
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                        child: Text("${book.genre} · ${book.pages} trang",
                          style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                      const Divider(height: 40),

                      /// Format Selector
                      const Text('LOẠI SÁCH', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 13)),
                      const SizedBox(height: 12),
                      Obx(() => Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: book.availableFormats.map((format) {
                          final isSelected = detailController.selectedFormat.value == format;
                          return GestureDetector(
                            onTap: () => detailController.selectFormat(format),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue.shade700 : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: isSelected ? Colors.blue.shade700 : Colors.grey.shade300),
                                boxShadow: isSelected
                                    ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
                                    : [],
                              ),
                              child: Text(
                                bookFormatLabel(format),
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black87,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                      const SizedBox(height: 24),

                      /// Description
                      const Text('Mô tả sách', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 12),
                      Text(
                        book.description.isNotEmpty ? book.description : 'Không có mô tả cho sách này.',
                        style: TextStyle(color: Colors.grey.shade700, height: 1.5, fontSize: 15),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// BOTTOM ACTION
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5)),
                ],
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Row(
                      children: [
                        IconButton(
                          onPressed: () => detailController.decrease(),
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          detailController.quantity.value.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () => detailController.increase(),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        detailController.addToCart(book);
                        Get.snackbar(
                          'Đã thêm',
                          'Đã thêm ${book.title} vào giỏ hàng',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.shade400,
                          colorText: Colors.white,
                          duration: const Duration(seconds: 2),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text("Thêm vào giỏ", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
