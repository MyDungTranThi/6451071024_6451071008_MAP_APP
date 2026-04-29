import 'package:get/get.dart';

import 'auth_controller.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  Future<void> _startTimer() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    try {
      final authController = Get.find<AuthController>();
      await authController.syncFromFirebaseSession();

      if (authController.isLoggedIn) {
        Get.offAllNamed(AppRoutes.mainNavigation);
        return;
      }
    } catch (_) {
      // Fallback to onboarding when session sync fails.
    }

    Get.offAllNamed(AppRoutes.onboarding);
  }
}
