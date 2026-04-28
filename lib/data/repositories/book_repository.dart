import '../models/book_model.dart';
import '../services/book_firestore_service.dart';

class BookRepository {
  BookRepository(this._bookFirestoreService);

  final BookFirestoreService _bookFirestoreService;

  Future<List<BookModel>> getBooksWithCloudSync({
    required List<BookModel> fallbackBooks,
  }) async {
    await _bookFirestoreService.seedBooksIfEmpty(fallbackBooks);
    return _bookFirestoreService.fetchBooks();
  }
}
