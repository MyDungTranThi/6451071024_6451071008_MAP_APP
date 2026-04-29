import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/cart_controller.dart';
import '../../routes/app_routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final catalogController = Get.find<BookCatalogController>();

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Obx(() {
        if (cartController.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Your cart is empty'),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => Get.offNamed(AppRoutes.mainNavigation),
                  child: const Text('Continue shopping'),
                ),
              ],
            ),
          );
        }

        final lines = cartController.lines;
        final total = cartController.totalPrice(catalogController);

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: lines.length,
                separatorBuilder: (_, index) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  final line = lines[index];
                  final book = catalogController.findById(line.key);
                  if (book == null) {
                    return const SizedBox.shrink();
                  }

                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(book.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.author),
                          const SizedBox(height: 6),
                          Text('\$${book.price.toStringAsFixed(2)} each'),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => cartController.decrease(book.id),
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text('${line.value}'),
                            IconButton(
                              onPressed: () => cartController.increase(book.id),
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        total.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    title: 'Proceed to checkout',
                    onPressed: () => Get.toNamed(AppRoutes.shippingAddress),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
