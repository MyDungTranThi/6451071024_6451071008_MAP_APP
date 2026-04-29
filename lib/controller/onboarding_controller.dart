import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/onboarding_model.dart';
import '../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingModel> onboardingPages = const [
    OnboardingModel(
      title: 'Khám phá Sách',
      description: 'Tìm kiếm sách theo tiêu đề, tác giả và thể loại chỉ trong vài giây.',
      iconName: 'menu_book',
    ),
    OnboardingModel(
      title: 'Yêu thích',
      description: 'Lưu lại những cuốn sách yêu thích của bạn và đọc bất cứ lúc nào.',
      iconName: 'favorite',
    ),
    OnboardingModel(
      title: 'Thanh toán dễ dàng',
      description: 'Đặt mua sách nhanh chóng với quy trình thanh toán mượt mà.',
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
