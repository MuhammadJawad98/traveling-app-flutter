import 'package:flutter/material.dart';
//custom botton

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTab;
  final double size;
  final Color? color;
  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onTab,
    required this.size,
    this.color, // Added optional parameter for color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTab,
        child: Icon(
          iconData,
          size: size,
          color: color, // Use the provided color or the default color
        ),
      ),
    );
  }
}
