import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/app_colors.dart';
import '../../common/widgets/book_tile_card.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/cart_controller.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends GetView<BookCatalogController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          Obx(
            () => Stack(
              children: [
                IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.cart),
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
                if (cartController.totalItems > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.success,
                      child: Text(
                        '${cartController.totalItems}',
                        style: const TextStyle(
                          color: AppColors.white,
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
      body: Obx(() {
        final books = controller.allBooks.take(4).toList();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back 👋',
                    style: TextStyle(color: AppColors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Find your next favorite book',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular books',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.myStore),
                  child: const Text('See all'),
                ),
              ],
            ),
            ...books.map(
              (book) => BookTileCard(
                book: book,
                onTap: () => Get.toNamed(AppRoutes.productDetail, arguments: book.id),
              ),
            ),
          ],
        );
      }),
    );
  }
}
