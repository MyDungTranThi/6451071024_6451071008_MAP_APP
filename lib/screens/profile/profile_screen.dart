import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../controller/auth_controller.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Obx(() {
        final user = authController.currentUser.value;
        if (user == null) {
          return _buildRequireLogin();
        }
        return _buildProfileContent(context, authController, user);
      }),
    );
  }

  Widget _buildRequireLogin() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person_outline, size: 72),
            const SizedBox(height: 12),
            const Text(
              'Login to manage your profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              title: 'Go to login',
              onPressed: () => Get.toNamed(AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    AuthController authController,
    UserModel user,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(user.fullName.isEmpty ? 'Book Store User' : user.fullName),
            subtitle: Text(user.email),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.alternate_email),
                title: const Text('Username'),
                subtitle: Text(user.username),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.phone_outlined),
                title: const Text('Phone'),
                subtitle: Text(user.phone.isEmpty ? '-' : user.phone),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.verified_user_outlined),
                title: const Text('Email verified'),
                subtitle: Text(user.emailVerified ? 'Verified' : 'Pending verify'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        PrimaryButton(
          title: 'Edit profile',
          onPressed: () => _showEditProfileDialog(context, authController, user),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: authController.logout,
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ],
    );
  }

  void _showEditProfileDialog(
    BuildContext context,
    AuthController authController,
    UserModel user,
  ) {
    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController(text: user.firstName);
    final lastNameController = TextEditingController(text: user.lastName);
    final usernameController = TextEditingController(text: user.username);
    final phoneController = TextEditingController(text: user.phone);

    Get.dialog(
      AlertDialog(
        title: const Text('Edit profile'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First name'),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Required'
                      : null,
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last name'),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Required'
                      : null,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Required'
                      : null,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: Get.back, child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) {
                return;
              }
              await authController.updateLocalProfile(
                firstName: firstNameController.text.trim(),
                lastName: lastNameController.text.trim(),
                username: usernameController.text.trim(),
                phone: phoneController.text.trim(),
              );
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ).whenComplete(() {
      firstNameController.dispose();
      lastNameController.dispose();
      usernameController.dispose();
      phoneController.dispose();
    });
  }
}
