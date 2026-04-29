import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.find<AuthController>();

  bool obscurePassword = true;
  bool agreePolicy = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    if (!agreePolicy) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree with Privacy and Terms.')),
      );
      return;
    }

    final error = await authController.register(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) {
      return;
    }

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    Get.offNamed(
      AppRoutes.verifyEmail,
      arguments: emailController.text.trim(),
    );
  }

  InputDecoration _inputDecoration(
    String label,
    IconData icon, {
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Fill in details to create your Book Store account.'),
                const SizedBox(height: 24),
                TextFormField(
                  controller: firstNameController,
                  decoration: _inputDecoration('First name', Icons.person),
                  validator: (value) =>
                      Validators.validateRequired(value ?? '', 'First name'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: lastNameController,
                  decoration: _inputDecoration('Last name', Icons.person_outline),
                  validator: (value) =>
                      Validators.validateRequired(value ?? '', 'Last name'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: usernameController,
                  decoration: _inputDecoration('Username', Icons.alternate_email),
                  validator: (value) =>
                      Validators.validateRequired(value ?? '', 'Username'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email', Icons.email_outlined),
                  validator: (value) => Validators.validateEmail(value ?? ''),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration('Phone number', Icons.phone_outlined),
                  validator: (value) => Validators.validatePhone(value ?? ''),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: _inputDecoration(
                    'Password',
                    Icons.lock_outline,
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
                CheckboxListTile(
                  value: agreePolicy,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) => setState(() => agreePolicy = value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('I agree to Privacy and Terms'),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PrimaryButton(
                    title: 'Create account',
                    isLoading: authController.isRegistering.value,
                    onPressed: _submit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
