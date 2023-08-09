import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/helper_function.dart';

class SignInProvider extends ChangeNotifier {
  bool isValidEmail = true;
  void cheeckVaidEmail(TextEditingController controller) {
    controller.addListener(() {
      print(isValidEmail);
      if (controller.text.trim().toString().isValidEmail() ||
          controller.text.isEmpty) {
        isValidEmail = true;
      } else {
        isValidEmail = false;
      }
    });
  }
}
