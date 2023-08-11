// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/helper_function.dart';

class SignUpProvider extends ChangeNotifier {
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool matchPassword = true;
  String email = "";
  String password = "";

  void cheeckVaidEmail(TextEditingController controller) {
    controller.addListener(() {
      print(isValidEmail);
      if (controller.text.trim().toString().isValidEmail() || controller.text.isEmpty) {
        isValidEmail = true;
        notifyListeners();
      } else {
        isValidEmail = false;
        notifyListeners();
      }
    });
  }

  void cheeckVaidPassword(TextEditingController controller) {
    controller.addListener(() {
      print(isValidPassword);
      if (controller.text.trim().toString().isValidPassword() || controller.text.isEmpty) {
        isValidPassword = true;
        notifyListeners();
      } else {
        isValidPassword = false;
        notifyListeners();
      }
    });
  }

  void checkConfirmPasswordPassword(TextEditingController passwordController, TextEditingController comfirmPasswordController) {}
}
