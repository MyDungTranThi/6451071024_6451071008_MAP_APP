import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/styles/app_colors.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      initialRoute: AppRoutes.mainNavigation,
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
    );
  }
}
