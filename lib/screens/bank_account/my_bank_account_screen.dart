import 'package:flutter/material.dart';
import '../../controller/bank_account_controller.dart';
import '../../data/models/bank_account_model.dart';
import 'add_edit_bank_account_screen.dart';

class MyBankAccountScreen extends StatelessWidget {
  final BankAccountController _controller = BankAccountController();

  MyBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: const Text('Tài khoản ngân hàng',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const EditBankAccountScreen())),
        label: const Text('Thêm TK', style: TextStyle(fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<List<BankAccountModel>>(
        stream: _controller.getBanks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final banks = snapshot.data ?? [];
          if (banks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance_wallet_outlined, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  const Text('Chưa có tài khoản ngân hàng',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: banks.length,
            itemBuilder: (context, index) => _buildBankCard(context, banks[index]),
          );
        },
      ),
    );
  }

  Widget _buildBankCard(BuildContext context, BankAccountModel bank) {
    String masked = bank.accountNumber.length > 4
        ? '**** **** ${bank.accountNumber.substring(bank.accountNumber.length - 4)}'
        : bank.accountNumber;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ListTile(
        leading: Image.network(bank.logo, width: 50, height: 50,
            errorBuilder: (_, __, ___) => const Icon(Icons.account_balance, size: 40)),
        title: Text(bank.shortName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(masked, style: TextStyle(color: Colors.grey.shade600, letterSpacing: 1.2)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => EditBankAccountScreen(bank: bank)))),
            IconButton(icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () => _confirmDelete(context, bank)),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, BankAccountModel bank) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Xóa tài khoản?'),
        content: Text('Bạn có chắc muốn xóa ${bank.shortName}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Xóa', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await _controller.deleteBank(bank.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã xóa ${bank.shortName}')));
      }
    }
  }
}
