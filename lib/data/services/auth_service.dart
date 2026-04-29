import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthService {
  AuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _usersRef =>
      _firestore.collection('users');

  Future<UserModel> loginWithEmailPassword(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final firebaseUser = credential.user;
    if (firebaseUser == null) {
      throw Exception('User not found');
    }
    if (!firebaseUser.emailVerified) {
      throw Exception('Email not verified');
    }

    final profile = await fetchUserProfile(firebaseUser.uid);
    if (profile != null) {
      return profile;
    }

    return UserModel(
      id: firebaseUser.uid,
      firstName: '',
      lastName: '',
      username: firebaseUser.email?.split('@').first ?? '',
      email: firebaseUser.email ?? email,
      phone: '',
      emailVerified: firebaseUser.emailVerified,
    );
  }

  Future<void> registerUser({
    required UserModel userModel,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: userModel.email,
      password: password,
    );

    final user = credential.user;
    if (user == null) {
      throw Exception('Cannot create user');
    }

    await user.sendEmailVerification();
    final payload = userModel.copyWith(
      id: user.uid,
      emailVerified: false,
    );
    await _usersRef.doc(user.uid).set(payload.toMap());
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<UserModel?> fetchUserProfile(String uid) async {
    final doc = await _usersRef.doc(uid).get();
    if (!doc.exists || doc.data() == null) {
      return null;
    }
    return UserModel.fromMap(doc.data()!);
  }

  Future<void> updateProfile(UserModel userModel) async {
    await _usersRef.doc(userModel.id).set(userModel.toMap(), SetOptions(merge: true));
  }

  Future<void> resendEmailVerification() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('No active user session');
    }
    await user.sendEmailVerification();
  }

  Future<User?> reloadCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) {
      return null;
    }
    await user.reload();
    return _auth.currentUser;
  }

  User? get currentFirebaseUser => _auth.currentUser;
}
