import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/person_model.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class ItineraryTopBar extends StatelessWidget {
  final double titleSize;
  final double subTitleSize;
  final Person person;
  final double radius;
  const ItineraryTopBar(
      {super.key,
      required this.titleSize,
      required this.subTitleSize,
      required this.person,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 24, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(
              color: AppColors.screenTextColor,
              fontWeight: FontWeight.w400,
              maxline: 1,
              text: AppString.goodMoringText,
              size: titleSize,
            ),
            CustomText(
              color: AppColors.blackColorButton,
              fontWeight: FontWeight.w600,
              maxline: 1,
              text: "${AppString.helloText}, ${person.name}",
              size: subTitleSize,
            ),
          ]),
          CircleAvatar(
            backgroundImage: AssetImage(AppAssets.prfileAvatar),
            radius: radius,
          )
        ],
      ),
    );
  }
}
