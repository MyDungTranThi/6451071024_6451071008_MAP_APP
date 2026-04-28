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

  @override
  void onInit() {
    super.onInit();
    loadBooks();
  }

  Future<void> loadBooks() async {
    isLoading.value = true;
    syncStatusMessage.value = '';

    try {
      final cloudBooks = await _bookRepository.getBooksWithCloudSync(
        fallbackBooks: _defaultBooks,
      );

      if (cloudBooks.isEmpty) {
        allBooks.assignAll(_defaultBooks);
        syncStatusMessage.value =
            'No cloud data found. Displaying local sample books.';
      } else {
        allBooks.assignAll(cloudBooks);
      }
    } catch (_) {
      allBooks.assignAll(_defaultBooks);
      syncStatusMessage.value =
          'Cloud sync unavailable. Displaying local sample books.';
    } finally {
      isLoading.value = false;
    }
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
  }

  void selectGenre(String genre) {
    selectedGenre.value = genre;
  }

  BookModel? findById(String id) {
    try {
      return allBooks.firstWhere((book) => book.id == id);
    } catch (_) {
      return null;
    }
  }

  static const List<BookModel> _defaultBooks = [
    BookModel(
      id: 'b1',
      title: 'Clean Code',
      author: 'Robert C. Martin',
      publisher: 'Prentice Hall',
      genre: 'Software Engineering',
      pages: 464,
      price: 18.5,
      coverImage:
          'https://images-na.ssl-images-amazon.com/images/I/41SH-SvWPxL._SX374_BO1,204,203,200_.jpg',
      availableFormats: [BookFormat.paperback, BookFormat.ebook],
      description: 'A Handbook of Agile Software Craftsmanship.',
    ),
    BookModel(
      id: 'b2',
      title: 'Atomic Habits',
      author: 'James Clear',
      publisher: 'Avery',
      genre: 'Self-help',
      pages: 320,
      price: 14.0,
      coverImage:
          'https://images-na.ssl-images-amazon.com/images/I/513Y5o-DYtL._SX329_BO1,204,203,200_.jpg',
      availableFormats: [
        BookFormat.paperback,
        BookFormat.hardcover,
        BookFormat.ebook,
      ],
      description: 'An Easy & Proven Way to Build Good Habits.',
    ),
    BookModel(
      id: 'b3',
      title: 'The Pragmatic Programmer',
      author: 'Andrew Hunt',
      publisher: 'Addison-Wesley',
      genre: 'Software Engineering',
      pages: 352,
      price: 21.0,
      coverImage:
          'https://images-na.ssl-images-amazon.com/images/I/41uPjEenkFL._SX380_BO1,204,203,200_.jpg',
      availableFormats: [BookFormat.paperback, BookFormat.hardcover],
      description: 'Your Journey to Mastery.',
    ),
    BookModel(
      id: 'b4',
      title: 'Dune',
      author: 'Frank Herbert',
      publisher: 'Ace',
      genre: 'Science Fiction',
      pages: 688,
      price: 16.0,
      coverImage:
          'https://images-na.ssl-images-amazon.com/images/I/41UZeCEKOBL._SX331_BO1,204,203,200_.jpg',
      availableFormats: [
        BookFormat.paperback,
        BookFormat.hardcover,
        BookFormat.ebook,
      ],
      description: 'Epic science fiction classic.',
    ),
    BookModel(
      id: 'b5',
      title: 'Thinking, Fast and Slow',
      author: 'Daniel Kahneman',
      publisher: 'Farrar, Straus and Giroux',
      genre: 'Psychology',
      pages: 512,
      price: 15.0,
      coverImage:
          'https://images-na.ssl-images-amazon.com/images/I/41f-vtLhYzL._SX322_BO1,204,203,200_.jpg',
      availableFormats: [BookFormat.paperback, BookFormat.ebook],
      description: 'A landmark book in behavioral science.',
    ),
    BookModel(
      id: 'b6',
      title: 'The Hobbit',
      author: 'J.R.R. Tolkien',
      publisher: 'Mariner Books',
      genre: 'Fantasy',
      pages: 304,
      price: 13.5,
      coverImage:
          'https://images-na.ssl-images-amazon.com/images/I/41aQPTCmeVL._SX331_BO1,204,203,200_.jpg',
      availableFormats: [
        BookFormat.paperback,
        BookFormat.hardcover,
        BookFormat.ebook,
      ],
      description: 'A fantasy novel and prelude to The Lord of the Rings.',
    ),
  ];
}
