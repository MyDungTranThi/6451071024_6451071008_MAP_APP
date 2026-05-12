class CouponModel {
  const CouponModel({
    required this.code,
    required this.type,
    required this.value,
    this.minSubtotal = 0.0,
    this.maxDiscount,
    this.isActive = true,
  });

  final String code;
  final String type;
  final double value;
  final double minSubtotal;
  final double? maxDiscount;
  final bool isActive;

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      code: (json['code'] ?? '').toString().trim().toUpperCase(),
      type: (json['type'] ?? json['discountType'] ?? 'fixed').toString(),
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
      minSubtotal:
          (json['minSubtotal'] as num?)?.toDouble() ??
          (json['minOrderValue'] as num?)?.toDouble() ??
          0.0,
      maxDiscount: (json['maxDiscount'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool? ?? json['active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'type': type,
      'value': value,
      'minSubtotal': minSubtotal,
      'maxDiscount': maxDiscount,
      'isActive': isActive,
    };
  }

  double calculateDiscount({
    required double subtotal,
    required double shippingFee,
  }) {
    if (!isActive || subtotal < minSubtotal) return 0;

    final normalizedType = type.trim().toLowerCase();
    final discount = switch (normalizedType) {
      'percent' || 'percentage' => subtotal * value / 100,
      'freeshipping' || 'free_shipping' => shippingFee,
      _ => value,
    };

    final cappedDiscount = maxDiscount == null
        ? discount
        : discount.clamp(0, maxDiscount!).toDouble();
    return cappedDiscount.clamp(0, subtotal + shippingFee).toDouble();
  }
}
