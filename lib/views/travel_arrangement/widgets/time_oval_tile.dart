import 'package:flutter/material.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

class TimeTile extends StatelessWidget {
  final BuildContext context;
  final String time;
  const TimeTile({super.key, required this.context, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetScreenSize.getScreenWidth(context) * 0.22,
      height: GetScreenSize.getScreenHeight(context) * 0.075,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              width: 0.60, color: Color.fromARGB(255, 196, 196, 196)),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.access_time,
            color: Colors.black45,
          ),
          CustomText(
              text: time,
              color: Colors.black,
              size: 16,
              maxline: 1,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
