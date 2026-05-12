import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../data/models/user_model.dart';
import '../data/repositories/auth_repository.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  AuthController(this._authRepository);

  final AuthRepository _authRepository;

  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  final RxBool isLoading = false.obs;
  final RxBool isRegistering = false.obs;

  bool get isLoggedIn => currentUser.value != null;

  @override
  void onInit() {
    super.onInit();
    syncFromFirebaseSession();
  }

  Future<void> syncFromFirebaseSession() async {
    final firebaseUser = _authRepository.currentFirebaseUser;
    if (firebaseUser == null) {
      currentUser.value = null;
      return;
    }

    if (!firebaseUser.emailVerified) {
      await _authRepository.logout();
      currentUser.value = null;
      return;
    }

    final profile = await _authRepository.fetchUserProfile(firebaseUser.uid);
    if (profile != null) {
      currentUser.value = profile.copyWith(
        email: firebaseUser.email ?? profile.email,
        emailVerified: true,
      );
      return;
    }

    currentUser.value = UserModel(
      id: firebaseUser.uid,
      firstName: '',
      lastName: '',
      username: firebaseUser.email?.split('@').first ?? '',
      email: firebaseUser.email ?? '',
      phone: '',
      emailVerified: true,
    );
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final user = await _authRepository.loginWithEmailPassword(
        email,
        password,
      );
      currentUser.value = user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Email does not exist');
      }
      if (e.code == 'wrong-password') {
        throw Exception('Wrong password');
      }
      throw Exception(e.message ?? 'Login failed');
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    isRegistering.value = true;
    try {
      final userModel = UserModel(
        id: '',
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phone: phone,
      );

      await _authRepository.registerUser(
        userModel: userModel,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email is already in use';
      }
      if (e.code == 'weak-password') {
        return 'Password is too weak';
      }
      if (e.code == 'invalid-email') {
        return 'Email is invalid';
      }
      return e.message ?? 'Register failed';
    } catch (e) {
      return e.toString();
    } finally {
      isRegistering.value = false;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authRepository.sendPasswordResetEmail(email);
  }

  Future<void> resendEmailVerification() async {
    await _authRepository.resendEmailVerification();
  }

  Future<bool> refreshVerificationStatus() async {
    final user = await _authRepository.reloadCurrentUser();
    if (user == null || !user.emailVerified) {
      return false;
    }

    await syncFromFirebaseSession();
    return isLoggedIn;
  }

  Future<void> logout() async {
    await _authRepository.logout();
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> updateLocalProfile({
    required String firstName,
    required String lastName,
    required String username,
    required String phone,
  }) async {
    final user = currentUser.value;
    if (user == null) {
      return;
    }

    final updated = user.copyWith(
      firstName: firstName,
      lastName: lastName,
      username: username,
      phone: phone,
    );
    await _authRepository.updateProfile(updated);
    currentUser.value = updated;
  }
}
