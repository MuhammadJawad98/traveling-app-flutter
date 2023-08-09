import 'package:flutter/material.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

class TaskTile extends StatelessWidget {
  final BuildContext context;
  final String task;
  final String emoji;
  const TaskTile(
      {super.key,
      required this.context,
      required this.task,
      required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetScreenSize.getScreenWidth(context) * 0.6,
      height: GetScreenSize.getScreenHeight(context) * 0.075,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              width: 0.60, color: Color.fromARGB(255, 196, 196, 196)),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: CustomText(
                text: task,
                color: Colors.black,
                size: 16,
                maxline: 1,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 18,
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
