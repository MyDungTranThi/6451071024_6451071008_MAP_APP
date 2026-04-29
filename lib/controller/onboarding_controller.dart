import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/onboarding_model.dart';
import '../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingModel> onboardingPages = const [
    OnboardingModel(
      title: 'Discover Books',
      description: 'Find books by title, author, and genre in seconds.',
      iconName: 'menu_book',
    ),
    OnboardingModel(
      title: 'Add To Wishlist',
      description: 'Save your favorite books and come back anytime.',
      iconName: 'favorite',
    ),
    OnboardingModel(
      title: 'Checkout Fast',
      description: 'Place your order quickly with a smooth checkout flow.',
      iconName: 'shopping_cart_checkout',
    ),
  ];

  bool get isLastPage => currentPage.value == onboardingPages.length - 1;

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    if (isLastPage) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    Get.offAllNamed(AppRoutes.login);
  }

  IconData iconFromName(String iconName) {
    switch (iconName) {
      case 'menu_book':
        return Icons.menu_book_rounded;
      case 'favorite':
        return Icons.favorite_rounded;
      case 'shopping_cart_checkout':
        return Icons.shopping_cart_checkout_rounded;
      default:
        return Icons.auto_stories_rounded;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
