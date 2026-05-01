import '../models/brand_model.dart';
import '../services/brand_firestore_service.dart';

class BrandRepository {
  final BrandFirestoreService _service = BrandFirestoreService();

  Future<List<BrandModel>> getBrands() {
    return _service.getBrands();
  }

  Future<BrandModel?> getBrandById(String id) {
    return _service.getBrandById(id);
  }
}
