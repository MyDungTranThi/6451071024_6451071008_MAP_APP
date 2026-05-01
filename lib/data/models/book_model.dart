enum BookFormat { paperback, hardcover, ebook }

class BookModel {
  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.genre,
    required this.pages,
    required this.price,
    required this.coverImage,
    required this.availableFormats,
    this.description = '',
    this.salePrice,
    this.stock = 100,
    this.soldQuantity = 0,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.isOutOfStock = false,
    this.isActive = true,
    this.isDeleted = false,
    this.tags = const [],
    this.images = const [],
    this.categoryIds = const [],
    this.brandId,
    this.brandName,
  });

  final String id;
  final String title;
  final String author;
  final String publisher;
  final String genre;
  final int pages;
  final double price;
  final String coverImage;
  final List<BookFormat> availableFormats;
  final String description;

  // New E-commerce fields
  final double? salePrice;
  final int stock;
  final int soldQuantity;
  final double rating;
  final int ratingCount;
  final bool isOutOfStock;
  final bool isActive;
  final bool isDeleted;
  final List<String> tags;
  final List<String> images;
  final List<String> categoryIds;
  final String? brandId; // Can map to Publisher logic
  final String? brandName; // Cache brand name for UI

  String get lowerTitle => title.toLowerCase();

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final rawFormats =
        (json['availableFormats'] as List<dynamic>?) ?? const ['paperback'];

    return BookModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      author: json['author'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      coverImage: json['coverImage'] as String? ?? '',
      description: (json['description'] ?? '') as String,
      availableFormats: rawFormats
          .map((format) => _bookFormatFromString(format as String))
          .toList(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt() ?? 100,
      soldQuantity: (json['soldQuantity'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      isOutOfStock: json['isOutOfStock'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      categoryIds: (json['categoryIds'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'publisher': publisher,
      'genre': genre,
      'pages': pages,
      'price': price,
      'coverImage': coverImage,
      'description': description,
      'availableFormats': availableFormats
          .map((format) => _bookFormatToString(format))
          .toList(),
      'salePrice': salePrice,
      'stock': stock,
      'soldQuantity': soldQuantity,
      'rating': rating,
      'ratingCount': ratingCount,
      'isOutOfStock': isOutOfStock,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'tags': tags,
      'images': images,
      'categoryIds': categoryIds,
      'brandId': brandId,
      'brandName': brandName,
    };
  }
}

BookFormat _bookFormatFromString(String value) {
  switch (value.toLowerCase()) {
    case 'paperback':
      return BookFormat.paperback;
    case 'hardcover':
      return BookFormat.hardcover;
    default:
      return BookFormat.ebook;
  }
}

String _bookFormatToString(BookFormat value) {
  switch (value) {
    case BookFormat.paperback:
      return 'paperback';
    case BookFormat.hardcover:
      return 'hardcover';
    case BookFormat.ebook:
      return 'ebook';
  }
}

String bookFormatLabel(BookFormat value) {
  switch (value) {
    case BookFormat.paperback:
      return 'Bìa mềm';
    case BookFormat.hardcover:
      return 'Bìa cứng';
    case BookFormat.ebook:
      return 'E-book';
  }
}
