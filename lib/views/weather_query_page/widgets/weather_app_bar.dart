import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class MyWeatherAppBar extends StatelessWidget {
  final String title;
  const MyWeatherAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 22,
              )),
          // SizedBox(
          //   width: GetScreenSize.getScreenWidth(context) * 0.2,
          // ),
          CustomText(
              text: title,
              color: Colors.black,
              size: 20,
              maxline: 1,
              fontWeight: FontWeight.w500),
          IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.black,
                size: 23,
              )),
        ],
      ),
    );
  }
}
