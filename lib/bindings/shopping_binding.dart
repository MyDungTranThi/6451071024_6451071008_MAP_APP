import 'package:get/get.dart';

import '../controller/book_catalog_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/checkout_controller.dart';
import '../controller/main_navigation_controller.dart';
import '../controller/product_detail_controller.dart';
import '../controller/wishlist_controller.dart';
import '../data/repositories/book_repository.dart';
import '../data/repositories/order_repository.dart';
import '../data/services/book_firestore_service.dart';
import '../data/services/order_firestore_service.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    final bookFirestoreService = Get.put(
      BookFirestoreService(),
      permanent: true,
    );
    final orderFirestoreService = Get.put(
      OrderFirestoreService(),
      permanent: true,
    );
    final bookRepository = Get.put(
      BookRepository(bookFirestoreService),
      permanent: true,
    );
    final orderRepository = Get.put(
      OrderRepository(orderFirestoreService),
      permanent: true,
    );

    Get.put(MainNavigationController(), permanent: true);
    Get.put(BookCatalogController(bookRepository), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(ProductDetailController(), permanent: true);
    Get.put(CheckoutController(orderRepository), permanent: true);
    Get.put(WishlistController(), permanent: true);
  }
}
