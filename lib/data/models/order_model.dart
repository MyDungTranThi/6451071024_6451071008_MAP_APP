class OrderItemModel {
  const OrderItemModel({
    required this.bookId,
    required this.title,
    required this.unitPrice,
    required this.quantity,
    this.format = 'paperback',
    this.formatLabel = 'Bìa mềm',
    this.coverImage = '',
    this.author = '',
  });

  final String bookId;
  final String title;
  final double unitPrice;
  final int quantity;
  final String format;
  final String formatLabel;
  final String coverImage;
  final String author;

  double get subtotal => unitPrice * quantity;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      bookId: json['bookId'] ?? '',
      title: json['title'] ?? '',
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      format: json['format'] ?? 'paperback',
      formatLabel: json['formatLabel'] ?? 'Bìa mềm',
      coverImage: json['coverImage'] ?? '',
      author: json['author'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'title': title,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'format': format,
      'formatLabel': formatLabel,
      'coverImage': coverImage,
      'author': author,
      'subtotal': subtotal,
    };
  }
}

class OrderModel {
  const OrderModel({
    required this.id,
    required this.userId,
    required this.orderCode,
    required this.recipientName,
    required this.phoneNumber,
    required this.address,
    required this.note,
    required this.total,
    required this.totalItems,
    required this.items,
    required this.createdAt,
    this.subtotal = 0.0,
    this.shippingFee = 0.0,
    this.discountAmount = 0.0,
    this.couponCode,
    this.shippingAddressId,
    this.status = 'created',
    this.paymentMethod = 'COD',
  });

  final String id;
  final String userId;
  final String orderCode;
  final String recipientName;
  final String phoneNumber;
  final String address;
  final String note;
  final double total;
  final int totalItems;
  final List<OrderItemModel> items;
  final DateTime createdAt;
  final double subtotal;
  final double shippingFee;
  final double discountAmount;
  final String? couponCode;
  final String? shippingAddressId;
  final String status;
  final String paymentMethod;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final total = (json['total'] as num?)?.toDouble() ?? 0.0;
    return OrderModel(
      id: json['docId'] ?? json['id'] ?? '',
      userId: json['userId'] ?? '',
      orderCode: json['orderCode'] ?? '',
      recipientName: json['recipientName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      address: json['address'] ?? '',
      note: json['note'] ?? '',
      total: total,
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] is int
                ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
                : (json['createdAt'] as dynamic).toDate())
          : DateTime.now(),
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? total,
      shippingFee: (json['shippingFee'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      couponCode: json['couponCode'] as String?,
      shippingAddressId: json['shippingAddressId'] as String?,
      status: json['status'] ?? 'created',
      paymentMethod: json['paymentMethod'] ?? 'COD',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'orderCode': orderCode,
      'recipientName': recipientName,
      'phoneNumber': phoneNumber,
      'address': address,
      'note': note,
      'total': total,
      'totalItems': totalItems,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'shippingFee': shippingFee,
      'discountAmount': discountAmount,
      'couponCode': couponCode,
      'shippingAddressId': shippingAddressId,
      'status': status,
      'paymentMethod': paymentMethod,
      'createdAt': createdAt,
    };
  }

  OrderModel copyWith({
    String? id,
    String? userId,
    String? orderCode,
    String? recipientName,
    String? phoneNumber,
    String? address,
    String? note,
    double? total,
    int? totalItems,
    List<OrderItemModel>? items,
    DateTime? createdAt,
    double? subtotal,
    double? shippingFee,
    double? discountAmount,
    String? couponCode,
    String? shippingAddressId,
    String? status,
    String? paymentMethod,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderCode: orderCode ?? this.orderCode,
      recipientName: recipientName ?? this.recipientName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      note: note ?? this.note,
      total: total ?? this.total,
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      subtotal: subtotal ?? this.subtotal,
      shippingFee: shippingFee ?? this.shippingFee,
      discountAmount: discountAmount ?? this.discountAmount,
      couponCode: couponCode ?? this.couponCode,
      shippingAddressId: shippingAddressId ?? this.shippingAddressId,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
