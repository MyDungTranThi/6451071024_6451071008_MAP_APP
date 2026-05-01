import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review_model.dart';

class ReviewFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addReview(ReviewModel review) async {
    await _db.collection('reviews').doc(review.id).set(review.toJson());
  }

  Future<void> updateReview(String id, double rating, String comment) async {
    await _db.collection('reviews').doc(id).update({
      'rating': rating,
      'comment': comment,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<ReviewModel?> getReviewById(String reviewId) async {
    final doc = await _db.collection('reviews').doc(reviewId).get();
    if (!doc.exists) return null;

    final review = ReviewModel.fromFirestore(doc);
    return review.isDeleted ? null : review;
  }

  Future<List<ReviewModel>> getProductReviews(String productId) async {
    final snapshot = await _db
        .collection('reviews')
        .where('productId', isEqualTo: productId)
        .where('isDeleted', isEqualTo: false)
        .get();

    final reviews = snapshot.docs
        .map((doc) => ReviewModel.fromFirestore(doc))
        .toList();
    reviews.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return reviews;
  }

  Future<ReviewModel?> getUserReviewForProduct(
    String userId,
    String productId,
  ) async {
    final snapshot = await _db
        .collection('reviews')
        .where('userId', isEqualTo: userId)
        .where('productId', isEqualTo: productId)
        .where('isDeleted', isEqualTo: false)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ReviewModel.fromFirestore(snapshot.docs.first);
    }
    return null;
  }

  Future<ReviewModel?> getUserReviewForOrderProduct({
    required String userId,
    required String orderId,
    required String productId,
  }) async {
    final reviewId = '${orderId}_${productId}_$userId';
    final directReview = await getReviewById(reviewId);
    if (directReview != null) return directReview;

    final snapshot = await _db
        .collection('reviews')
        .where('userId', isEqualTo: userId)
        .where('orderId', isEqualTo: orderId)
        .where('productId', isEqualTo: productId)
        .where('isDeleted', isEqualTo: false)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ReviewModel.fromFirestore(snapshot.docs.first);
    }
    return null;
  }
}
