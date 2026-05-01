import 'package:get/get.dart';

import '../controller/book_catalog_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/checkout_controller.dart';
import '../controller/main_navigation_controller.dart';
import '../controller/product_detail_controller.dart';
import '../controller/wishlist_controller.dart';
import '../data/repositories/book_repository.dart';
import '../data/repositories/cart_repository.dart';
import '../data/repositories/order_repository.dart';
import '../data/repositories/wishlist_repository.dart';
import '../data/services/book_firestore_service.dart';
import '../data/services/cart_firestore_service.dart';
import '../data/services/order_firestore_service.dart';
import '../data/services/wishlist_firestore_service.dart';

import '../data/services/brand_firestore_service.dart';
import '../data/repositories/brand_repository.dart';
import '../data/services/category_firestore_service.dart';
import '../data/repositories/category_repository.dart';
import '../data/services/notification_firestore_service.dart';
import '../data/repositories/notification_repository.dart';
import '../data/services/review_firestore_service.dart';
import '../data/repositories/review_image_repository.dart';
import '../data/repositories/review_repository.dart';

import '../controller/brand_controller.dart';
import '../controller/notification_controller.dart';
import '../controller/mystore_controller.dart';
import '../controller/settings_controller.dart';
import '../controller/order_controller.dart';

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
    final cartFirestoreService = Get.put(
      CartFirestoreService(),
      permanent: true,
    );
    final wishlistFirestoreService = Get.put(
      WishlistFirestoreService(),
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
    final cartRepository = Get.put(
      CartRepository(cartFirestoreService),
      permanent: true,
    );
    final wishlistRepository = Get.put(
      WishlistRepository(wishlistFirestoreService),
      permanent: true,
    );

    // New Services & Repos
    Get.put(BrandFirestoreService(), permanent: true);
    final brandRepo = Get.put(BrandRepository(), permanent: true);

    Get.put(CategoryFirestoreService(), permanent: true);
    final catRepo = Get.put(CategoryRepository(), permanent: true);

    Get.put(NotificationFirestoreService(), permanent: true);
    final notiRepo = Get.put(NotificationRepository(), permanent: true);

    Get.put(ReviewFirestoreService(), permanent: true);
    Get.put(ReviewRepository(), permanent: true);
    Get.put(ReviewImageRepository(), permanent: true);

    // Controllers
    Get.put(MainNavigationController(), permanent: true);
    Get.put(BookCatalogController(bookRepository), permanent: true);
    Get.put(CartController(cartRepository), permanent: true);
    Get.put(ProductDetailController(), permanent: true);
    Get.put(CheckoutController(orderRepository), permanent: true);
    Get.put(WishlistController(wishlistRepository), permanent: true);

    Get.put(BrandController(brandRepo, bookRepository), permanent: true);
    Get.put(NotificationController(notiRepo), permanent: true);
    Get.put(
      MyStoreController(brandRepo, catRepo, bookRepository),
      permanent: true,
    );
    Get.put(SettingsController(), permanent: true);
    Get.put(OrderController(), permanent: true);
  }
}
