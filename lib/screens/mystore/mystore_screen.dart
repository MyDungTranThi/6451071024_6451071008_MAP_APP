import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/book_tile_card.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/cart_controller.dart';
import '../../routes/app_routes.dart';

class MyStoreScreen extends GetView<BookCatalogController> {
  const MyStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Store'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () => Get.toNamed(AppRoutes.cart),
              icon: Badge(
                isLabelVisible: cartController.totalItems > 0,
                label: Text('${cartController.totalItems}'),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: controller.onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search books, authors, publishers...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 42,
            child: Obx(
              () => ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.genres.length,
                separatorBuilder: (_, index) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  final genre = controller.genres[index];
                  final selected = genre == controller.selectedGenre.value;
                  return ChoiceChip(
                    label: Text(genre),
                    selected: selected,
                    onSelected: (_) => controller.selectGenre(genre),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              final books = controller.filteredBooks;
              if (books.isEmpty) {
                return const Center(child: Text('No books match this search.'));
              }

              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: books.length,
                separatorBuilder: (_, index) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final book = books[index];
                  return BookTileCard(
                    book: book,
                    onTap: () => Get.toNamed(
                      AppRoutes.productDetail,
                      arguments: book.id,
                    ),
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
