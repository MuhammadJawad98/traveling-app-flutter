import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double width;
  final double height;
  final String img;

  const CustomImage(
      {super.key,
      this.width = double.infinity,
      this.height = double.infinity,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      img,
      height: height,
      width: width,
    );
  }
}
