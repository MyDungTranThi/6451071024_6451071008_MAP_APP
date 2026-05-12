import 'package:flutter/material.dart';

import '../services/preferences_helper.dart';

class SettingsRepository {
  Future<void> saveLanguageCode(String languageCode) {
    return PreferencesHelper.saveLanguageCode(languageCode);
  }

  Future<String> getLanguageCode() {
    return PreferencesHelper.getLanguageCode();
  }

  Future<void> saveThemeMode(ThemeMode mode) {
    return PreferencesHelper.saveThemeMode(mode);
  }

  Future<ThemeMode> getThemeMode() {
    return PreferencesHelper.getThemeMode();
  }

  Future<void> saveFontScale(double scale) {
    return PreferencesHelper.saveFontScale(scale);
  }

  Future<double> getFontScale() {
    return PreferencesHelper.getFontScale();
  }
}
