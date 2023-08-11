import 'package:flutter/material.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 25,
            )),
        SizedBox(
          width: GetScreenSize.getScreenWidth(context) * 0.2,
        ),
        CustomText(
            text: title,
            color: Colors.black,
            size: 20,
            maxline: 1,
            fontWeight: FontWeight.w600)
      ],
    );
  }
}
