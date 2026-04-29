import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Splash must be created immediately so onInit() can start timer/navigation.
    Get.put(SplashController());
  }
}
