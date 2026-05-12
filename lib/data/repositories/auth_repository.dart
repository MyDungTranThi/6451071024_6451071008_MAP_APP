import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthRepository {
  AuthRepository(this._authService);

  final AuthService _authService;

  Future<UserModel> loginWithEmailPassword(String email, String password) {
    return _authService.loginWithEmailPassword(email, password);
  }

  Future<void> registerUser({
    required UserModel userModel,
    required String password,
  }) {
    return _authService.registerUser(userModel: userModel, password: password);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _authService.sendPasswordResetEmail(email);
  }

  Future<void> logout() {
    return _authService.logout();
  }

  Future<UserModel?> fetchUserProfile(String uid) {
    return _authService.fetchUserProfile(uid);
  }

  Future<void> updateProfile(UserModel userModel) {
    return _authService.updateProfile(userModel);
  }

  Future<void> resendEmailVerification() {
    return _authService.resendEmailVerification();
  }

  Future<User?> reloadCurrentUser() {
    return _authService.reloadCurrentUser();
  }

  User? get currentFirebaseUser => _authService.currentFirebaseUser;
}
