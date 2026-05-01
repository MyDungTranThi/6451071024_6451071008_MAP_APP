import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishlistFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>>? get _wishlistRef {
    final uid = _uid;
    if (uid == null || uid.isEmpty) return null;

    return _firestore.collection('users').doc(uid).collection('wishlistItems');
  }

  CollectionReference<Map<String, dynamic>> _requireWishlistRef() {
    final ref = _wishlistRef;
    if (ref == null) {
      throw StateError('Bạn cần đăng nhập để lưu danh sách yêu thích.');
    }

    return ref;
  }

  Stream<Set<String>> watchWishlistItems() {
    final ref = _wishlistRef;
    if (ref == null) return Stream.value(<String>{});

    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.id).toSet();
    });
  }

  Future<void> add(String bookId) async {
    final ref = _requireWishlistRef();

    await ref.doc(bookId).set({
      'bookId': bookId,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> remove(String bookId) async {
    final ref = _requireWishlistRef();

    await ref.doc(bookId).delete();
  }
}
