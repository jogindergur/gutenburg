import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gutenburg/utils/assets_loader.dart';
import 'package:gutenburg/utils/styles.dart';
import 'package:gutenburg/widgets/genre.dart';

import 'responsive_widget.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.genreData});
  final Map genreData;

  @override
  Widget build(BuildContext context) {
    bool isPhone = ResponsiveWidget.isSmallScreen(context);
    return Container(
      margin: isPhone
          ? const EdgeInsets.only(top: 10.0, bottom: 8.0)
          : const EdgeInsets.only(top: 10.0, bottom: 8.0),
      width: isPhone ? double.infinity : Get.width * .3,
      height: 50.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: Styles.genreCardDecoration,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Genre(genreData: genreData), AssetsLoader.next],
      ),
    );
  }
}
