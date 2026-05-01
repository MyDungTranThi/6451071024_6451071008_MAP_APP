import 'package:get/get.dart';

import '../data/models/book_model.dart';
import '../data/repositories/book_repository.dart';

class BookCatalogController extends GetxController {
  BookCatalogController(this._bookRepository);

  final BookRepository _bookRepository;
  final RxList<BookModel> allBooks = <BookModel>[].obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedGenre = 'All'.obs;
  final RxBool isLoading = false.obs;
  final RxString syncStatusMessage = ''.obs;

  var searchResults = <BookModel>[].obs;

  var selectedBook = Rxn<BookModel>();
  var popularBooks = <BookModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      isLoading.value = true;
      final fetchedBooks = await _bookRepository.getBooks();
      allBooks.assignAll(fetchedBooks);
      _refreshDerivedBooks();
    } finally {
      isLoading.value = false;
    }
  }

  void getPopularBooks() {
    final activeBooks = List<BookModel>.from(allBooks)
      ..sort((a, b) {
        final ratingCompare = b.rating.compareTo(a.rating);
        if (ratingCompare != 0) return ratingCompare;
        return b.soldQuantity.compareTo(a.soldQuantity);
      });

    final highRatedBooks = activeBooks
        .where((book) => book.rating >= 4.5)
        .take(10)
        .toList();

    popularBooks.assignAll(
      highRatedBooks.isNotEmpty ? highRatedBooks : activeBooks.take(10),
    );
  }

  List<String> get genres {
    final values = allBooks.map((book) => book.genre).toSet().toList()..sort();
    return ['All', ...values];
  }

  List<BookModel> get filteredBooks {
    return allBooks.where((book) {
      final matchesGenre =
          selectedGenre.value == 'All' || selectedGenre.value == book.genre;

      final keyword = searchQuery.value.trim().toLowerCase();
      final matchesKeyword =
          keyword.isEmpty ||
          book.title.toLowerCase().contains(keyword) ||
          book.author.toLowerCase().contains(keyword) ||
          book.publisher.toLowerCase().contains(keyword);

      return matchesGenre && matchesKeyword;
    }).toList();
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;
    _refreshSearchResults();
  }

  void selectGenre(String genre) {
    selectedGenre.value = genre;
    _refreshSearchResults();
  }

  void _refreshDerivedBooks() {
    getPopularBooks();
    _refreshSearchResults();
  }

  void _refreshSearchResults() {
    final keyword = searchQuery.value.trim().toLowerCase();
    if (keyword.isEmpty) {
      searchResults.clear();
      return;
    }

    searchResults.assignAll(filteredBooks);
  }

  BookModel? findById(String id) {
    try {
      return allBooks.firstWhere((book) => book.id == id);
    } catch (_) {
      return null;
    }
  }
}
