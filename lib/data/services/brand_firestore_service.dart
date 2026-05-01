import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/brand_model.dart';

class BrandFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getBrands() async {
    final snapshot = await _db.collection('brands').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return BrandModel.fromJson(data);
    }).toList();
  }

  Future<BrandModel?> getBrandById(String id) async {
    final doc = await _db.collection('brands').doc(id).get();
    if (doc.exists) {
      final data = doc.data()!;
      data['id'] = doc.id;
      return BrandModel.fromJson(data);
    }
    return null;
  }
}
