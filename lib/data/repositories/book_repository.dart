import '../models/book_model.dart';
import '../services/book_firestore_service.dart';

class BookRepository {
  BookRepository(this._bookFirestoreService);

  final BookFirestoreService _bookFirestoreService;

  Future<List<BookModel>> getBooks() {
    return _bookFirestoreService.fetchBooks();
  }

  Future<BookModel?> fetchBookById(String id) {
    return _bookFirestoreService.fetchBookById(id);
  }

  Future<List<BookModel>> getBooksByBrand(String brandId) {
    return _bookFirestoreService.getBooksByBrand(brandId);
  }

  Future<List<BookModel>> getPopularBooks() {
    return _bookFirestoreService.getPopularBooks();
  }

  Future<List<BookModel>> searchBooks(String query) {
    return _bookFirestoreService.searchBooks(query);
  }
}
