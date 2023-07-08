import 'package:flutter/material.dart';

import '../utils/styles.dart';

class Genre extends StatelessWidget {
  const Genre({super.key, required this.genreData});
  final Map genreData;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          genreData['icon'],
          const SizedBox(width: 10.0),
          Text(
            genreData['genre'],
            style: Styles.genreCard,
          )
        ],
      );
  }
}
