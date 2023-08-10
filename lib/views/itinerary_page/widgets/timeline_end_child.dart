import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class TimelineEndChild extends StatelessWidget {
  final String title;
  final String subtile;
  final String weather;
  final double size;
  final double radius;
  const TimelineEndChild(
      {super.key,
      required this.title,
      required this.subtile,
      required this.weather,
      required this.size,
      required this.radius});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.045),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: title,
                  color: Colors.black,
                  size: size,
                  maxline: 1,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.009,
              ),
              CustomText(
                  text: subtile,
                  color: AppColors.screenTextColor,
                  size: size,
                  maxline: 1,
                  fontWeight: FontWeight.normal)
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(weather,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.075)),
            radius: radius,
          )
        ],
      ),
    );
  }
}
