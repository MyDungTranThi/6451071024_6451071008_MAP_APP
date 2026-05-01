import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';
import '../../common/widgets/profile_menu_item.dart';
import '../../controller/auth_controller.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_routes.dart';
import '../bank_account/my_bank_account_screen.dart';
import '../shipping_address/my_shipping_address_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() {
        final user = authController.currentUser.value;
        if (user == null) {
          return _buildGuestProfile(context);
        }
        return _buildUserProfile(context, authController, user);
      }),
    );
  }

  /// ===== Logged-in Profile =====
  Widget _buildUserProfile(
    BuildContext context,
    AuthController authController,
    UserModel user,
  ) {
    return Column(
      children: [
        _buildHeader(context, authController, user),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAccountSetting(context),
                  const SizedBox(height: 24),
                  Text('Cài đặt ứng dụng', style: AppTextStyles.title),
                  const SizedBox(height: 16),
                  _buildLogoutButton(context, authController),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// ===== Header xanh =====
  Widget _buildHeader(BuildContext context, AuthController authController, UserModel user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      color: AppColors.primaryBlue,
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white24,
            child: ClipOval(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue, size: 40),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName.isEmpty ? 'Book Store User' : user.fullName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(user.email, style: const TextStyle(fontSize: 14, color: Colors.white70)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.updateAccount),
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }

  /// ===== Account Setting =====
  Widget _buildAccountSetting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cài đặt tài khoản', style: AppTextStyles.title),
        const SizedBox(height: 16),
        ProfileMenuItem(
          icon: Icons.location_on,
          title: 'Địa chỉ của tôi',
          subtitle: 'Quản lý địa chỉ giao hàng',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyShippingAddressScreen())),
        ),
        ProfileMenuItem(
          icon: Icons.favorite,
          title: 'Danh sách yêu thích',
          subtitle: 'Xem các mặt hàng bạn đã thích',
          onTap: () => Get.toNamed(AppRoutes.wishlist),
        ),
        ProfileMenuItem(
          icon: Icons.shopping_cart,
          title: 'Giỏ hàng của tôi',
          subtitle: 'Xem các mặt hàng trong giỏ hàng',
          onTap: () => Get.toNamed(AppRoutes.cartOverview),
        ),
        ProfileMenuItem(
          icon: Icons.receipt_long,
          title: 'Đơn hàng của tôi',
          subtitle: 'Xem trạng thái đơn hàng',
          onTap: () => Get.toNamed(AppRoutes.myOrders),
        ),
        ProfileMenuItem(
          icon: Icons.account_balance,
          title: 'Tài khoản ngân hàng',
          subtitle: 'Quản lý phương thức thanh toán',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyBankAccountScreen())),
        ),
        ProfileMenuItem(
          icon: Icons.discount,
          title: 'Mã giảm giá',
          subtitle: 'Xem các mã giảm giá có sẵn',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.settings,
          title: 'Cài đặt',
          subtitle: 'Giao diện và ngôn ngữ',
          onTap: () => Get.toNamed(AppRoutes.settings),
        ),
        ProfileMenuItem(
          icon: Icons.lock,
          title: 'Bảo mật tài khoản',
          subtitle: 'Cài đặt bảo mật và quyền riêng tư',
          onTap: () {},
        ),
      ],
    );
  }

  /// ===== Logout =====
  Widget _buildLogoutButton(BuildContext context, AuthController authController) {
    return GestureDetector(
      onTap: () async {
        bool? confirm = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Đăng xuất'),
            content: const Text('Bạn có chắc muốn đăng xuất không?'),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Hủy')),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('Đăng xuất', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
        if (confirm == true) {
          await authController.logout();
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text('Đăng xuất', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  /// ===== Guest Profile =====
  Widget _buildGuestProfile(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
          color: AppColors.primaryBlue,
          child: Column(
            children: [
              const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
              const SizedBox(height: 16),
              const Text('Guest User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                child: const Text('Đăng nhập ngay'),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text('Vui lòng đăng nhập để sử dụng đầy đủ tính năng', style: TextStyle(color: Colors.grey[600])),
          ),
        ),
      ],
    );
  }
}
