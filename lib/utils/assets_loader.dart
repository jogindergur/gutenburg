import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetsLoader {
  static SvgPicture adventure = SvgPicture.asset(
    'assets/images/Adventure.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture back = SvgPicture.asset(
    'assets/images/Back.svg',
    height: 22,
    width: 22,
  );

  static SvgPicture cancel = SvgPicture.asset(
    'assets/images/Cancel.svg',
    height: 12,
    width: 12,
  );

  static SvgPicture drama = SvgPicture.asset(
    'assets/images/Drama.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture fiction = SvgPicture.asset(
    'assets/images/Fiction.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture history = SvgPicture.asset(
    'assets/images/History.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture humour = SvgPicture.asset(
    'assets/images/Humour.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture next = SvgPicture.asset(
    'assets/images/Next.svg',
    height: 16,
    width: 16,
  );

  static SvgPicture pattern = SvgPicture.asset(
    'assets/images/Pattern.svg',
    fit: BoxFit.cover,
    // height: Get.height * .8,
    // colorFilter: const ColorFilter.mode(Styles.secondaryColor, BlendMode.srcIn),
  );

  static SvgPicture philosophy = SvgPicture.asset(
    'assets/images/Philosophy.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture politics = SvgPicture.asset(
    'assets/images/Politics.svg',
    height: 30,
    width: 30,
  );

  static SvgPicture search = SvgPicture.asset(
    'assets/images/Search.svg',
    height: 16,
    width: 16,
  );
}
