import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../controller/update_account_controller.dart';

class ChangeDateOfBirthScreen extends StatefulWidget {
  const ChangeDateOfBirthScreen({super.key});

  @override
  State<ChangeDateOfBirthScreen> createState() => _ChangeDateOfBirthScreenState();
}

class _ChangeDateOfBirthScreenState extends State<ChangeDateOfBirthScreen> {
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UpdateAccountController _controller = Get.put(UpdateAccountController());
  bool _isLoading = false;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thay đổi Ngày sinh')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Ngày sinh',
                  hintText: 'dd/MM/yyyy',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                onTap: _pickDate,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Vui lòng chọn ngày sinh';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () async {
                    if (_formKey.currentState!.validate() && _selectedDate != null) {
                      setState(() => _isLoading = true);
                      await _controller.updateDateOfBirth(_selectedDate!);
                      setState(() => _isLoading = false);
                      Get.back();
                    }
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Lưu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
