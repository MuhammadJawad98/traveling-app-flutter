import 'package:flutter/material.dart';

class GetScreenSize {
  // Do not Change this Class
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Orientation getScreenOrienation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }
}
