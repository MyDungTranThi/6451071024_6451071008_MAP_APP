import 'package:flutter/material.dart';
import 'package:get/get.dart';
// TODO: OrderController/OrderModel cho đơn hàng lịch sử chưa tồn tại
// import '../../controller/order_controller.dart';
// import 'ordered_detail_screen.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Khi có OrderController lịch sử, thay thế placeholder này
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          /// HEADER
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade700, Colors.blue.shade400],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Đơn hàng của tôi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: const IconThemeData(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          /// PLACEHOLDER CONTENT
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_outlined, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text("Chưa có đơn hàng nào",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                  const SizedBox(height: 8),
                  Text("Lịch sử đơn hàng sẽ hiển thị ở đây",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
