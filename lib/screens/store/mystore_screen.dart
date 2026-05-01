import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/mystore_controller.dart';
import '../../common/widgets/brand_card.dart';
import '../../common/widgets/category_item.dart';

class MyStoreScreen extends StatelessWidget {
  const MyStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyStoreController controller = Get.find<MyStoreController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Store'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// CATEGORIES
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Danh mục',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(() {
              if (controller.isCategoriesLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.categories.isEmpty) {
                return const Center(child: Text("Không có danh mục nào."));
              }
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final cat = controller.categories[index];
                  return CategoryItem(
                    imageUrl: cat.image.isNotEmpty ? cat.image : 'https://via.placeholder.com/150',
                    title: cat.name,
                    onTap: () {
                      // Navigate to category details
                    },
                  );
                },
              );
            }),

            const SizedBox(height: 24),

            /// BRANDS
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Thương hiệu nổi bật',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(() {
              if (controller.isFeaturedBrandsLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.featuredBrands.isEmpty) {
                return const Center(child: Text("Không có thương hiệu nào."));
              }
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: controller.featuredBrands.length,
                itemBuilder: (context, index) {
                  final brand = controller.featuredBrands[index];
                  return BrandCard(
                    brand: brand,
                    onTap: () {
                      // Navigate to brand store
                    },
                  );
                },
              );
            }),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
