import '../models/coupon_model.dart';
import '../services/coupon_service.dart';

class CouponRepository {
  CouponRepository(this._couponService);

  final CouponService _couponService;

  Future<CouponModel?> findByCode(String code) {
    return _couponService.findByCode(code);
  }
}
