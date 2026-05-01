import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/brand_controller.dart';
import '../../common/widgets/brand_card.dart';
import '../../routes/app_routes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BrandController>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Tất cả thương hiệu', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.brands.isEmpty) {
          return const Center(child: Text("Không có thương hiệu nào."));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: controller.brands.length,
          itemBuilder: (context, index) {
            final brand = controller.brands[index];
            return BrandCard(
              brand: brand,
              onTap: () {
                Get.toNamed(AppRoutes.brandDetail, arguments: {'brandId': brand.id});
              },
            );
          },
        );
      }),
    );
  }
}
