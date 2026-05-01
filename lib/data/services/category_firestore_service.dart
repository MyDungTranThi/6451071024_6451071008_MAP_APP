import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class CategoryFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _db.collection('categories').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
