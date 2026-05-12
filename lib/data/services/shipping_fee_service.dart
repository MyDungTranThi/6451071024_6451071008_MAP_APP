class ShippingFeeService {
  double calculate(double subtotal) {
    if (subtotal <= 0 || subtotal >= 700000) return 0;
    if (subtotal >= 300000) return 15000;
    return 30000;
  }
}
