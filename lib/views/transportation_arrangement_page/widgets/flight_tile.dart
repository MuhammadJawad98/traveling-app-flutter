import 'package:flutter/material.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

Widget flightTile(BuildContext context, String flag, String title, String time,
    String flightype) {
  return Container(
    height: GetScreenSize.getScreenHeight(context) * 0.3,
    width: GetScreenSize.getScreenHeight(context) * 0.2,
    decoration: ShapeDecoration(
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            child: Text(
              flag,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          CustomText(
              text: title,
              color: Colors.black,
              size: 36,
              maxline: 1,
              fontWeight: FontWeight.w400),
          CustomText(
              text: time,
              color: const Color(0xFF858585),
              size: 14,
              maxline: 1,
              fontWeight: FontWeight.w400),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.airplane_ticket,
                color: Colors.blue,
              ),
              CustomText(
                  text: flightype,
                  color: Colors.blue,
                  size: 14,
                  maxline: 1,
                  fontWeight: FontWeight.normal)
            ],
          )
        ],
      ),
    ),
  );
}
