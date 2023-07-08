import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gutenburg/utils/helper.dart';
import 'package:gutenburg/widgets/link_opener.dart';
import 'package:gutenburg/widgets/no_view.dart';
import '../utils/constants.dart';
import '../utils/styles.dart';
import 'book_card.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.genre});
  final String genre;

  @override
  Widget build(BuildContext context) {
    booksController.scrollController =
        ScrollController(initialScrollOffset: 5.0)
          ..addListener(_scrollListener);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: booksController.scrollController,
        child: FutureBuilder(
            future: booksController.getCategoriesBooks(category: genre),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (booksController.categoryList.isNotEmpty) {
                  return Obx(() => Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: booksController.categoryList.map((book) {
                        return InkWell(
                          onTap: () {
                            customDialog(
                                context,
                                book.formats == null
                                    ? const NoView()
                                    : LinkOpener(formats: book.formats!),
                                Get.width * .3);
                          },
                          child: BookCard(
                            book: book,
                          ),
                        );
                      }).toList()));
                } else {
                  return SizedBox(
                    height: Get.height * .7,
                    child: const Center(
                      child: Text(
                        'No Books are available.',
                        style: Styles.bookName,
                      ),
                    ),
                  );
                }
              } else {
                return SizedBox(
                  height: Get.height * .7,
                  child: const Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  _scrollListener() async {
    if (booksController.scrollController!.offset >=
        (booksController.scrollController!.position.maxScrollExtent * .8)) {
      if (booksController.nextUrl != '' &&
          booksController.nextUrl != booksController.prevUrl) {
        booksController.prevUrl = booksController.nextUrl;
        await booksController.getCategoriesBooks(isLoadMore: true);
      }
    }
  }
}
