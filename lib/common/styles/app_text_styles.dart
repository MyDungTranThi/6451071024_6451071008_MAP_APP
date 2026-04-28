import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle title = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
  );

  static TextStyle subtitle = const TextStyle(
    fontSize: 14,
    color: AppColors.grey,
  );

  static TextStyle whiteTitle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle whiteSubtitle = const TextStyle(
    fontSize: 14,
    color: Colors.white70,
  );
}
