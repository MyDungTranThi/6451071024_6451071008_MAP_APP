import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/auth_controller.dart';
import '../../controller/notification_controller.dart';
import '../../controller/mystore_controller.dart';
import '../../common/widgets/home_banner_slider.dart';
import '../../common/widgets/product_card.dart';
import '../../common/widgets/category_item.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BookCatalogController catalogController =
      Get.find<BookCatalogController>();
  final CartController cartController = Get.find<CartController>();
  final AuthController authController = Get.find<AuthController>();
  final NotificationController notificationController =
      Get.find<NotificationController>();
  final MyStoreController storeController = Get.find<MyStoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          /// HEADER
          SliverAppBar(
            expandedHeight: 180,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.blue.shade700,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade700, Colors.blue.shade400],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Obx(() {
                          final user = authController.currentUser.value;
                          final name = user != null ? user.fullName : 'Guest';
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Xin chào, $name',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'S-Store Book',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        }),
                        const Spacer(),

                        /// NOTIFICATIONS
                        Obx(
                          () => Stack(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.notifications);
                                },
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              if (notificationController.unreadCount.value > 0)
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${notificationController.unreadCount.value}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        /// CART
                        Obx(
                          () => Stack(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.cart);
                                },
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
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
                                        fontWeight: FontWeight.bold,
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
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                /// BANNER SLIDER
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: HomeBannerSlider(),
                ),
                const SizedBox(height: 24),

                /// CATEGORIES
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Danh mục sản phẩm',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.myStore),
                        child: const Text('Xem tất cả'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: Obx(() {
                    if (storeController.isCategoriesLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (storeController.categories.isEmpty) {
                      return const Center(child: Text("Chưa có danh mục"));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: storeController.categories.length,
                      itemBuilder: (context, index) {
                        final cat = storeController.categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CategoryItem(
                            imageUrl: cat.image.isNotEmpty
                                ? cat.image
                                : 'https://via.placeholder.com/150',
                            title: cat.name,
                            onTap: () {
                              // TODO: Navigate to category products
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),

                const SizedBox(height: 16),

                /// POPULAR PRODUCTS
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Sản phẩm phổ biến nhất',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),

          /// POPULAR PRODUCTS GRID
          Obx(() {
            final isSearching = catalogController.searchQuery.value.isNotEmpty;
            final books = isSearching
                ? catalogController.searchResults
                : catalogController.popularBooks;

            if (catalogController.isLoading.value) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (books.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Icon(
                        Icons.menu_book_outlined,
                        size: 80,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 16),
                      const Text("Không tìm thấy sách nào"),
                    ],
                  ),
                ),
              );
            }

            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.58,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final book = books[index];
                  return ProductCard(product: book);
                }, childCount: books.length),
              ),
            );
          }),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
