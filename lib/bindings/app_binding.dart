import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../data/services/auth_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    final authService = Get.put(AuthService(), permanent: true);
    Get.put(AuthController(authService), permanent: true);
  }
}
