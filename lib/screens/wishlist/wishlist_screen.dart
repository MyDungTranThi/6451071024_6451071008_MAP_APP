import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/book_tile_card.dart';
import '../../controller/auth_controller.dart';
import '../../controller/wishlist_controller.dart';
import '../../routes/app_routes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final wishlistController = Get.find<WishlistController>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Danh sách yêu thích'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (!authController.isLoggedIn) {
          return _buildRequireLogin();
        }

        return Obx(() {
          final books = wishlistController.wishlistBooks;
          if (books.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  const Text('Danh sách yêu thích đang trống', style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: books.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) {
              final book = books[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: BookTileCard(
                  book: book,
                  onTap: () =>
                      Get.toNamed(AppRoutes.productDetail, arguments: {'bookId': book.id}),
                  trailing: IconButton(
                    onPressed: () => wishlistController.toggleWishlist(book),
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              );
            },
          );
        });
      }),
    );
  }

  Widget _buildRequireLogin() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 80, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            const Text(
              'Đăng nhập để xem danh sách yêu thích',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: const Text('Đăng nhập', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
