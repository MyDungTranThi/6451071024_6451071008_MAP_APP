import 'package:get/get.dart';

import '../bindings/shopping_binding.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/main_navigation_screen.dart';
import '../screens/mystore/mystore_screen.dart';
import '../screens/order/order_confirmation_screen.dart';
import '../screens/product/product_detail_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/shipping_address/shipping_address_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';
import 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.mainNavigation,
      page: () => const MainNavigationScreen(),
      binding: ShoppingBinding(),
    ),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.myStore, page: () => const MyStoreScreen()),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailScreen(),
    ),
    GetPage(name: AppRoutes.cart, page: () => const CartScreen()),
    GetPage(
      name: AppRoutes.shippingAddress,
      page: () => const ShippingAddressScreen(),
    ),
    GetPage(
      name: AppRoutes.orderConfirmation,
      page: () => const OrderConfirmationScreen(),
    ),
    GetPage(name: AppRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
  ];
}
