import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/settings_controller.dart';

class MySettingsScreen extends StatelessWidget {
  const MySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller can be initialized in the binding, assuming it's available.
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Giao diện & Ngôn ngữ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildThemeSelector(controller),
          const Divider(height: 32),
          _buildLanguageSelector(controller),
        ],
      ),
    );
  }

  Widget _buildThemeSelector(SettingsController controller) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Giao diện',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          RadioListTile<ThemeMode>(
            title: const Text('Theo hệ thống'),
            value: ThemeMode.system,
            groupValue: controller.themeMode.value,
            onChanged: (mode) => controller.setThemeMode(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Chế độ sáng'),
            value: ThemeMode.light,
            groupValue: controller.themeMode.value,
            onChanged: (mode) => controller.setThemeMode(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Chế độ tối'),
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
          const Text(
            'Ngôn ngữ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          RadioListTile<String>(
            title: const Text('Tiếng Việt'),
            value: 'vi',
            groupValue: controller.languageCode.value,
            onChanged: (lang) => controller.setLanguage(lang!),
          ),
          RadioListTile<String>(
            title: const Text('English'),
            value: 'en',
            groupValue: controller.languageCode.value,
            onChanged: (lang) => controller.setLanguage(lang!),
          ),
        ],
      );
    });
  }
}
