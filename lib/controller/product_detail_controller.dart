import 'package:get/get.dart';

import '../data/models/book_model.dart';
import 'cart_controller.dart';

class ProductDetailController extends GetxController {
  final Rx<BookFormat> selectedFormat = BookFormat.paperback.obs;
  final RxInt quantity = 1.obs;

  void initForBook(BookModel book) {
    selectedFormat.value = book.availableFormats.first;
    quantity.value = 1;
  }

  void selectFormat(BookFormat format) {
    selectedFormat.value = format;
  }

  void increase() {
    quantity.value += 1;
  }

  void decrease() {
    if (quantity.value > 1) {
      quantity.value -= 1;
    }
  }

  Future<void> addToCart(BookModel book) async {
    final cartController = Get.find<CartController>();
    await cartController.addBook(book, quantity: quantity.value);
  }
}
