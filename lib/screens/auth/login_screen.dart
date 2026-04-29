import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.find<AuthController>();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    try {
      await authController.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (!mounted) {
        return;
      }
      Get.offAllNamed(AppRoutes.mainNavigation);
    } catch (e) {
      if (!mounted) {
        return;
      }
      final message = e.toString().replaceFirst('Exception: ', '');
      if (message.toLowerCase().contains('email not verified')) {
        Get.toNamed(
          AppRoutes.verifyEmail,
          arguments: emailController.text.trim(),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Login to continue shopping books.'),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => Validators.validateEmail(value ?? ''),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (value) => Validators.validatePassword(value ?? ''),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.forgetPassword),
                    child: const Text('Forget password?'),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => PrimaryButton(
                    title: 'Login',
                    isLoading: authController.isLoading.value,
                    onPressed: _submit,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No account yet?'),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.register),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
