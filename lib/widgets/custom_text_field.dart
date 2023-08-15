import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obsecure;
  final double raduis;
  final bool isValid;
  final String erroText;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.raduis,
      this.obsecure = false,
      this.isValid = true,
      this.erroText = ""});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: GetScreenSize.getScreenWidth(context) * 0.03),
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: GetScreenSize.getScreenWidth(context) * 0.02,
          ),
          errorMaxLines: 2,
          errorStyle: TextStyle(
              fontSize: GetScreenSize.getScreenWidth(context) * 0.025),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          //errorText: "InValid Email",
          errorText: isValid ? null : erroText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis),
              borderSide: BorderSide(
                  color:
                      isValid ? AppColors.textFieldBoarderColor : Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis),
              borderSide: BorderSide(
                  color:
                      isValid ? AppColors.textFieldBoarderColor : Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis),
              borderSide: BorderSide(
                  color:
                      isValid ? AppColors.textFieldBoarderColor : Colors.red)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(raduis),
          )),
    );
  }
}
