import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

const _userIds = [
  'seed_user_001',
  'seed_user_002',
  'seed_user_003',
  'seed_user_004',
  'seed_user_005',
];

const _coverImages = [
  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=500',
  'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=500',
  'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=500',
  'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=500',
  'https://images.unsplash.com/photo-1519682337058-a94d519337bc?w=500',
];

const _categorySeeds = [
  (
    'cat_literature',
    'Văn học',
    'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=300',
  ),
  (
    'cat_business',
    'Kinh tế',
    'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=300',
  ),
  (
    'cat_self_help',
    'Kỹ năng sống',
    'https://images.unsplash.com/photo-1506784365847-bbad939e9335?w=300',
  ),
  (
    'cat_children',
    'Thiếu nhi',
    'https://images.unsplash.com/photo-1472162072942-cd5147eb3902?w=300',
  ),
  (
    'cat_history',
    'Lịch sử',
    'https://images.unsplash.com/photo-1461360370896-922624d12aa1?w=300',
  ),
  (
    'cat_science',
    'Khoa học',
    'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=300',
  ),
  (
    'cat_tech',
    'Công nghệ',
    'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=300',
  ),
  (
    'cat_comics',
    'Truyện tranh',
    'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?w=300',
  ),
  (
    'cat_language',
    'Ngoại ngữ',
    'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?w=300',
  ),
  (
    'cat_health',
    'Sức khỏe',
    'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?w=300',
  ),
];

const _brandSeeds = [
  ('brand_tre', 'NXB Trẻ'),
  ('brand_kim_dong', 'NXB Kim Đồng'),
  ('brand_lao_dong', 'NXB Lao Động'),
  ('brand_tong_hop', 'NXB Tổng Hợp'),
  ('brand_giao_duc', 'NXB Giáo Dục'),
  ('brand_the_gioi', 'NXB Thế Giới'),
  ('brand_alpha', 'Alpha Books'),
  ('brand_nha_nam', 'Nhã Nam'),
  ('brand_fahasa', 'Fahasa'),
  ('brand_first_news', 'First News'),
];

const _bookTitles = [
  'Những Ngày Xanh Trở Lại',
  'Tư Duy Tài Chính Cá Nhân',
  'Hành Trình Vào Tâm Trí',
  'Khu Vườn Bí Mật Của Sóc Nâu',
  'Lược Sử Những Thành Phố Việt',
  'Khoa Học Quanh Ta',
  'Flutter Cho Người Mới Bắt Đầu',
  'Cuộc Phiêu Lưu Của Mèo Mun',
  'English Daily Conversations',
  'Sống Khỏe Mỗi Ngày',
  'Mùa Hè Không Quên',
  'Khởi Nghiệp Tinh Gọn',
  'Sức Mạnh Của Thói Quen Nhỏ',
  'Truyện Kể Trước Giờ Ngủ',
  'Dấu Ấn Lịch Sử',
  'Vũ Trụ Trong Tầm Tay',
  'Lập Trình Dart Thực Chiến',
  'Thám Tử Nhí Và Chiếc La Bàn',
  'Ngữ Pháp Tiếng Anh Căn Bản',
  'Dinh Dưỡng Cho Gia Đình',
  'Cà Phê Cùng Những Giấc Mơ',
  'Marketing Trong Kỷ Nguyên Số',
  'Bản Đồ Của Sự Tập Trung',
  'Cổ Tích Việt Nam Chọn Lọc',
  'Những Dòng Sông Kể Chuyện',
  'Sinh Học Vui',
  'Thiết Kế Ứng Dụng Di Động',
  'Siêu Anh Hùng Lớp 5A',
  'Từ Vựng Tiếng Anh Theo Chủ Đề',
  'Yoga Và Cân Bằng Cuộc Sống',
];

