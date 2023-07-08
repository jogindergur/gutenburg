import 'package:flutter/material.dart';
import 'package:gutenburg/utils/styles.dart';

import '../models/book.dart';
import 'responsive_widget.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    bool isPhone = ResponsiveWidget.isSmallScreen(context);
    return Container(
      height: isPhone ? 200 : 250,
      width: isPhone ? 100 : 130,
      margin: isPhone
          ? const EdgeInsets.only(right: 18.0, bottom: 5.0)
          : const EdgeInsets.only(right: 40.0, bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isPhone ? 140 : 180,
            width: isPhone ? 100 : 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: (book.formats?['image/jpeg']?.toString()) == null
                ? const Center(
                    child: Text(
                      'No Cover Available',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.bookName,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(book.formats!['image/jpeg'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                      return const Text('No Cover Available.');
                    }),
                  ),
          ),
          const SizedBox(height: 4.0),
          SizedBox(
            width: 100,
            child: Text(
              book.title!.toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.bookName,
            ),
          ),
          Text(
            book.author?.name ?? 'Author: NA',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.bookAuthor,
          ),
        ],
      ),
    );
  }
}
