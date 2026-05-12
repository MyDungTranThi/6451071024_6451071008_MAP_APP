import '../services/shipping_fee_service.dart';

class ShippingFeeRepository {
  ShippingFeeRepository(this._shippingFeeService);

  final ShippingFeeService _shippingFeeService;

  double calculate(double subtotal) {
    return _shippingFeeService.calculate(subtotal);
  }
}
