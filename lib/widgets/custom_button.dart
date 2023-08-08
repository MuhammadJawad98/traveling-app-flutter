import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final Color color;
  final Color backgroundcolor;
  final bool? flag;

  const CustomButton(
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
          child: Stack(children: <Widget>[
            Container(
              width: width,
              padding: const EdgeInsets.all(20),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
          ])),
    );
  }
}
