import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>>? get _cartItemsRef {
    final uid = _uid;
    if (uid == null || uid.isEmpty) return null;

    return _firestore.collection('users').doc(uid).collection('cartItems');
  }

  CollectionReference<Map<String, dynamic>> _requireCartItemsRef() {
    final ref = _cartItemsRef;
    if (ref == null) {
      throw StateError('Bạn cần đăng nhập để lưu giỏ hàng.');
    }

    return ref;
  }

  Stream<Map<String, int>> watchCartItems() {
    final ref = _cartItemsRef;
    if (ref == null) return Stream.value(<String, int>{});

    return ref.snapshots().map((snapshot) {
      final items = <String, int>{};
      for (final doc in snapshot.docs) {
        final quantity = (doc.data()['quantity'] as num?)?.toInt() ?? 0;
        if (quantity > 0) {
          items[doc.id] = quantity;
        }
      }
      return items;
    });
  }

  Future<void> setQuantity(String bookId, int quantity) async {
    final ref = _requireCartItemsRef();

    final itemRef = ref.doc(bookId);
    if (quantity <= 0) {
      await itemRef.delete();
      return;
    }

    await itemRef.set({
      'bookId': bookId,
      'quantity': quantity,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> remove(String bookId) async {
    final ref = _requireCartItemsRef();

    await ref.doc(bookId).delete();
  }

  Future<void> clear() async {
    final ref = _requireCartItemsRef();

    final snapshot = await ref.get();
    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
