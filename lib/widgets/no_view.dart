import 'package:flutter/material.dart';
import 'package:gutenburg/utils/styles.dart';

class NoView extends StatelessWidget {
  const NoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
        child: SizedBox(
      height: 300,
      child: Center(
          child: Text(
        'No viewable version available',
        style: Styles.genreCard,
      )),
    ));
  }
}
