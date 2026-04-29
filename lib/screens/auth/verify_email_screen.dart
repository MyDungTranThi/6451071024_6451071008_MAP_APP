import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final authController = Get.find<AuthController>();
  bool isChecking = false;
  bool isResending = false;

  @override
  Widget build(BuildContext context) {
    final email = (Get.arguments as String?)?.trim() ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('Xác minh email')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mark_email_unread_outlined, size: 92),
              const SizedBox(height: 24),
              const Text(
                'Xác minh địa chỉ email của bạn',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Một liên kết xác minh đã được gửi đến:',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                email.isEmpty ? 'email của bạn' : email,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                title: 'Tôi đã xác minh',
                isLoading: isChecking,
                onPressed: () async {
                  setState(() => isChecking = true);
                  try {
                    final verified = await authController.refreshVerificationStatus();
                    if (!mounted) {
                      return;
                    }
                    if (!verified) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Vui lòng xác minh email trước khi tiếp tục.',
                          ),
                        ),
                      );
                      return;
                    }
                    Get.offAllNamed(AppRoutes.registerSuccess);
                  } finally {
                    if (mounted) {
                      setState(() => isChecking = false);
                    }
                  }
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: isResending
                    ? null
                    : () async {
                        setState(() => isResending = true);
                        try {
                          await authController.resendEmailVerification();
                          if (!mounted) {
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email xác minh đã được gửi lại.'),
                            ),
                          );
                        } catch (e) {
                          if (!mounted) {
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                e.toString().replaceFirst('Exception: ', ''),
                              ),
                            ),
                          );
                        } finally {
                          if (mounted) {
                            setState(() => isResending = false);
                          }
                        }
                      },
                child: const Text('Gửi lại email'),
              ),
              TextButton(
                onPressed: () => Get.offAllNamed(AppRoutes.login),
                child: const Text('Quay lại đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
