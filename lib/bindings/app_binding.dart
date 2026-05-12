import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/settings_controller.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/settings_repository.dart';
import '../data/services/auth_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    final authService = Get.put(AuthService(), permanent: true);
    final authRepository = Get.put(
      AuthRepository(authService),
      permanent: true,
    );
    Get.put(AuthController(authRepository), permanent: true);
    Get.put(
      SettingsController(settingsRepository: SettingsRepository()),
      permanent: true,
    );
  }
}
