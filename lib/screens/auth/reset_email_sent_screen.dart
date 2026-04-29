import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';

class ResetEmailSentScreen extends StatelessWidget {
  const ResetEmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments as String? ?? '';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email_outlined, size: 100),

              const SizedBox(height: 24),

              const Text(
                'Yêu cầu đã được gửi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text('Liên kết khôi phục mật khẩu đã gửi tới:'),

              const SizedBox(height: 8),

              Text(email, style: const TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 32),

              PrimaryButton(
                title: 'Xong',
                onPressed: () => Get.offAllNamed(AppRoutes.login),
              ),

              TextButton(
                onPressed: () {},
                child: const Text('Gửi lại email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
