import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTab;
  final double size;
  const CustomIconButton(
      {super.key,
      required this.iconData,
      required this.onTab,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            child: Icon(
      iconData,
      size: size,
    )));
  }
}
