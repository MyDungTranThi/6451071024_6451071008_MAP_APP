import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/app_binding.dart';
import '../common/styles/app_colors.dart';
import '../controller/settings_controller.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';
import 'app_translations.dart';

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.isRegistered<SettingsController>()
        ? Get.find<SettingsController>()
        : Get.put(SettingsController(), permanent: true);

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Store',
        initialRoute: AppRoutes.splash,
        initialBinding: AppBinding(),
        getPages: AppPages.pages,
        translations: AppTranslations(),
        locale: Locale(settings.languageCode.value),
        fallbackLocale: const Locale('vi'),
        themeMode: settings.themeMode.value,
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaler: TextScaler.linear(settings.fontScale.value),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
          scaffoldBackgroundColor: AppColors.background,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryBlue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
