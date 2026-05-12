import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/update_account_service.dart';

class UpdateAccountRepository {
  UpdateAccountRepository({UpdateAccountService? updateAccountService})
    : _updateAccountService = updateAccountService ?? UpdateAccountService();

  final UpdateAccountService _updateAccountService;

  Future<void> updateName({
    required String userId,
    required String firstName,
    required String lastName,
  }) {
    return _updateAccountService.updateName(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
    );
  }

  Future<void> updateUsername(String username) {
    return _updateAccountService.updateUsername(username);
  }

  Future<void> updateEmail(String email) {
    return _updateAccountService.updateEmail(email);
  }

  Future<void> syncEmailAfterVerification() {
    return _updateAccountService.syncEmailAfterVerification();
  }

  Future<void> updateGender(String gender) {
    return _updateAccountService.updateGender(gender);
  }

  Future<void> updateDateOfBirth(DateTime date) {
    return _updateAccountService.updateDateOfBirth(date);
  }

  Future<void> updatePhone(String phone) {
    return _updateAccountService.updatePhone(phone);
  }

  Stream<DocumentSnapshot> getUserData() {
    return _updateAccountService.getUserData();
  }
}
