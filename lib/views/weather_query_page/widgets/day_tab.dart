import 'package:flutter/material.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

class DayTab extends StatelessWidget {
  final String title1;
  final String title2;

  const DayTab({super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
            text: title1,
            color: Colors.black,
            size: 18,
            maxline: 1,
            fontWeight: FontWeight.w500),
        SizedBox(
          height: GetScreenSize.getScreenWidth(context) * 0.006,
        ),
        CustomText(
            text: title2,
            color: Colors.black45,
            size: 14,
            maxline: 1,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
