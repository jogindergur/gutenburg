import 'dart:convert';

import 'author.dart';

class Book {
  String? title;
  Map? formats;
  Author? author;
  String? htmlLink;
  String? txtLink;
  String? pdfLink;

  Book({this.title, this.formats, this.author});

  Book.fromJSON(Map<String, dynamic> data) {
    String temp = '';
    if (data['formats'] != null) {
      temp = jsonEncode(data['formats']);
      temp = temp.replaceAll(';', '');
      temp = temp.replaceAll(' ', '');
    }

    title = data['title'] ?? 'Title: NA';
    formats = data['formats'] == null ? null : jsonDecode(temp);
    author = data['authors'] == null
        ? null
        : data['authors'].length == 1
            ? Author.fromJSON(data['authors'][0])
            : null;
  }
}
