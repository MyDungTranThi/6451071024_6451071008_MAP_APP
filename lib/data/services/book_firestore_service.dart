import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book_model.dart';

class BookFirestoreService {
  BookFirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _booksRef =>
      _firestore.collection('books');

  Future<List<BookModel>> fetchBooks() async {
    final snapshot = await _booksRef.get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      final modelData = {'id': doc.id, ...data};
      return BookModel.fromJson(modelData);
    }).toList();
  }

  Future<BookModel?> fetchBookById(String id) async {
    final doc = await _booksRef.doc(id).get();
    if (doc.exists) {
      final data = doc.data()!;
      data['id'] = doc.id;
      return BookModel.fromJson(data);
    }
    return null;
  }

  Future<List<BookModel>> getBooksByBrand(String brandId) async {
    final snapshot = await _booksRef
        .where('brandId', isEqualTo: brandId)
        .where('isActive', isEqualTo: true)
        .where('isDeleted', isEqualTo: false)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return BookModel.fromJson(data);
    }).toList();
  }

  Future<List<BookModel>> getPopularBooks() async {
    final snapshot = await _booksRef
        .where('isActive', isEqualTo: true)
        .where('isDeleted', isEqualTo: false)
        .orderBy('soldQuantity', descending: true)
        .limit(10)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return BookModel.fromJson(data);
    }).toList();
  }

  Future<List<BookModel>> searchBooks(String query) async {
    // Basic search on client-side is preferred if using standard Firestore,
    // but here we can just fetch active ones and filter, or use an index.
    // For simplicity, we fetch all active books and let the controller filter.
    final snapshot = await _booksRef
        .where('isActive', isEqualTo: true)
        .where('isDeleted', isEqualTo: false)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return BookModel.fromJson(data);
    }).toList();
  }
}
