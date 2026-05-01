class OrderItemModel {
  const OrderItemModel({
    required this.bookId,
    required this.title,
    required this.unitPrice,
    required this.quantity,
  });

  final String bookId;
  final String title;
  final double unitPrice;
  final int quantity;

  double get subtotal => unitPrice * quantity;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      bookId: json['bookId'] ?? '',
      title: json['title'] ?? '',
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'title': title,
      'unitPrice': unitPrice,
      'quantity': quantity,
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
  final String status;
  final String paymentMethod;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['docId'] ?? json['id'] ?? '',
      userId: json['userId'] ?? '',
      orderCode: json['orderCode'] ?? '',
      recipientName: json['recipientName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      address: json['address'] ?? '',
      note: json['note'] ?? '',
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      totalItems: json['totalItems'] ?? 0,
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
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
