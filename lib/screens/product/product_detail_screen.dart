import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/app_colors.dart';
import '../../common/widgets/primary_button.dart';
import '../../controller/auth_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/product_detail_controller.dart';
import '../../controller/wishlist_controller.dart';
import '../../data/models/book_model.dart';
import '../../routes/app_routes.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogController = Get.find<BookCatalogController>();
    final authController = Get.find<AuthController>();
    final wishlistController = Get.find<WishlistController>();
    final bookId = Get.arguments as String?;
    final BookModel? book = bookId == null
        ? null
        : catalogController.findById(bookId);

    if (book == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Book details')),
        body: const Center(child: Text('Book not found')),
      );
    }

    controller.initForBook(book);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book details'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.cart),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          Obx(() {
            final inWishlist = wishlistController.isInWishlist(book.id);
            return IconButton(
              onPressed: () {
                if (!authController.isLoggedIn) {
                  Get.toNamed(AppRoutes.login);
                  return;
                }
                wishlistController.toggle(book);
              },
              icon: Icon(
                inWishlist ? Icons.favorite : Icons.favorite_border,
                color: inWishlist ? Colors.red : null,
              ),
            );
          }),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(
                book.coverImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Icon(Icons.menu_book_rounded, size: 48),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            book.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text('${book.author} • ${book.publisher}'),
          const SizedBox(height: 12),
          Text(
            book.price.toStringAsFixed(2),
            style: const TextStyle(
              color: AppColors.primaryBlue,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(book.description),
          const SizedBox(height: 16),
          const Text('Format', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Obx(
            () => Wrap(
              spacing: 8,
              children: book.availableFormats.map((format) {
                return ChoiceChip(
                  label: Text(bookFormatLabel(format)),
                  selected: controller.selectedFormat.value == format,
                  onSelected: (_) => controller.selectFormat(format),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              children: [
                IconButton(
                  onPressed: controller.decrease,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  '${controller.quantity.value}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: controller.increase,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            title: 'Add to cart',
            onPressed: () {
              controller.addToCart(book);
              Get.snackbar(
                'Added to cart',
                '${book.title} has been added to your cart.',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
      ),
    );
  }
}
