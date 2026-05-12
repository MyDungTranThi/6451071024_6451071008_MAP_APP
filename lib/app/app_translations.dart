import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'vi': {
      'settings.title': 'Cài đặt',
      'settings.system_title': 'Cài đặt hệ thống',
      'settings.appearance_language': 'Giao diện & Ngôn ngữ',
      'settings.theme': 'Giao diện',
      'settings.theme_system': 'Theo hệ thống',
      'settings.theme_light': 'Chế độ sáng',
      'settings.theme_dark': 'Chế độ tối',
      'settings.language': 'Ngôn ngữ',
      'settings.language_vi': 'Tiếng Việt',
      'settings.language_en': 'English',
      'settings.font_size': 'Cỡ chữ',
      'settings.font_size_description':
          'Điều chỉnh này được áp dụng cho toàn bộ ứng dụng.',
    },
    'en': {
      'settings.title': 'Settings',
      'settings.system_title': 'System settings',
      'settings.appearance_language': 'Appearance & Language',
      'settings.theme': 'Theme',
      'settings.theme_system': 'System default',
      'settings.theme_light': 'Light mode',
      'settings.theme_dark': 'Dark mode',
      'settings.language': 'Language',
      'settings.language_vi': 'Vietnamese',
      'settings.language_en': 'English',
      'settings.font_size': 'Font size',
      'settings.font_size_description':
          'This adjustment is applied across the entire app.',
    },
  };
}
