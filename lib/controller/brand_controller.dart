import 'package:get/get.dart';
import '../data/models/brand_model.dart';
import '../data/models/book_model.dart';
import '../data/repositories/brand_repository.dart';
import '../data/repositories/book_repository.dart';

class BrandController extends GetxController {
  BrandController(this._brandRepository, this._bookRepository);

  final BrandRepository _brandRepository;
  final BookRepository _bookRepository;

  final isLoading = false.obs;
  final brands = <BrandModel>[].obs;
  
  final brandBooks = <BookModel>[].obs;
  final isBooksLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    try {
      isLoading.value = true;
      final data = await _brandRepository.getBrands();
      brands.assignAll(data);
    } catch (e) {
      print("Error fetching brands: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getBooksByBrand(String brandId) async {
    try {
      isBooksLoading.value = true;
      final data = await _bookRepository.getBooksByBrand(brandId);
      brandBooks.assignAll(data);
    } catch (e) {
      print("Error fetching books by brand: $e");
    } finally {
      isBooksLoading.value = false;
    }
  }
  
  void sortBrandProducts(String sortType) {
    if (sortType == "low_price") {
      brandBooks.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortType == "high_price") {
      brandBooks.sort((a, b) => b.price.compareTo(a.price));
    } else {
      brandBooks.sort((a, b) => a.title.compareTo(b.title));
    }
  }
}
