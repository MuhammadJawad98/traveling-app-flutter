import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class ProfileTopBarWidget extends StatelessWidget {
  final String title;
  final String imgPath;
  final double? radius;
  const ProfileTopBarWidget(
      {super.key, required this.title, required this.imgPath, this.radius});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: title,
            color: Colors.black,
            size: 26,
            maxline: 1,
            fontWeight: FontWeight.w600),
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(imgPath),
        ),
      ],
    );
  }
}
