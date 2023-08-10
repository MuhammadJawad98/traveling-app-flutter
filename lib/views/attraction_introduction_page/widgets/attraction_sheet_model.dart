import 'package:flutter/material.dart';

class CustomBottomModalSheet {
  static void show(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ));
  }
}
