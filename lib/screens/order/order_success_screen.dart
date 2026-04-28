import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../routes/app_routes.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 20),
              const Text("Đặt hàng thành công!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Cảm ơn bạn đã mua sách"),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  cart.clear();
                  Get.offAllNamed(AppRoutes.mainNavigation);
                },
                child: const Text("Tiếp tục mua sách"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
