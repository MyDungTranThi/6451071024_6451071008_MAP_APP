import 'package:get/get.dart';

import '../data/models/book_model.dart';
import 'book_catalog_controller.dart';

class CartController extends GetxController {
  final RxMap<String, int> items = <String, int>{}.obs;

  int quantityFor(String bookId) => items[bookId] ?? 0;

  int get totalItems => items.values.fold(0, (sum, qty) => sum + qty);

  bool get isEmpty => items.isEmpty;

  List<MapEntry<String, int>> get lines => items.entries.toList();

  void addBook(BookModel book, {int quantity = 1}) {
    final current = items[book.id] ?? 0;
    items[book.id] = current + quantity;
  }

  void increase(String bookId) {
    items[bookId] = (items[bookId] ?? 0) + 1;
  }

  void decrease(String bookId) {
    final current = items[bookId] ?? 0;
    if (current <= 1) {
      items.remove(bookId);
    } else {
      items[bookId] = current - 1;
    }
  }

  void remove(String bookId) {
    items.remove(bookId);
  }

  double totalPrice(BookCatalogController catalogController) {
    double total = 0;
    for (final entry in items.entries) {
      final book = catalogController.findById(entry.key);
      if (book != null) {
        total += book.price * entry.value;
      }
    }
    return total;
  }

  void clear() {
    items.clear();
  }
}
