import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/services/preferences_helper.dart';

class SettingsController extends GetxController {
  var languageCode = 'vi'.obs;
  var themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    languageCode.value = await PreferencesHelper.getLanguageCode();
    themeMode.value = await PreferencesHelper.getThemeMode();
    
    Get.updateLocale(Locale(languageCode.value));
    Get.changeThemeMode(themeMode.value);
  }

  void setLanguage(String lang) {
    languageCode.value = lang;
    Get.updateLocale(Locale(lang));
    PreferencesHelper.saveLanguageCode(lang);
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    PreferencesHelper.saveThemeMode(mode);
  }
}
