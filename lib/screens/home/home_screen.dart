import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../common/widgets/book_tile_card.dart';
import '../../routes/app_routes.dart';
// TODO: Các controller/widget sau sẽ được tạo ở giai đoạn sau
// import '../../controller/notification_controller.dart';
// import '../../controller/login_controller.dart';
// import '../../controller/category_controller.dart';
// import '../../common/widgets/home_banner_slider.dart';
// import '../../common/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BookCatalogController catalogController = Get.find<BookCatalogController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// HEADER
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade700, Colors.blue.shade400],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ngày tốt để đọc sách',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'S-Store Book',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Obx(
                        () => Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.cart);
                              },
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                            if (cartController.totalItems > 0)
                              Positioned(
                                right: 6,
                                top: 6,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    cartController.totalItems.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  /// SEARCH BAR
                  TextField(
                    onChanged: (value) {
                      catalogController.onSearchChanged(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm sách trong cửa hàng',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  /// GENRE CHIPS
                  const Text(
                    'Thể loại phổ biến',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: Obx(() {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catalogController.genres.length,
                        itemBuilder: (context, index) {
                          final genre = catalogController.genres[index];
                          final isSelected = catalogController.selectedGenre.value == genre;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(genre),
                              selected: isSelected,
                              selectedColor: Colors.white,
                              backgroundColor: Colors.white24,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.blue.shade700 : Colors.white,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                              onSelected: (_) => catalogController.selectGenre(genre),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),

          /// BOOK LIST
          Expanded(
            child: Obx(() {
              if (catalogController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final books = catalogController.filteredBooks;

              if (books.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.menu_book_outlined, size: 80, color: Colors.grey.shade300),
                      const SizedBox(height: 16),
                      const Text("Không tìm thấy sách nào"),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: books.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) {
                  final book = books[index];
                  return _BookGridCard(
                    book: book,
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.productDetail,
                        arguments: {'bookId': book.id},
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

/// Grid card hiển thị sách dạng lưới trên HomePage
class _BookGridCard extends StatelessWidget {
  final dynamic book;
  final VoidCallback onTap;

  const _BookGridCard({required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  book.coverImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.menu_book, size: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${book.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
