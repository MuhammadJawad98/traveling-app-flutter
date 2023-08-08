import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obsecure;
  final double raduis;
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.raduis,
      this.obsecure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(raduis),
          )),
    );
  }
}
