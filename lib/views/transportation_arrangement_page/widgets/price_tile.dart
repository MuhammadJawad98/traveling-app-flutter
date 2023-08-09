import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class PriceTile extends StatelessWidget {
  final String desc;
  final String price;
  const PriceTile({super.key, required this.desc, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: desc,
            color: Colors.black,
            size: 16,
            maxline: 1,
            fontWeight: FontWeight.w400),
        CustomText(
            text: price,
            color: Colors.blue,
            size: 16,
            maxline: 1,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
