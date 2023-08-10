import 'package:flutter/material.dart';

class CustomRonudedButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final Color color;
  final Color backgroundcolor;
  final bool? flag;
  final IconData icon;

  const CustomRonudedButton(
      {super.key,
      required this.onTap,
      this.flag = true,
      this.icon = Icons.arrow_forward_rounded,
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )),
    );
  }
}
