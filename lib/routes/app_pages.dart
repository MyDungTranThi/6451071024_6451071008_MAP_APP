import 'package:get/get.dart';
import 'package:map_app_6451071024_6451071008/screens/mystore/all_brand_screen.dart';
import 'package:map_app_6451071024_6451071008/screens/onboarding/onboarding_screen.dart';
import 'package:map_app_6451071024_6451071008/screens/splash/splash_screen.dart';

import '../bindings/onboarding_binding.dart';
import '../bindings/shopping_binding.dart';
import '../bindings/splash_binding.dart';
import '../screens/auth/forget_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/register_success_screen.dart';
import '../screens/auth/reset_email_sent_screen.dart';
import '../screens/auth/verify_email_screen.dart';
import '../screens/bank_account/my_bank_account_screen.dart';
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
import '../screens/profile/update_account_screen.dart';
import '../screens/profile/change_name_screen.dart';
import '../screens/profile/change_username_screen.dart';
import '../screens/profile/change_password_screen.dart';
import '../screens/profile/change_email_screen.dart';
import '../screens/profile/change_phonenumber_screen.dart';
import '../screens/profile/change_gender_screen.dart';
import '../screens/profile/change_dateofbirth_screen.dart';
import '../screens/shipping_address/shipping_address_screen.dart';
import '../screens/shipping_address/my_shipping_address_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';
import '../screens/settings/my_settings_screen.dart';
import '../screens/reviews/write_review_screen.dart';
import '../screens/reviews/review_rating_screen.dart';
import '../screens/notifications/my_notifications_screen.dart';
import '../screens/store/brand_detail_screen.dart';
import '../screens/order/ordered_detail_screen.dart';
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
      name: AppRoutes.resetEmailSent,
      page: () => const ResetEmailSentScreen(),
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
    GetPage(name: AppRoutes.cart, page: () => const CartOverviewScreen()),
    GetPage(
      name: AppRoutes.cartOverview,
      page: () => const CartOverviewScreen(),
    ),
    GetPage(
      name: AppRoutes.shippingAddress,
      page: () => const ShippingAddressScreen(),
    ),
    GetPage(
      name: AppRoutes.orderConfirmation,
      page: () => const OrderConfirmationScreen(),
    ),
    GetPage(name: AppRoutes.orderReview, page: () => const OrderReviewScreen()),
    GetPage(
      name: AppRoutes.orderSuccess,
      page: () => const OrderSuccessScreen(),
    ),
    GetPage(name: AppRoutes.myOrders, page: () => const MyOrderScreen()),
    GetPage(name: AppRoutes.orderDetail, page: () => const OrderDetailScreen()),
    GetPage(
      name: AppRoutes.popularProduct,
      page: () => const PopularProductScreen(),
    ),
    GetPage(name: AppRoutes.allBrands, page: () => const AllBrandScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),

    // ===== Profile Management Screens =====
    GetPage(
      name: AppRoutes.updateAccount,
      page: () => const UpdateAccountScreen(),
    ),
    GetPage(name: AppRoutes.changeName, page: () => const ChangeNameScreen()),
    GetPage(
      name: AppRoutes.changeUsername,
      page: () => const ChangeUsernameScreen(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(name: AppRoutes.changeEmail, page: () => const ChangeEmailScreen()),
    GetPage(
      name: AppRoutes.changePhoneNumber,
      page: () => const ChangePhoneNumberScreen(),
    ),
    GetPage(
      name: AppRoutes.changeGender,
      page: () => const ChangeGenderScreen(),
    ),
    GetPage(
      name: AppRoutes.changeDateofBirth,
      page: () => const ChangeDateOfBirthScreen(),
    ),

    // ===== Bank & Address Screens =====
    GetPage(
      name: AppRoutes.myBankAccountview,
      page: () => MyBankAccountScreen(),
    ),
    GetPage(
      name: AppRoutes.myShippingAddressview,
      page: () => MyShippingAddressScreen(),
    ),

    // ===== Extra Screens =====
    GetPage(name: AppRoutes.settings, page: () => const MySettingsScreen()),
    GetPage(name: AppRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: AppRoutes.writeReview, page: () => const WriteReviewScreen()),
    GetPage(
      name: AppRoutes.reviewRating,
      page: () => const ReviewRatingScreen(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const MyNotificationsScreen(),
    ),
    GetPage(name: AppRoutes.brandDetail, page: () => const BrandDetailScreen()),
  ];
}
