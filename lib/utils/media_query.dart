import 'package:flutter/material.dart';

class GetScreenSize {
  // final Widget mobile;
  // final Widget tablet;
  // final Widget desktop;
  // const GetScreenSize({
  //   Key? key,
  //   required this.desktop,
  //   required this.mobile,
  //   required this.tablet,
  // }) ;
  // static bool isMobile(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 650;

  // /// tablet >= 650
  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 650;

  // ///desktop >= 1100
  // static bool isDesktop(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 1100;

  static Size getScreenSize(BuildContext context) {
    // if (MediaQuery.of(context).size.width > 1000) {
    //   return MediaQuery.of(context).size / 3;
    // } else if (MediaQuery.of(context).size.width > 500 &&
    //     MediaQuery.of(context).size.width < 1000) {
    //   return MediaQuery.of(context).size / 2;
    // }
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1200) {
      return MediaQuery.of(context).size.width / 3;
    }
    if (MediaQuery.of(context).size.width > 850 &&
        MediaQuery.of(context).size.width < 1200) {
      return MediaQuery.of(context).size.width / 2;
    }
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    if (MediaQuery.of(context).size.height > 1200) {
      return MediaQuery.of(context).size.height / 3;
    }
    if (MediaQuery.of(context).size.height > 500 &&
        MediaQuery.of(context).size.height < 800) {
      return MediaQuery.of(context).size.height / 2;
    }
    return MediaQuery.of(context).size.height;
  }
}
