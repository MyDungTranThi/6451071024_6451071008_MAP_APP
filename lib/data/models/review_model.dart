import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String id;
  final String userId;
  final String userName;
  final String productId;
  final String orderId;
  final double rating;
  final String title;
  final String comment;
  final List<String> imageUrls;
  final DateTime createdAt;
  final bool isDeleted;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.productId,
    this.orderId = '',
    required this.rating,
    this.title = '',
    required this.comment,
    this.imageUrls = const [],
    required this.createdAt,
    this.isDeleted = false,
  });

  factory ReviewModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReviewModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? '',
      productId: data['productId'] ?? '',
      orderId: data['orderId'] ?? '',
      rating: (data['rating'] as num?)?.toDouble() ?? 0.0,
      title: data['title'] ?? '',
      comment: data['comment'] ?? '',
      imageUrls: (data['imageUrls'] as List<dynamic>? ?? [])
          .map((item) => item.toString())
          .toList(),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isDeleted: data['isDeleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'productId': productId,
      'orderId': orderId,
      'rating': rating,
      'title': title,
      'comment': comment,
      'imageUrls': imageUrls,
      'createdAt': Timestamp.fromDate(createdAt),
      'isDeleted': isDeleted,
    };
  }
}
