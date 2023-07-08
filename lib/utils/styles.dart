import 'package:flutter/widgets.dart';

class Styles {
  static const Color primaryColor = Color(0xFF5E56E7);
  static const Color secondaryColor = Color(0xFFF8F7FF);
  static const Color lightGrey = Color(0xFFF0F0F6);
  static const Color midGrey = Color(0xFFA0A0A0);
  static const Color darkGrey = Color(0xFF333333);

  // #E8E7FF

  static const TextStyle headline1 = TextStyle(
      height: 1,
      fontFamily: 'Montserrat, Semi-Bold',
      fontSize: 48.0,
      fontWeight: FontWeight.w700,
      color: primaryColor);

  static const TextStyle headline2 = TextStyle(
      fontFamily: 'Montserrat, Semi-Bold',
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: darkGrey);

  static const TextStyle title = TextStyle(
      fontFamily: 'Montserrat, Semi-Bold',
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: primaryColor);

  static const TextStyle genreCard = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: darkGrey);

  static const TextStyle body =
      TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, color: darkGrey);

  static const TextStyle bookName = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 12.0,
      color: darkGrey,
      fontWeight: FontWeight.bold);

  static const TextStyle bookNameBold = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16.0,
      color: darkGrey,
      fontWeight: FontWeight.bold);

  static const TextStyle bookAuthor = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.0,
    color: midGrey,
  );

  static const List<BoxShadow> genreCardDecoration = [
    BoxShadow(
        color: Color.fromRGBO(211, 209, 238, 0.5),
        offset: Offset(0.0, 2.0),
        blurRadius: 5.0,
        spreadRadius: 0.0),
  ];

  static BoxDecoration onFocusDecoration = BoxDecoration(
    color: Styles.lightGrey,
    borderRadius: BorderRadius.circular(4.0),
    border: Border.all(color: primaryColor),
  );

  static BoxDecoration offFocusDecoration = BoxDecoration(
    color: Styles.lightGrey,
    borderRadius: BorderRadius.circular(4.0),
  );
}
