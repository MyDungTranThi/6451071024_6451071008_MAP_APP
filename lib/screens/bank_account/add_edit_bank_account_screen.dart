import 'package:flutter/material.dart';
import '../../data/models/bank_account_model.dart';
import '../../controller/bank_account_controller.dart';
import '../../data/services/list_bank_api_service.dart';

class EditBankAccountScreen extends StatefulWidget {
  final BankAccountModel? bank;
  const EditBankAccountScreen({super.key, this.bank});

  @override
  State<EditBankAccountScreen> createState() => _EditBankAccountScreenState();
}

class _EditBankAccountScreenState extends State<EditBankAccountScreen> {
  final _controller = BankAccountController();
  final _bankApiService = BankApiService();
  List<dynamic> _banks = [];
  dynamic _selectedBank;
  final _accountNumber = TextEditingController();
  final _accountHolderName = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadBanks();
    if (widget.bank != null) {
      _accountNumber.text = widget.bank!.accountNumber;
      _accountHolderName.text = widget.bank!.accountHolderName;
    }
  }

  Future<void> _loadBanks() async {
    try {
      final banks = await _bankApiService.fetchBanks();
      if (mounted) {
        setState(() {
          _banks = banks;
          if (widget.bank != null) {
            _selectedBank = _banks.firstWhere(
              (b) => b['shortName'] == widget.bank!.shortName,
              orElse: () => null,
            );
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading banks: $e');
    }
  }

  Future<void> _save() async {
    if (_selectedBank == null || _accountNumber.text.trim().isEmpty ||
        _accountHolderName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')));
      return;
    }
    setState(() => _isLoading = true);
    try {
      final bank = BankAccountModel(
        id: widget.bank?.id ?? '',
        accountNumber: _accountNumber.text.trim(),
        accountHolderName: _accountHolderName.text.trim().toUpperCase(),
        bankName: _selectedBank['name'],
        shortName: _selectedBank['shortName'],
        bankCode: _selectedBank['code'],
        bin: _selectedBank['bin'].toString(),
        logo: _selectedBank['logo'],
      );
      if (widget.bank == null) {
        await _controller.addBank(bank);
      } else {
        await _controller.updateBank(bank);
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bank == null ? 'Thêm TK ngân hàng' : 'Sửa TK ngân hàng')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Chọn ngân hàng", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            DropdownButtonFormField<dynamic>(
              isExpanded: true,
              value: _selectedBank,
              hint: const Text("Chọn ngân hàng"),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: _banks.map((bank) => DropdownMenuItem(
                value: bank,
                child: Text(bank['name'], overflow: TextOverflow.ellipsis, maxLines: 1),
              )).toList(),
              onChanged: (value) => setState(() => _selectedBank = value),
            ),
            if (_selectedBank != null) ...[
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    Image.network(
                      _selectedBank['logo'],
                      height: 40,
                      width: 80,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.account_balance, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(_selectedBank['name'], style: const TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                ),
              ),
            ],
            const SizedBox(height: 24),
            TextField(
              controller: _accountNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Số tài khoản',
                prefixIcon: const Icon(Icons.numbers),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _accountHolderName,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                labelText: 'Tên chủ tài khoản',
                prefixIcon: const Icon(Icons.person_outline),
                helperText: "Ví dụ: NGUYEN VAN A",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _save,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.blue, foregroundColor: Colors.white,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Lưu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
