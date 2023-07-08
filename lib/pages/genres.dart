import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gutenburg/utils/constants.dart';
import 'package:gutenburg/pages/books.dart';
import 'package:gutenburg/utils/assets_loader.dart';
import 'package:gutenburg/utils/styles.dart';
import 'package:gutenburg/widgets/genre_card.dart';

import '../widgets/responsive_widget.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPhone = ResponsiveWidget.isSmallScreen(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.secondaryColor,
        body: Padding(
          padding: isPhone
              ? const EdgeInsets.only(left: 16.0, right: 16.0)
              : const EdgeInsets.only(left: 0.0, right: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  height: Get.height * .3,
                  width: double.infinity,
                  child: AssetsLoader.pattern,
                ),
                Container(
                  // width: Get.width * .4,
                  margin: isPhone
                      ? const EdgeInsets.only(top: 50.0)
                      : EdgeInsets.only(
                          top: 50.0,
                          left: Get.width * .2,
                          right: Get.width * .2),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectTitle,
                        style: Styles.headline1,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        intro,
                        style: Styles.bookNameBold,
                      )
                    ],
                  ),
                ),
              ]),
              Flexible(
                  child: SizedBox(
                width: isPhone ? Get.width : Get.width * .65,
                child: Wrap(
                  spacing: 60.0,
                  children: genreList.map((genre) {
                    return InkWell(
                      onTap: () => Get.to(
                        Books(genre: genre['genre']),
                      ),
                      child: GenreCard(genreData: genre),
                    );
                  }).toList(),
                ),
              )
                  // ListView.builder(
                  //     itemCount: genreList.length,
                  //     itemBuilder: (context, index) {
                  //       return InkWell(
                  //         onTap: () => Get.to(
                  //           Books(genre: genreList[index]['genre']),
                  //         ),
                  //         child: GenreCard(genreData: genreList[index]),
                  //       );
                  //     }),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
