import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/brand_controller.dart';
import '../../controller/book_catalog_controller.dart';
import '../../common/widgets/product_card.dart';

class BrandDetailScreen extends StatelessWidget {
  const BrandDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final brandId = args?['brandId'] as String? ?? '';
    
    final brandController = Get.find<BrandController>();
    final catalogController = Get.find<BookCatalogController>();
    
    final brand = brandController.brands.firstWhereOrNull((b) => b.id == brandId);
    
    if (brand == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lỗi')),
        body: const Center(child: Text('Không tìm thấy thương hiệu.')),
      );
    }
    
    // Filter books by brand name from the catalog
    final brandBooks = catalogController.allBooks.where((b) => b.brandName == brand.name).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(brand.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(color: Colors.black, blurRadius: 4)])),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    brand.imageUrl.isNotEmpty ? brand.imageUrl : 'https://via.placeholder.com/600x300',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.blue.shade100,
                      child: const Icon(Icons.store, size: 80, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        backgroundImage: brand.imageUrl.isNotEmpty ? NetworkImage(brand.imageUrl) : null,
                        child: brand.imageUrl.isEmpty ? const Icon(Icons.store, size: 28) : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(brand.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('${brand.productsCount} sản phẩm', style: TextStyle(color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                      if (brand.isFeatured)
                        Chip(
                          label: const Text('Nổi bật', style: TextStyle(color: Colors.white, fontSize: 12)),
                          backgroundColor: Colors.blue.shade700,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('Sản phẩm (${brandBooks.length})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          brandBooks.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: Text("Chưa có sản phẩm nào", style: TextStyle(color: Colors.grey.shade600)),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductCard(product: brandBooks[index]);
                      },
                      childCount: brandBooks.length,
                    ),
                  ),
                ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