const _authors = [
  'Nguyễn Minh An',
  'Trần Hoàng Nam',
  'Lê Thu Hà',
  'Phạm Gia Bảo',
  'Vũ Khánh Linh',
  'Đặng Quốc Huy',
  'Hoàng Anh Khoa',
  'Bùi Ngọc Mai',
];

const _orderStatuses = [
  'pending',
  'processing',
  'shipping',
  'delivered',
  'cancelled',
];
const _paymentMethods = ['COD', 'BANK_TRANSFER', 'MOMO'];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SeedFirestoreApp());
}

class SeedFirestoreApp extends StatelessWidget {
  const SeedFirestoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SeedFirestoreScreen(),
    );
  }
}

class SeedFirestoreScreen extends StatefulWidget {
  const SeedFirestoreScreen({super.key});

  @override
  State<SeedFirestoreScreen> createState() => _SeedFirestoreScreenState();
}

class _SeedFirestoreScreenState extends State<SeedFirestoreScreen> {
  String _status = 'Đang khởi tạo Firebase...';
  bool _isRunning = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _runSeed();
  }

  Future<void> _runSeed() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _setStatus('Đã kết nối Firebase. Đang tạo lại dữ liệu mẫu...');
      final result = await seedFirestore(reset: true);
      _setStatus(result);
    } catch (error, stackTrace) {
      debugPrintStack(label: error.toString(), stackTrace: stackTrace);
      setState(() {
        _error = error;
        _status = 'Seed Firestore thất bại.';
      });
    } finally {
      if (mounted) {
        setState(() => _isRunning = false);
      }
    }
  }

  void _setStatus(String status) {
    if (!mounted) return;
    setState(() => _status = status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isRunning) const CircularProgressIndicator(),
              if (!_isRunning && _error == null)
                const Icon(Icons.check_circle, color: Colors.green, size: 64),
              if (_error != null)
                const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 24),
              Text(
                _status,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(
                  _error.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> seedFirestore({required bool reset}) async {
  final db = FirebaseFirestore.instance;

  if (reset) {
    await _deleteCollections(db, [
      'books',
      'brands',
      'categories',
      'reviews',
      'notifications',
      'orders',
    ]);
    for (final userId in _userIds) {
      await _deleteSubcollections(db.collection('users').doc(userId), [
        'addresses',
        'bank_accounts',
        'cartItems',
      ]);
    }
  }

  final categories = _buildCategories();
  final brands = _buildBrands();
  final books = _buildBooks(categories, brands);
  final users = _buildUsers();
  final orders = _buildOrders(users, books);
  final reviews = _buildReviews(users, books);
  final notifications = _buildNotifications(users, orders);

  await _commitMaps(db.collection('categories'), categories);
  await _commitMaps(db.collection('brands'), brands);
  await _commitMaps(db.collection('books'), books);
  await _commitMaps(db.collection('users'), users);
  await _commitMaps(db.collection('orders'), orders);
  await _commitMaps(db.collection('reviews'), reviews);
  await _commitMaps(db.collection('notifications'), notifications);

  for (final userId in _userIds) {
    await _commitMaps(
      db.collection('users').doc(userId).collection('addresses'),
      _buildAddresses(userId),
    );
    await _commitMaps(
      db.collection('users').doc(userId).collection('bank_accounts'),
      _buildBankAccounts(userId),
    );
    await _commitMaps(
      db.collection('users').doc(userId).collection('cartItems'),
      _buildCartItems(userId, books.keys.toList()),
    );
  }

  return 'Seed Firestore hoàn tất.\n'
      '- categories: ${categories.length}\n'
      '- brands: ${brands.length}\n'
      '- books: ${books.length}\n'
      '- users: ${users.length}\n'
      '- orders: ${orders.length}\n'
      '- reviews: ${reviews.length}\n'
      '- notifications: ${notifications.length}\n'
      '- addresses: ${_userIds.length * 3}\n'
      '- bank_accounts: ${_userIds.length * 2}\n'
      '- cartItems: ${_userIds.length * 4}';
}

Map<String, Map<String, dynamic>> _buildCategories() {
  return {
    for (var i = 0; i < _categorySeeds.length; i++)
      _categorySeeds[i].$1: {
        'id': _categorySeeds[i].$1,
        'name': _categorySeeds[i].$2,
        'image': _categorySeeds[i].$3,
        'isFeatured': i < 6,
      },
  };
}

Map<String, Map<String, dynamic>> _buildBrands() {
  return {
    for (var i = 0; i < _brandSeeds.length; i++)
      _brandSeeds[i].$1: {
        'id': _brandSeeds[i].$1,
        'name': _brandSeeds[i].$2,
        'imageUrl':
            'https://ui-avatars.com/api/?name=${Uri.encodeComponent(_brandSeeds[i].$2)}&background=1565C0&color=fff&size=256',
        'isFeatured': i < 6,
        'productsCount': 3,
      },
  };
}

Map<String, Map<String, dynamic>> _buildBooks(
  Map<String, Map<String, dynamic>> categories,
  Map<String, Map<String, dynamic>> brands,
) {
  final categoryIds = categories.keys.toList();
  final brandIds = brands.keys.toList();

  return {
    for (var i = 0; i < _bookTitles.length; i++)
      'book_${(i + 1).toString().padLeft(3, '0')}': _bookData(
        index: i,
        id: 'book_${(i + 1).toString().padLeft(3, '0')}',
        title: _bookTitles[i],
        categoryId: categoryIds[i % categoryIds.length],
        brandId: brandIds[i % brandIds.length],
        brandName: brands[brandIds[i % brandIds.length]]!['name'] as String,
      ),
  };
}

Map<String, dynamic> _bookData({
  required int index,
  required String id,
  required String title,
  required String categoryId,
  required String brandId,
  required String brandName,
}) {
  final genre = _categorySeeds[index % _categorySeeds.length].$2;
  final listPrice = 69000 + (index % 12) * 12000;
  final hasSale = index % 4 == 0;
  final salePrice = hasSale ? (listPrice * 0.9).roundToDouble() : null;
  final stock = 80 + index * 5;
  final soldQuantity = 5 + index * 2;

  return {
    'id': id,
    'title': title,
    'author': _authors[index % _authors.length],
    'publisher': brandName,
    'genre': genre,
    'pages': 120 + (index % 12) * 35,
    'price': listPrice.toDouble(),
    'salePrice': salePrice,
    'coverImage': _coverImages[index % _coverImages.length],
    'images': [
      _coverImages[index % _coverImages.length],
      _coverImages[(index + 1) % _coverImages.length],
    ],
    'description':
        'Ấn phẩm "$title" thuộc nhóm $genre, phù hợp cho độc giả yêu thích sách chất lượng và nội dung dễ ứng dụng.',
    'availableFormats': index.isEven
        ? ['paperback', 'ebook']
        : ['paperback', 'hardcover'],
    'stock': stock,
    'soldQuantity': soldQuantity,
    'rating': double.parse(
      (3.8 + (index % 12) * 0.1).clamp(3.8, 5.0).toStringAsFixed(1),
    ),
    'ratingCount': 8 + index * 2,
    'isOutOfStock': false,
    'isActive': true,
    'isDeleted': false,
    'tags': [genre, brandName, index.isEven ? 'Bán chạy' : 'Mới'],
    'categoryIds': [categoryId],
    'brandId': brandId,
    'brandName': brandName,
    'createdAt': FieldValue.serverTimestamp(),
    'updatedAt': FieldValue.serverTimestamp(),
  };
}

Map<String, Map<String, dynamic>> _buildUsers() {
  final names = [
    ('An', 'Nguyễn'),
    ('Bình', 'Trần'),
    ('Chi', 'Lê'),
    ('Dũng', 'Phạm'),
    ('Hà', 'Vũ'),
  ];

  return {
    for (var i = 0; i < _userIds.length; i++)
      _userIds[i]: {
        'id': _userIds[i],
        'firstName': names[i].$1,
        'lastName': names[i].$2,
        'username': 'seed_user_${i + 1}',
        'email': 'seed.user.${i + 1}@example.com',
        'phone': '090${(1000000 + i * 12345).toString().substring(1)}',
        'emailVerified': true,
        'createdAt': FieldValue.serverTimestamp(),
      },
  };
}

Map<String, Map<String, dynamic>> _buildAddresses(String userId) {
  final cities = ['TP. Hồ Chí Minh', 'Hà Nội', 'Đà Nẵng'];
  return {
    for (var i = 0; i < 3; i++)
      '${userId}_address_${i + 1}': {
        'city': cities[i],
        'ward': 'Phường ${i + 1}',
        'street': 'Đường Sách ${i + 1}',
        'number': '${12 + i * 8}',
        'receiverName': 'Người nhận ${i + 1}',
        'phoneNumber': '091${(2000000 + i * 111111).toString().substring(1)}',
        'isDefault': i == 0,
        'createdAt': FieldValue.serverTimestamp(),
      },
  };
}

Map<String, Map<String, dynamic>> _buildBankAccounts(String userId) {
  return {
    '${userId}_bank_1': {
      'accountNumber': '1234567890',
      'accountHolderName': 'NGUYEN VAN A',
      'bankName': 'Ngân hàng TMCP Ngoại thương Việt Nam',
      'shortName': 'VCB',
      'bankCode': 'VCB',
      'bin': '970436',
      'logo': 'https://api.vietqr.io/img/VCB.png',
      'createdAt': FieldValue.serverTimestamp(),
    },
    '${userId}_bank_2': {
      'accountNumber': '9876543210',
      'accountHolderName': 'TRAN THI B',
      'bankName': 'Ngân hàng TMCP Kỹ thương Việt Nam',
      'shortName': 'TCB',
      'bankCode': 'TCB',
      'bin': '970407',
      'logo': 'https://api.vietqr.io/img/TCB.png',
      'createdAt': FieldValue.serverTimestamp(),
    },
  };
}

Map<String, Map<String, dynamic>> _buildCartItems(
  String userId,
  List<String> bookIds,
) {
  final offset = _userIds.indexOf(userId);
  return {
    for (var i = 0; i < 4; i++)
      bookIds[(offset * 4 + i) % bookIds.length]: {
        'bookId': bookIds[(offset * 4 + i) % bookIds.length],
        'quantity': 1 + (i % 3),
        'updatedAt': FieldValue.serverTimestamp(),
      },
  };
}

Map<String, Map<String, dynamic>> _buildOrders(
  Map<String, Map<String, dynamic>> users,
  Map<String, Map<String, dynamic>> books,
) {
  final bookValues = books.values.toList();
  final result = <String, Map<String, dynamic>>{};

  for (var i = 0; i < 25; i++) {
    final userId = _userIds[i % _userIds.length];
    final items = List.generate(2 + (i % 2), (itemIndex) {
      final book = bookValues[(i + itemIndex) % bookValues.length];
      final quantity = 1 + ((i + itemIndex) % 3);
      final price = ((book['salePrice'] ?? book['price']) as num).toDouble();
      return {
        'bookId': book['id'],
        'title': book['title'],
        'unitPrice': price,
        'quantity': quantity,
        'subtotal': price * quantity,
      };
    });
    final total = items.fold<double>(
      0,
      (subtotal, item) => subtotal + (item['subtotal'] as double),
    );
    final status = _orderStatuses[i % _orderStatuses.length];
    final orderId = 'order_${(i + 1).toString().padLeft(3, '0')}';

    result[orderId] = {
      'id': orderId,
      'userId': userId,
      'orderCode':
          'SST${DateTime.now().millisecondsSinceEpoch}${i.toString().padLeft(2, '0')}',
      'recipientName': 'Người nhận ${(i % 5) + 1}',
      'phoneNumber': '091${(3000000 + i * 12345).toString().substring(1)}',
      'address':
          '${20 + i}, Đường Sách ${(i % 8) + 1}, Phường ${(i % 5) + 1}, TP. Hồ Chí Minh',
      'note': i.isEven ? 'Giao giờ hành chính' : '',
      'total': total,
      'totalItems': items.fold<int>(
        0,
        (itemCount, item) => itemCount + (item['quantity'] as int),
      ),
      'items': items,
      'status': status,
      'paymentMethod': _paymentMethods[i % _paymentMethods.length],
      'createdAt': Timestamp.fromDate(
        DateTime.now().subtract(Duration(days: i)),
      ),
      'serverCreatedAt': FieldValue.serverTimestamp(),
    };
  }

  return result;
}

Map<String, Map<String, dynamic>> _buildReviews(
  Map<String, Map<String, dynamic>> users,
  Map<String, Map<String, dynamic>> books,
) {
  final bookIds = books.keys.toList();
  final result = <String, Map<String, dynamic>>{};

  for (var i = 0; i < 40; i++) {
    final reviewId = 'review_${(i + 1).toString().padLeft(3, '0')}';
    final userId = _userIds[i % _userIds.length];
    result[reviewId] = {
      'userId': userId,
      'userName': 'Seed User ${(i % _userIds.length) + 1}',
      'productId': bookIds[i % bookIds.length],
      'rating': 3.5 + (i % 6) * 0.3,
      'comment':
          'Sách có nội dung tốt, trình bày rõ ràng và giao hàng nhanh. Đánh giá mẫu số ${i + 1}.',
      'createdAt': Timestamp.fromDate(
        DateTime.now().subtract(Duration(days: i % 20)),
      ),
      'isDeleted': false,
    };
  }

  return result;
}

Map<String, Map<String, dynamic>> _buildNotifications(
  Map<String, Map<String, dynamic>> users,
  Map<String, Map<String, dynamic>> orders,
) {
  final orderEntries = orders.entries.toList();
  final result = <String, Map<String, dynamic>>{};

  for (var i = 0; i < 30; i++) {
    final order = orderEntries[i % orderEntries.length];
    final status = order.value['status'] as String;
    final notificationId = 'notification_${(i + 1).toString().padLeft(3, '0')}';
    result[notificationId] = {
      'userId': order.value['userId'],
      'orderId': order.key,
      'orderStatus': status,
      'message':
          'Đơn hàng ${order.value['orderCode']} đang ở trạng thái $status.',
      'isRead': i % 3 == 0,
      'createdAt': Timestamp.fromDate(
        DateTime.now().subtract(Duration(hours: i * 3)),
      ),
    };
  }

  return result;
}

Future<void> _commitMaps(
  CollectionReference<Map<String, dynamic>> collection,
  Map<String, Map<String, dynamic>> data,
) async {
  final entries = data.entries.toList();
  for (var start = 0; start < entries.length; start += 450) {
    final batch = FirebaseFirestore.instance.batch();
    for (final entry in entries.skip(start).take(450)) {
      batch.set(
        collection.doc(entry.key),
        entry.value,
        SetOptions(merge: true),
      );
    }
    await batch.commit();
  }
}

Future<void> _deleteCollections(
  FirebaseFirestore db,
  List<String> collectionPaths,
) async {
  for (final path in collectionPaths) {
    await _deleteCollection(db.collection(path));
  }
}

Future<void> _deleteSubcollections(
  DocumentReference<Map<String, dynamic>> parent,
  List<String> subcollectionNames,
) async {
  for (final name in subcollectionNames) {
    await _deleteCollection(parent.collection(name));
  }
}

Future<void> _deleteCollection(
  CollectionReference<Map<String, dynamic>> collection,
) async {
  while (true) {
    final snapshot = await collection.limit(450).get();
    if (snapshot.docs.isEmpty) return;

    final batch = FirebaseFirestore.instance.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
