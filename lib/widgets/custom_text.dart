import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final Color color;
  final double size;
  final int maxline;
  final FontWeight fontWeight;
  const CustomText(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.maxline,
      required this.fontWeight});
  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxline,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.size,
        fontWeight: widget.fontWeight,
      ),
    );
    //
  }
}
