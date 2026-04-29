import 'package:flutter/material.dart';
// TODO: Phần chi tiết đơn hàng sẽ được tích hợp khi có OrderModel lịch sử đầy đủ
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../data/models/order_model.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Khi có OrderModel lịch sử, hiển thị chi tiết đơn hàng đầy đủ
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text("Chi tiết đơn hàng", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade700, Colors.blue.shade400],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long_outlined, size: 80, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text("Chi tiết đơn hàng sẽ hiển thị ở đây",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
