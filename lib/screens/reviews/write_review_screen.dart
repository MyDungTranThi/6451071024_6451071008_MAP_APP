import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/auth_controller.dart';
import '../../data/models/book_model.dart';
import '../../data/models/review_model.dart';
import '../../data/repositories/review_image_repository.dart';
import '../../data/repositories/review_repository.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final _titleController = TextEditingController();
  final _commentController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _selectedImages = [];
  double _rating = 0;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submitReview(BookModel book, String orderId) async {
    if (_rating == 0) {
      Get.snackbar('Lỗi', 'Vui lòng chọn số sao đánh giá');
      return;
    }

    if (_titleController.text.trim().isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng nhập tiêu đề đánh giá');
      return;
    }

    if (_commentController.text.trim().isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng nhập mô tả đánh giá');
      return;
    }

    final authController = Get.find<AuthController>();
    final user = authController.currentUser.value;
    if (user == null) {
      Get.snackbar('Lỗi', 'Vui lòng đăng nhập để đánh giá');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final repository = Get.find<ReviewRepository>();
      final imageRepository = Get.find<ReviewImageRepository>();
      final reviewId = '${orderId}_${book.id}_${user.id}';
      final existingReview = await repository.getUserReviewForOrderProduct(
        userId: user.id,
        orderId: orderId,
        productId: book.id,
      );

      if (existingReview != null) {
        Get.snackbar(
          'Đã đánh giá',
          'Sản phẩm này trong đơn hàng đã được đánh giá trước đó.',
        );
        Get.back(result: false);
        return;
      }

      final imageUrls = <String>[];

      for (var i = 0; i < _selectedImages.length; i++) {
        final imageUrl = await imageRepository.uploadReviewImage(
          userId: user.id,
          reviewId: reviewId,
          filePath: _selectedImages[i].path,
          index: i + 1,
        );
        imageUrls.add(imageUrl);
      }

      final review = ReviewModel(
        id: reviewId,
        userId: user.id,
        userName: user.fullName,
        productId: book.id,
        orderId: orderId,
        rating: _rating,
        title: _titleController.text.trim(),
        comment: _commentController.text.trim(),
        imageUrls: imageUrls,
        createdAt: DateTime.now(),
      );

      await repository.addReview(review);
      Get.back(result: true); // Return true indicating success
      Get.snackbar('Thành công', 'Cảm ơn bạn đã đánh giá sản phẩm!');
    } catch (e) {
      Get.snackbar('Lỗi', 'Có lỗi xảy ra: $e');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final BookModel book;
    final String orderId;

    if (args is Map<String, dynamic>) {
      book = args['book'] as BookModel;
      orderId = args['orderId'] as String? ?? '';
    } else {
      book = args as BookModel;
      orderId = '';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Viết đánh giá'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    book.coverImage,
                    width: 60,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.author,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Bạn đánh giá sản phẩm này thế nào?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),
            const Text(
              'Tiêu đề đánh giá',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Ví dụ: Sách hay, đóng gói cẩn thận',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mô tả trải nghiệm của bạn',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _commentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Nhập nhận xét của bạn về sản phẩm...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ảnh đánh giá',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _isSubmitting ? null : _pickReviewImages,
              icon: const Icon(Icons.add_photo_alternate_outlined),
              label: const Text('Tải ảnh lên'),
            ),
            if (_selectedImages.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _selectedImages
                    .map(
                      (image) => Chip(
                        avatar: const Icon(Icons.image_outlined, size: 18),
                        label: Text(
                          image.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onDeleted: _isSubmitting
                            ? null
                            : () =>
                                  setState(() => _selectedImages.remove(image)),
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isSubmitting
                    ? null
                    : () => _submitReview(book, orderId),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: _isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Gửi đánh giá',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickReviewImages() async {
    final pickedImages = await _imagePicker.pickMultiImage(imageQuality: 80);
    if (pickedImages.isEmpty) return;

    setState(() {
      _selectedImages
        ..clear()
        ..addAll(pickedImages.take(5));
    });
  }
}
