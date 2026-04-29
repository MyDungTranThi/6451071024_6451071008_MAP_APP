import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/update_account_controller.dart';

enum Gender { male, female, other }

class ChangeGenderScreen extends StatefulWidget {
  const ChangeGenderScreen({super.key});

  @override
  State<ChangeGenderScreen> createState() => _ChangeGenderScreenState();
}

class _ChangeGenderScreenState extends State<ChangeGenderScreen> {
  Gender _selectedGender = Gender.male;
  final UpdateAccountController _controller = Get.put(UpdateAccountController());
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thay đổi Giới tính')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Chọn giới tính của bạn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            RadioListTile<Gender>(
              title: const Text('Nam'),
              value: Gender.male,
              groupValue: _selectedGender,
              onChanged: (v) => setState(() => _selectedGender = v!),
            ),
            RadioListTile<Gender>(
              title: const Text('Nữ'),
              value: Gender.female,
              groupValue: _selectedGender,
              onChanged: (v) => setState(() => _selectedGender = v!),
            ),
            RadioListTile<Gender>(
              title: const Text('Khác'),
              value: Gender.other,
              groupValue: _selectedGender,
              onChanged: (v) => setState(() => _selectedGender = v!),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : () async {
                  setState(() => _isLoading = true);
                  await _controller.updateGender(_selectedGender.name);
                  setState(() => _isLoading = false);
                  Get.back();
                },
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Lưu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
