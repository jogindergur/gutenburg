import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallSceenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;
  final Widget customScreen;

  const ResponsiveWidget({
    Key? key,
    this.largeScreen,
    this.mediumScreen,
    required this.smallScreen,
    required this.customScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < mediumScreenSize;
  }

  static bool isSmallScreenWithoutContext() {
    return Get.width < mediumScreenSize;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumScreenSize &&
        MediaQuery.of(context).size.width < largeScreenSize;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largeScreenSize;
  }

  static bool isCustomSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= customScreenSize &&
        MediaQuery.of(context).size.width >= mediumScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kIsWeb) {
          if (constraints.maxWidth >= largeScreenSize) {
            return customScreen;
          } else if (constraints.maxWidth < largeScreenSize &&
              constraints.maxWidth >= mediumScreenSize) {
            return mediumScreen ?? customScreen;
          } else {
            return smallScreen;
          }
        } else {
          if (Platform.isAndroid) {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              return smallScreen;
            } else {
              if (constraints.maxWidth >= largeScreenSize) {
                return customScreen;
              } else if (constraints.maxWidth < largeScreenSize &&
                  constraints.maxWidth >= mediumScreenSize) {
                return mediumScreen ?? customScreen;
              } else {
                return smallScreen;
              }
            }
          } else if (Platform.isIOS) {
            if (constraints.maxWidth >= largeScreenSize) {
              return customScreen;
            } else if (constraints.maxWidth < largeScreenSize &&
                constraints.maxWidth >= mediumScreenSize) {
              return mediumScreen ?? customScreen;
            } else {
              return smallScreen;
            }
          }
        }
        return smallScreen;
      },
    );
  }
}
