import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gutenburg/utils/constants.dart';
import 'package:gutenburg/utils/assets_loader.dart';
import 'package:gutenburg/utils/styles.dart';
import 'package:gutenburg/widgets/category_view.dart';
import 'package:gutenburg/widgets/search_view.dart';

import '../widgets/responsive_widget.dart';

class Books extends StatelessWidget {
  Books({super.key, required this.genre});
  final String genre;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isPhone = ResponsiveWidget.isSmallScreen(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: isPhone ? Get.width : Get.width * .7,
                child: Column(
                  children: [
                    SizedBox(height: isPhone ? 0.0 : 30.0),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: AssetsLoader.back,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          genre.capitalizeFirst!,
                          style: Styles.title,
                        ),
                      ],
                    ),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                          color: Styles.lightGrey,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                              color: booksController.isSearching.value
                                  ? Styles.primaryColor
                                  : Colors.white),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AssetsLoader.search,
                            const SizedBox(width: 8),
                            Flexible(
                              child: TextField(
                                controller: searchController,
                                style: Styles.body,
                                onTap: () {
                                  booksController.isSearching.value = true;
                                },
                                onChanged: (value) async {
                                  await booksController.getSearchedBooks(
                                      query: value);
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search'),
                              ),
                            ),
                            InkWell(
                              child: AssetsLoader.cancel,
                              onTap: () {
                                searchController.text = '';
                                booksController.isSearching.value = false;
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Obx(
                () => Container(
                  width: Get.width,
                  padding: isPhone
                      ? const EdgeInsets.all(0.0)
                      : EdgeInsets.only(
                          left: Get.width * .14, right: Get.width * .10),
                  color: Styles.secondaryColor,
                  child: booksController.isSearching.value
                      ? SearchView(searchQuery: searchController.text)
                      : CategoryView(genre: genre),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
