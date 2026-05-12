import 'book_model.dart';

class CartItemModel {
  const CartItemModel({
    required this.id,
    required this.bookId,
    required this.format,
    required this.quantity,
  });

  final String id;
  final String bookId;
  final BookFormat format;
  final int quantity;

  static String buildId(String bookId, BookFormat format) {
    return '${bookId}_${bookFormatToString(format)}';
  }

  CartItemModel copyWith({
    String? id,
    String? bookId,
    BookFormat? format,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      format: format ?? this.format,
      quantity: quantity ?? this.quantity,
    );
  }

  factory CartItemModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final rawBookId = json['bookId'] as String?;
    final rawFormat = json['format'] as String?;
    final fallbackParts = id.split('_');
    final fallbackBookId = fallbackParts.isNotEmpty ? fallbackParts.first : id;

    return CartItemModel(
      id: id,
      bookId: rawBookId?.isNotEmpty == true ? rawBookId! : fallbackBookId,
      format: bookFormatFromString(rawFormat ?? 'paperback'),
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'format': bookFormatToString(format),
      'formatLabel': bookFormatLabel(format),
      'quantity': quantity,
    };
  }
}
