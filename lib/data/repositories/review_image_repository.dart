import '../services/review_image_storage_service.dart';

class ReviewImageRepository {
  ReviewImageRepository({ReviewImageStorageService? service})
    : _service = service ?? ReviewImageStorageService();

  final ReviewImageStorageService _service;

  Future<String> uploadReviewImage({
    required String userId,
    required String reviewId,
    required String filePath,
    required int index,
  }) {
    return _service.uploadReviewImage(
      userId: userId,
      reviewId: reviewId,
      filePath: filePath,
      index: index,
    );
  }
}
