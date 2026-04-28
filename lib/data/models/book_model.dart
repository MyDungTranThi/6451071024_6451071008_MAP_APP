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

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final rawFormats =
        (json['availableFormats'] as List<dynamic>?) ?? const ['paperback'];

    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      publisher: json['publisher'] as String,
      genre: json['genre'] as String,
      pages: (json['pages'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      coverImage: json['coverImage'] as String,
      description: (json['description'] ?? '') as String,
      availableFormats: rawFormats
          .map((format) => _bookFormatFromString(format as String))
          .toList(),
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
      return 'Paperback';
    case BookFormat.hardcover:
      return 'Hardcover';
    case BookFormat.ebook:
      return 'E-book';
  }
}
