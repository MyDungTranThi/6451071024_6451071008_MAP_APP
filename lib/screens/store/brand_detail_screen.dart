import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/product_card.dart';
import '../../controller/book_catalog_controller.dart';
import '../../controller/brand_controller.dart';
import '../../data/models/book_model.dart';

class BrandDetailScreen extends StatefulWidget {
  const BrandDetailScreen({super.key});

  @override
  State<BrandDetailScreen> createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  String _sortType = 'popular';

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final brandId = args?['brandId'] as String? ?? '';

    final brandController = Get.find<BrandController>();
    final catalogController = Get.find<BookCatalogController>();

    return Obx(() {
      final brand = brandController.brands.firstWhereOrNull(
        (item) => item.id == brandId,
      );

      if (brand == null) {
        return Scaffold(
          appBar: AppBar(title: const Text('Lỗi')),
          body: const Center(child: Text('Không tìm thấy thương hiệu.')),
        );
      }

      final brandBooks = _sortBooks(
        catalogController.allBooks.where((book) {
          final matchesBrandId = book.brandId == brand.id;
          final matchesBrandName =
              (book.brandName ?? book.publisher).toLowerCase() ==
              brand.name.toLowerCase();
          return matchesBrandId || matchesBrandName;
        }).toList(),
      );

      return Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  brand.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      brand.imageUrl.isNotEmpty
                          ? brand.imageUrl
                          : 'https://via.placeholder.com/600x300',
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: Colors.blue.shade100,
                        child: const Icon(
                          Icons.store,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          backgroundImage: brand.imageUrl.isNotEmpty
                              ? NetworkImage(brand.imageUrl)
                              : null,
                          child: brand.imageUrl.isEmpty
                              ? const Icon(Icons.store, size: 28)
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                brand.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${brandBooks.length} sản phẩm',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                        if (brand.isFeatured)
                          Chip(
                            label: const Text(
                              'Nổi bật',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: Colors.blue.shade700,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                          ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Sản phẩm (${brandBooks.length})',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: _sortType,
                          underline: const SizedBox.shrink(),
                          items: const [
                            DropdownMenuItem(
                              value: 'popular',
                              child: Text('Phổ biến'),
                            ),
                            DropdownMenuItem(
                              value: 'low_price',
                              child: Text('Giá thấp'),
                            ),
                            DropdownMenuItem(
                              value: 'high_price',
                              child: Text('Giá cao'),
                            ),
                            DropdownMenuItem(value: 'name', child: Text('Tên')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _sortType = value);
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            brandBooks.isEmpty
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Center(
                        child: Text(
                          'Chưa có sản phẩm nào',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.65,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ProductCard(product: brandBooks[index]);
                      }, childCount: brandBooks.length),
                    ),
                  ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      );
    });
  }

  List<BookModel> _sortBooks(List<BookModel> books) {
    final sortedBooks = List<BookModel>.from(books);
    switch (_sortType) {
      case 'low_price':
        sortedBooks.sort(
          (a, b) => _sellingPrice(a).compareTo(_sellingPrice(b)),
        );
        break;
      case 'high_price':
        sortedBooks.sort(
          (a, b) => _sellingPrice(b).compareTo(_sellingPrice(a)),
        );
        break;
      case 'name':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'popular':
      default:
        sortedBooks.sort((a, b) {
          final soldCompare = b.soldQuantity.compareTo(a.soldQuantity);
          if (soldCompare != 0) return soldCompare;
          return b.rating.compareTo(a.rating);
        });
    }
    return sortedBooks;
  }

  double _sellingPrice(BookModel book) {
    final salePrice = book.salePrice;
    if (salePrice != null && salePrice > 0 && salePrice < book.price) {
      return salePrice;
    }
    return book.price;
  }
}
