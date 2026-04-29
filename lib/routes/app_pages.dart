import 'package:get/get.dart';

import '../bindings/onboarding_binding.dart';
import '../bindings/shopping_binding.dart';
import '../bindings/splash_binding.dart';
import '../screens/auth/forget_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/register_success_screen.dart';
import '../screens/auth/verify_email_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/cart/cart_overview_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/main_navigation_screen.dart';
import '../screens/mystore/mystore_screen.dart';
import '../screens/order/order_confirmation_screen.dart';
import '../screens/order/order_overview_screen.dart';
import '../screens/order/order_success_screen.dart';
import '../screens/order/my_order_screen.dart';
import '../screens/product/product_detail_screen.dart';
import '../screens/product/popular_product_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/shipping_address/shipping_address_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';
import 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(
      name: AppRoutes.registerSuccess,
      page: () => const RegisterSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.mainNavigation,
      page: () => const MainNavigationScreen(),
      binding: ShoppingBinding(),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.myStore, page: () => MystoreScreen()),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailScreen(),
    ),
    GetPage(name: AppRoutes.cart, page: () => const CartScreen()),
    GetPage(name: AppRoutes.cartOverview, page: () => const CartOverviewScreen()),
    GetPage(
      name: AppRoutes.shippingAddress,
      page: () => const ShippingAddressScreen(),
    ),
    GetPage(
      name: AppRoutes.orderConfirmation,
      page: () => const OrderConfirmationScreen(),
    ),
    GetPage(name: AppRoutes.orderReview, page: () => const OrderReviewScreen()),
    GetPage(name: AppRoutes.orderSuccess, page: () => const OrderSuccessScreen()),
    GetPage(name: AppRoutes.myOrders, page: () => const MyOrderScreen()),
    GetPage(name: AppRoutes.popularProduct, page: () => const PopularProductScreen()),
    GetPage(name: AppRoutes.allBrands, page: () => const AllBrandScreen()),
    // TODO: WishlistScreen chưa tồn tại
    // GetPage(name: AppRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
  ];
}
