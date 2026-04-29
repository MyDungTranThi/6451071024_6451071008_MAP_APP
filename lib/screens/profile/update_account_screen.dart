import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/styles/app_colors.dart';
import '../../routes/app_routes.dart';
import 'package:get/get.dart';
import '../../controller/update_account_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateAccountScreen extends StatelessWidget {
  const UpdateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateAccountController controller = Get.put(
      UpdateAccountController(),
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Hồ sơ của tôi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Không thể tải dữ liệu người dùng"),
            );
          }

          final authUserEmail = FirebaseAuth.instance.currentUser?.email;
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final firestoreEmail = data['email'];

          if (authUserEmail != firestoreEmail) {
            controller.syncEmailAfterVerification();
          }

          // Xử lý dữ liệu hiển thị
          final fullName =
              '${data['firstName'] ?? ''} ${data['lastName'] ?? ''}';
          final username = data['username'] ?? 'Chưa cập nhật';
          final email = data['email'] ?? '';
          final phone = data['phone'] ?? 'Chưa cập nhật';
          final id = data['id'] ?? '';
          final gender = data['gender'] ?? 'Chưa cập nhật';

          final dynamic dobData = data['dateOfBirth'];
          String dateOfBirth = 'Chưa cập nhật';
          if (dobData != null) {
            if (dobData is Timestamp) {
              dateOfBirth =
                  DateFormat('dd/MM/yyyy').format(dobData.toDate());
            } else if (dobData is String) {
              dateOfBirth = dobData;
            }
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Header Avatar
                _buildAvatarHeader(context),

                const SizedBox(height: 10),

                // Group 1: Profile Info
                _buildSectionCard(
                  title: 'Thông tin hồ sơ',
                  items: [
                    _buildTile(
                      context,
                      Icons.person_outline,
                      'Họ tên',
                      fullName,
                      () => Get.toNamed(AppRoutes.changeName),
                    ),
                    _buildTile(
                      context,
                      Icons.alternate_email,
                      'Tên đăng nhập',
                      username,
                      () => Get.toNamed(AppRoutes.changeUsername),
                    ),
                    _buildTile(
                      context,
                      Icons.lock_outline,
                      'Mật khẩu',
                      '********',
                      () => Get.toNamed(AppRoutes.changePassword),
                    ),
                  ],
                ),

                // Group 2: Personal Info
                _buildSectionCard(
                  title: 'Thông tin cá nhân',
                  items: [
                    _buildTile(context, Icons.fingerprint, 'User ID', id, () {
                      Clipboard.setData(ClipboardData(text: id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("ID đã được sao chép vào clipboard"),
                        ),
                      );
                    }, trailing: Icons.copy),
                    _buildTile(
                      context,
                      Icons.mail_outline,
                      'Email',
                      email,
                      () => Get.toNamed(AppRoutes.changeEmail),
                    ),
                    _buildTile(
                      context,
                      Icons.phone_android,
                      'Số điện thoại',
                      phone,
                      () => Get.toNamed(AppRoutes.changePhoneNumber),
                    ),
                    _buildTile(
                      context,
                      Icons.cake_outlined,
                      'Ngày sinh',
                      dateOfBirth,
                      () => Get.toNamed(AppRoutes.changeDateofBirth),
                    ),
                    _buildTile(
                      context,
                      Icons.wc_outlined,
                      'Giới tính',
                      gender,
                      () => Get.toNamed(AppRoutes.changeGender),
                    ),
                  ],
                ),

                // Danger Zone
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.redAccent,
                    ),
                    label: const Text(
                      'Đóng tài khoản',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget Avatar với Header background
  Widget _buildAvatarHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 30),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: Image.network(
                      'https://i.pravatar.cc/300',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.person, size: 50, color: Colors.grey[400]),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Thay đổi ảnh đại diện",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Widget Card bao bọc một section
  Widget _buildSectionCard({
    required String title,
    required List<Widget> items,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }

  // Widget từng dòng thông tin
  Widget _buildTile(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    VoidCallback onTap, {
    IconData trailing = Icons.arrow_forward_ios,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 22, color: Colors.grey[600]),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(trailing, size: 14, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
