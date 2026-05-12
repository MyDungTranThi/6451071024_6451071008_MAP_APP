import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repositories/settings_repository.dart';

class SettingsController extends GetxController {
  SettingsController({SettingsRepository? settingsRepository})
    : _settingsRepository = settingsRepository ?? SettingsRepository();

  final SettingsRepository _settingsRepository;

  final languageCode = 'vi'.obs;
  final themeMode = ThemeMode.system.obs;
  final fontScale = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    languageCode.value = await _settingsRepository.getLanguageCode();
    themeMode.value = await _settingsRepository.getThemeMode();
    fontScale.value = await _settingsRepository.getFontScale();

    Get.updateLocale(Locale(languageCode.value));
    Get.changeThemeMode(themeMode.value);
  }

  void setLanguage(String lang) {
    languageCode.value = lang;
    Get.updateLocale(Locale(lang));
    _settingsRepository.saveLanguageCode(lang);
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    _settingsRepository.saveThemeMode(mode);
  }

  void setFontScale(double scale) {
    final normalizedScale = scale.clamp(0.85, 1.3).toDouble();
    fontScale.value = normalizedScale;
    _settingsRepository.saveFontScale(normalizedScale);
  }
}
