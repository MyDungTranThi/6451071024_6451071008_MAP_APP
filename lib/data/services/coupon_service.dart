import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/coupon_model.dart';

class CouponService {
  CouponService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  static const _defaultCoupons = <CouponModel>[
    CouponModel(code: 'BOOK10', type: 'percent', value: 10, maxDiscount: 50000),
    CouponModel(code: 'SALE10', type: 'percent', value: 10, maxDiscount: 50000),
    CouponModel(code: 'FREESHIP', type: 'freeShipping', value: 0),
    CouponModel(
      code: 'SALE50K',
      type: 'fixed',
      value: 50000,
      minSubtotal: 300000,
    ),
  ];

  Future<CouponModel?> findByCode(String code) async {
    final normalizedCode = code.trim().toUpperCase();
    if (normalizedCode.isEmpty) return null;

    final firestoreCoupon = await _findFromFirestore(normalizedCode);
    if (firestoreCoupon != null) return firestoreCoupon;

    for (final coupon in _defaultCoupons) {
      if (coupon.code == normalizedCode) return coupon;
    }

    return null;
  }

  Future<CouponModel?> _findFromFirestore(String code) async {
    try {
      final doc = await _firestore.collection('coupons').doc(code).get();
      if (doc.exists) {
        return CouponModel.fromJson({'code': code, ...?doc.data()});
      }

      final query = await _firestore
          .collection('coupons')
          .where('code', isEqualTo: code)
          .limit(1)
          .get();
      if (query.docs.isEmpty) return null;

      final firstDoc = query.docs.first;
      return CouponModel.fromJson({'code': code, ...firstDoc.data()});
    } catch (_) {
      return null;
    }
  }
}
