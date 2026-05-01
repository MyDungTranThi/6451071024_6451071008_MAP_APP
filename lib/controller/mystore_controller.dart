import 'package:get/get.dart';
import '../data/models/brand_model.dart';
import '../data/models/category_model.dart';
import '../data/models/book_model.dart';
import '../data/repositories/brand_repository.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/book_repository.dart';

class MyStoreController extends GetxController {
  MyStoreController(
    this._brandRepository,
    this._categoryRepository,
    this._bookRepository,
  );

  final BrandRepository _brandRepository;
  final CategoryRepository _categoryRepository;
  final BookRepository _bookRepository;

  final isCategoriesLoading = false.obs;
  final categories = <CategoryModel>[].obs;

  final isFeaturedBrandsLoading = false.obs;
  final featuredBrands = <BrandModel>[].obs;

  final categoryProducts = <BookModel>[].obs;
  final isCategoryProductsLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchFeaturedBrands();
  }

  Future<void> fetchCategories() async {
    try {
      isCategoriesLoading.value = true;
      final data = await _categoryRepository.getCategories();
      categories.assignAll(data);
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isCategoriesLoading.value = false;
    }
  }

  Future<void> fetchFeaturedBrands() async {
    try {
      isFeaturedBrandsLoading.value = true;
      final data = await _brandRepository.getBrands();
      featuredBrands.assignAll(data.where((b) => b.isFeatured).toList());
    } catch (e) {
      print("Error fetching featured brands: $e");
    } finally {
      isFeaturedBrandsLoading.value = false;
    }
  }

  Future<void> getCategoryProducts(String categoryId) async {
    try {
      isCategoryProductsLoading.value = true;
      // Fetch books and filter locally for simplicity, or use an index.
      final allBooks = await _bookRepository.searchBooks('');
      final filtered = allBooks.where((book) => book.categoryIds.contains(categoryId)).toList();
      categoryProducts.assignAll(filtered);
    } catch (e) {
      print("Error fetching category products: $e");
    } finally {
      isCategoryProductsLoading.value = false;
    }
  }
}
