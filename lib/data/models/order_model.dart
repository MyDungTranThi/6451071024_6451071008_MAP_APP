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
    required this.orderCode,
    required this.recipientName,
    required this.phoneNumber,
    required this.address,
    required this.note,
    required this.total,
    required this.totalItems,
    required this.items,
    required this.createdAt,
    this.status = 'pending',
  });

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

  Map<String, dynamic> toJson() {
    return {
      'orderCode': orderCode,
      'recipientName': recipientName,
      'phoneNumber': phoneNumber,
      'address': address,
      'note': note,
      'total': total,
      'totalItems': totalItems,
      'items': items.map((item) => item.toJson()).toList(),
      'status': status,
      'createdAt': createdAt,
    };
  }
}
