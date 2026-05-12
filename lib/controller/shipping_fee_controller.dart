import 'package:get/get.dart';

import '../data/repositories/shipping_fee_repository.dart';

class ShippingFeeController extends GetxController {
  ShippingFeeController(this._shippingFeeRepository);

  final ShippingFeeRepository _shippingFeeRepository;

  double calculate(double subtotal) {
    return _shippingFeeRepository.calculate(subtotal);
  }
}
