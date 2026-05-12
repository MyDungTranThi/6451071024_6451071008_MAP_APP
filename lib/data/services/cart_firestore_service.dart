import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/cart_item_model.dart';
import '../models/book_model.dart';

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

  Stream<List<CartItemModel>> watchCartItems() {
    final ref = _cartItemsRef;
    if (ref == null) return Stream.value(<CartItemModel>[]);

    return ref.snapshots().map((snapshot) {
      final items = <CartItemModel>[];
      for (final doc in snapshot.docs) {
        final item = CartItemModel.fromJson(id: doc.id, json: doc.data());
        if (item.quantity > 0) {
          items.add(item);
        }
      }
      items.sort((a, b) => a.id.compareTo(b.id));
      return items;
    });
  }

  Future<void> setQuantity({
    required String bookId,
    required BookFormat format,
    required int quantity,
  }) async {
    final ref = _requireCartItemsRef();
    final itemId = CartItemModel.buildId(bookId, format);
    final itemRef = ref.doc(itemId);

    if (quantity <= 0) {
      await itemRef.delete();
      return;
    }

    await itemRef.set({
      'bookId': bookId,
      'format': bookFormatToString(format),
      'formatLabel': bookFormatLabel(format),
      'quantity': quantity,
      'updatedAt': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> remove(String itemId) async {
    final ref = _requireCartItemsRef();

    await ref.doc(itemId).delete();
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
