import 'package:get/get.dart';

import '../data/repositories/update_account_repository.dart';
import 'auth_controller.dart';

class UpdateAccountController extends GetxController {
  UpdateAccountController({UpdateAccountRepository? updateAccountRepository})
    : _updateAccountRepository =
          updateAccountRepository ?? UpdateAccountRepository();

  final UpdateAccountRepository _updateAccountRepository;

  Future<void> changeName(String fullName) async {
    final authController = Get.find<AuthController>();

    final user = authController.currentUser.value;

    if (user == null) return;

    // Tách firstName + lastName
    List<String> parts = fullName.trim().split(' ');

    String firstName = parts.first;
    String lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    // Update Firestore
    await _updateAccountRepository.updateName(
      userId: user.id,
      firstName: firstName,
      lastName: lastName,
    );

    // Update local currentUser
    authController.currentUser.value = user.copyWith(
      firstName: firstName,
      lastName: lastName,
    );
  }

  Future<void> updateUsername(String username) async {
    await _updateAccountRepository.updateUsername(username);
  }

  Future<void> updateEmail(String email) async {
    await _updateAccountRepository.updateEmail(email);
  }

  Future<void> syncEmailAfterVerification() async {
    await _updateAccountRepository.syncEmailAfterVerification();
  }

  Future<void> updateGender(String gender) async {
    await _updateAccountRepository.updateGender(gender);
  }

  Future<void> updateDateOfBirth(DateTime date) async {
    await _updateAccountRepository.updateDateOfBirth(date);
  }

  Future<void> updatePhone(String phone) async {
    await _updateAccountRepository.updatePhone(phone);
  }

  Stream getUserData() {
    return _updateAccountRepository.getUserData();
  }
}
