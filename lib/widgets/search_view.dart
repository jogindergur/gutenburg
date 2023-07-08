import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';
import 'book_card.dart';
import 'link_opener.dart';
import 'no_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.searchQuery});
  final String searchQuery;

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
            future: booksController.getSearchedBooks(query: searchQuery),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (booksController.searchedList.isNotEmpty) {
                  return Obx(() => Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: booksController.searchedList.map((book) {
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
      if (booksController.searchNextUrl != '' &&
          booksController.searchNextUrl != booksController.searchPrevUrl) {
        booksController.searchPrevUrl = booksController.searchNextUrl;
        await booksController.getSearchedBooks(isLoadMore: true);
      }
    }
  }
}
