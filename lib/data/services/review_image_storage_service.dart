import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ReviewImageStorageService {
  ReviewImageStorageService({FirebaseStorage? storage})
    : _storage = storage ?? FirebaseStorage.instance;

  final FirebaseStorage _storage;

  Future<String> uploadReviewImage({
    required String userId,
    required String reviewId,
    required String filePath,
    required int index,
  }) async {
    final extension = filePath.split('.').last.toLowerCase();
    final safeExtension = extension.isEmpty ? 'jpg' : extension;
    final ref = _storage.ref().child(
      'reviews/$userId/$reviewId/image_$index.$safeExtension',
    );

    final uploadTask = await ref.putFile(File(filePath));
    return uploadTask.ref.getDownloadURL();
  }
}
