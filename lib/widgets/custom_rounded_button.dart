import 'package:flutter/material.dart';

class CustomRonudedButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final Color color;
  final Color backgroundcolor;
  final bool? flag;

  const CustomRonudedButton(
      {super.key,
      required this.onTap,
      this.flag = true,
      this.color = Colors.white,
      this.width = double.infinity,
      this.backgroundcolor = const Color.fromRGBO(3, 115, 243, 1)});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: backgroundcolor,
      child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          )),
    );
  }
}
