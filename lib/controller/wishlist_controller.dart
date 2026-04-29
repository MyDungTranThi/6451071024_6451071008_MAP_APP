import 'package:get/get.dart';

import '../data/models/book_model.dart';
import 'book_catalog_controller.dart';

class WishlistController extends GetxController {
  final RxSet<String> bookIds = <String>{}.obs;

  bool isInWishlist(String bookId) => bookIds.contains(bookId);

  void toggle(BookModel book) {
    if (bookIds.contains(book.id)) {
      bookIds.remove(book.id);
    } else {
      bookIds.add(book.id);
    }
    bookIds.refresh();
  }

  List<BookModel> get wishlistBooks {
    final catalog = Get.find<BookCatalogController>();
    return bookIds
        .map(catalog.findById)
        .whereType<BookModel>()
        .toList(growable: false);
  }
}
