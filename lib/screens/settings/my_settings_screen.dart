import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/settings_controller.dart';

class MySettingsScreen extends StatelessWidget {
  const MySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.system_title'.tr),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'settings.appearance_language'.tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildThemeSelector(controller),
          const Divider(height: 32),
          _buildLanguageSelector(controller),
          const Divider(height: 32),
          _buildFontScaleSelector(controller),
        ],
      ),
    );
  }

  Widget _buildThemeSelector(SettingsController controller) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'settings.theme'.tr,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          RadioListTile<ThemeMode>(
            title: Text('settings.theme_system'.tr),
            value: ThemeMode.system,
            groupValue: controller.themeMode.value,
            onChanged: (mode) => controller.setThemeMode(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: Text('settings.theme_light'.tr),
            value: ThemeMode.light,
            groupValue: controller.themeMode.value,
            onChanged: (mode) => controller.setThemeMode(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: Text('settings.theme_dark'.tr),
            value: ThemeMode.dark,
            groupValue: controller.themeMode.value,
            onChanged: (mode) => controller.setThemeMode(mode!),
          ),
        ],
      );
    });
  }

  Widget _buildLanguageSelector(SettingsController controller) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'settings.language'.tr,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          RadioListTile<String>(
            title: Text('settings.language_vi'.tr),
            value: 'vi',
            groupValue: controller.languageCode.value,
            onChanged: (lang) => controller.setLanguage(lang!),
          ),
          RadioListTile<String>(
            title: Text('settings.language_en'.tr),
            value: 'en',
            groupValue: controller.languageCode.value,
            onChanged: (lang) => controller.setLanguage(lang!),
          ),
        ],
      );
    });
  }

  Widget _buildFontScaleSelector(SettingsController controller) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'settings.font_size'.tr,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text('${(controller.fontScale.value * 100).round()}%'),
            ],
          ),
          Slider(
            min: 0.85,
            max: 1.3,
            divisions: 9,
            value: controller.fontScale.value,
            label: '${(controller.fontScale.value * 100).round()}%',
            onChanged: controller.setFontScale,
          ),
          Text(
            'settings.font_size_description'.tr,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      );
    });
  }
}
