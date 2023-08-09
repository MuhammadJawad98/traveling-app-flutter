import 'package:flutter/material.dart';

import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';

class CustomTextButton extends StatelessWidget {
  final double height;
  final double width;
  final Widget? icon;
  final bool addIcon;
  final String buttonText;
  final Color buttonColor;
  final Color fontColor;
  final VoidCallback onTab;
  final double radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomTextButton(
      {super.key,
      required this.height,
      required this.width,
      this.icon,
      required this.onTab,
      required this.buttonText,
      required this.buttonColor,
      required this.radius,
      this.addIcon = false,
      required this.fontSize,
      this.fontColor = Colors.white,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTab,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius), color: buttonColor),
          height: height,
          width: width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (addIcon) icon!,
                const CustomSizedBox(
                  width: 10,
                ),
                Text(
                    textAlign: TextAlign.center,
                    buttonText,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight))
              ]),
        ),
      ),
    );
  }
}
