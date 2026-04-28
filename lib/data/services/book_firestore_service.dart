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

  Future<void> seedBooksIfEmpty(List<BookModel> defaultBooks) async {
    final snapshot = await _booksRef.limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return;
    }

    final batch = _firestore.batch();
    for (final book in defaultBooks) {
      final docRef = _booksRef.doc(book.id);
      batch.set(docRef, book.toJson());
    }

    await batch.commit();
  }
}
