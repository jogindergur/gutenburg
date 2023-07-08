import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gutenburg/network/base_get_api.dart';
import '../models/book.dart';

class BooksController extends GetxController {
  static BooksController instance = Get.find();
  String url = 'http://skunkworks.ignitesol.com:8000/books?mime_type=image';
  ScrollController? scrollController;

  final BaseGetAPI api = BaseGetAPI();
  var categoryList = <Book>[].obs;
  var searchedList = <Book>[].obs;
  String nextUrl = '';
  String prevUrl = '';

  String searchNextUrl = '';
  String searchPrevUrl = '';

  var isSearching = false.obs;

  getCategoriesBooks({String category = '', bool isLoadMore = false}) async {
    if (!isLoadMore) {
      categoryList.clear();
    }
    final response = isLoadMore
        ? await api.getData(nextUrl)
        : await api.getData('$url&topic=$category');

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      nextUrl = body['next'] ?? '';
      var results = body['results'];
      results.forEach((book) {
        categoryList.add(Book.fromJSON(book));
      });
    }
  }

  getSearchedBooks({String query = '', bool isLoadMore = false}) async {
    final response = isLoadMore
        ? await api.getData(searchNextUrl)
        : await api.getData('$url&search=$query');
    searchedList.clear();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      searchNextUrl = body['next'] ?? '';
      var results = body['results'];
      results.forEach((book) {
        searchedList.add(Book.fromJSON(book));
      });
    }
  }
}
