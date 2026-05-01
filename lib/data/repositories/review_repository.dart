import '../models/review_model.dart';
import '../services/review_firestore_service.dart';

class ReviewRepository {
  final ReviewFirestoreService _service = ReviewFirestoreService();

  Future<void> addReview(ReviewModel review) {
    return _service.addReview(review);
  }

  Future<void> updateReview(String id, double rating, String comment) {
    return _service.updateReview(id, rating, comment);
  }

  Future<ReviewModel?> getReviewById(String reviewId) {
    return _service.getReviewById(reviewId);
  }

  Future<List<ReviewModel>> getProductReviews(String productId) {
    return _service.getProductReviews(productId);
  }

  Future<ReviewModel?> getUserReviewForProduct(
    String userId,
    String productId,
  ) {
    return _service.getUserReviewForProduct(userId, productId);
  }

  Future<ReviewModel?> getUserReviewForOrderProduct({
    required String userId,
    required String orderId,
    required String productId,
  }) {
    return _service.getUserReviewForOrderProduct(
      userId: userId,
      orderId: orderId,
      productId: productId,
    );
  }
}
