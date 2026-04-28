import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/book_catalog_controller.dart';
import '../../routes/app_routes.dart';
// TODO: AllBrandController/BrandModel chưa tồn tại
// import '../../controller/brand_controller.dart';
// import '../../common/widgets/brand_card.dart';
// import '../../data/models/brand_model.dart';
// import 'brand_detail_screen.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Khi AllBrandController được tạo, thay thế placeholder này
    // Tạm thời hiển thị danh sách publisher từ BookCatalogController
    final catalogController = Get.find<BookCatalogController>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            stretch: true,
            backgroundColor: Colors.blue.shade700,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('Nhà xuất bản', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                    colors: [Colors.blue.shade700, Colors.blue.shade400]),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            sliver: Obx(() {
              if (catalogController.isLoading.value) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
                );
              }

              // Extract unique publishers from loaded books
              final publishers = catalogController.allBooks.map((b) => b.publisher).toSet().toList()..sort();

              if (publishers.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_outlined, size: 80, color: Colors.grey.shade300),
                        const SizedBox(height: 16),
                        Text("Không tìm thấy nhà xuất bản nào", style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                      ],
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Container(width: 4, height: 16,
                        decoration: BoxDecoration(color: Colors.blue.shade700, borderRadius: BorderRadius.circular(2))),
                      const SizedBox(width: 8),
                      Text("Đã tìm thấy ${publishers.length} nhà xuất bản",
                        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: publishers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      final publisher = publishers[index];
                      final bookCount = catalogController.allBooks.where((b) => b.publisher == publisher).length;
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            // TODO: Navigate to BrandDetailScreen when ready
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(radius: 25, backgroundColor: Colors.blue.shade50,
                                child: Icon(Icons.store_rounded, color: Colors.blue.shade400)),
                              const SizedBox(height: 8),
                              Text(publisher, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 4),
                              Text("$bookCount cuốn sách", style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ]),
              );
            }),
          ),
        ],
      ),
    );
  }
}
