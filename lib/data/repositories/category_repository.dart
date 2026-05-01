import '../models/category_model.dart';
import '../services/category_firestore_service.dart';

class CategoryRepository {
  final CategoryFirestoreService _service = CategoryFirestoreService();

  Future<List<CategoryModel>> getCategories() {
    return _service.getCategories();
  }
}
