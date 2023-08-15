import 'package:flutter/material.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

class FlightTile extends StatelessWidget {
  final BuildContext context;
  final String flag;
  final String title;
  final String time;

  final String flightype;
  const FlightTile({super.key, required this.context, required this.flag, required this.title, required this.time, required this.flightype});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetScreenSize.getScreenWidth(context) * 0.54,
      width: GetScreenSize.getScreenWidth(context) * 0.37,
      decoration: ShapeDecoration(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            radius: 22,
            child: Text(
              flag,
              style: const TextStyle(fontSize: 21),
              textAlign: TextAlign.center,
            ),
          ),
          CustomText(text: title, color: Colors.black, size: 30, maxline: 1, fontWeight: FontWeight.w400),
          CustomText(text: time, color: const Color(0xFF858585), size: 12, maxline: 1, fontWeight: FontWeight.w400),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.airplane_ticket,
                color: Colors.blue,
                size: 18,
              ),
              SizedBox(
                width: GetScreenSize.getScreenWidth(context) * 0.01,
              ),
              CustomText(text: flightype, color: Colors.blue, size: 12, maxline: 1, fontWeight: FontWeight.normal)
            ],
          )
        ],
      ),
    );
  }
}
