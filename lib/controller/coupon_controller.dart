import 'package:get/get.dart';

import '../data/models/coupon_model.dart';
import '../data/repositories/coupon_repository.dart';

class CouponController extends GetxController {
  CouponController(this._couponRepository);

  final CouponRepository _couponRepository;

  final Rxn<CouponModel> appliedCoupon = Rxn<CouponModel>();
  final RxDouble discountAmount = 0.0.obs;
  final RxBool isApplying = false.obs;
  final RxString errorMessage = ''.obs;

  String get appliedCode => appliedCoupon.value?.code ?? '';

  double previewDiscount({
    required double subtotal,
    required double shippingFee,
  }) {
    final coupon = appliedCoupon.value;
    if (coupon == null) return 0;

    return coupon.calculateDiscount(
      subtotal: subtotal,
      shippingFee: shippingFee,
    );
  }

  Future<bool> applyCoupon({
    required String code,
    required double subtotal,
    required double shippingFee,
  }) async {
    final normalizedCode = code.trim().toUpperCase();
    errorMessage.value = '';
    isApplying.value = true;

    try {
      final coupon = await _couponRepository.findByCode(normalizedCode);
      if (coupon == null) {
        clear();
        errorMessage.value = 'Mã khuyến mãi không hợp lệ.';
        return false;
      }

      final discount = coupon.calculateDiscount(
        subtotal: subtotal,
        shippingFee: shippingFee,
      );
      if (discount <= 0) {
        clear();
        errorMessage.value = coupon.type.toLowerCase().contains('ship')
            ? 'Đơn hàng hiện không có phí vận chuyển để miễn giảm.'
            : 'Mã chưa đủ điều kiện áp dụng.';
        return false;
      }

      appliedCoupon.value = coupon;
      discountAmount.value = discount;
      return true;
    } finally {
      isApplying.value = false;
    }
  }

  void clear() {
    appliedCoupon.value = null;
    discountAmount.value = 0;
    errorMessage.value = '';
  }
}
