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
      appBar: AppBar(title: const Text('Wishlist')),
      body: Obx(() {
        if (!authController.isLoggedIn) {
          return _buildRequireLogin();
        }

        return Obx(() {
          final books = wishlistController.wishlistBooks;
          if (books.isEmpty) {
            return const Center(child: Text('Your wishlist is empty.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: books.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final book = books[index];
              return BookTileCard(
                book: book,
                onTap: () =>
                    Get.toNamed(AppRoutes.productDetail, arguments: book.id),
                trailing: IconButton(
                  onPressed: () => wishlistController.toggle(book),
                  icon: const Icon(Icons.favorite, color: Colors.red),
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
            const Icon(Icons.favorite_border, size: 72),
            const SizedBox(height: 12),
            const Text(
              'Login to see your wishlist',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => Get.toNamed(AppRoutes.login),
              child: const Text('Go to login'),
            ),
          ],
        ),
      ),
    );
  }
}
