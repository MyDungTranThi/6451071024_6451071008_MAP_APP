import 'package:flutter/material.dart';

import '../../data/models/book_model.dart';
import '../../utils/currency_formatter.dart';

class BookTileCard extends StatelessWidget {
  const BookTileCard({
    super.key,
    required this.book,
    required this.onTap,
    this.trailing,
  });

  final BookModel book;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            book.coverImage,
            width: 52,
            height: 72,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 52,
              height: 72,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: const Icon(Icons.menu_book_rounded),
            ),
          ),
        ),
        title: Text(book.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text('${book.author}\n${book.genre}'),
        isThreeLine: true,
        trailing:
            trailing ??
            Text(
              CurrencyFormatter.formatVnd(book.price),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
      ),
    );
  }
}
