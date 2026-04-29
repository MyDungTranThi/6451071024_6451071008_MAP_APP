import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.verified_rounded, size: 92, color: Colors.green),
              const SizedBox(height: 24),
              const Text(
                'Your account is ready',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Email verification completed successfully.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                title: 'Continue to login',
                onPressed: () => Get.offAllNamed(AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
