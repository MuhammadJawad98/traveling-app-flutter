// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../models/pricingplan.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';

class AttractionBottomsheetListDesgin extends StatefulWidget {
  PricingPlan plandetail;
  AttractionBottomsheetListDesgin({super.key, required this.plandetail});

  @override
  State<AttractionBottomsheetListDesgin> createState() => _AttractionBottomsheetListDesginState();
}

class _AttractionBottomsheetListDesginState extends State<AttractionBottomsheetListDesgin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListTile(
            leading: CircleAvatar(radius: 20, backgroundImage: AssetImage(widget.plandetail.image), backgroundColor: widget.plandetail.avatorcolor),
            title: CustomText(
                text: widget.plandetail.heading,
                color: AppColors.talhablack,
                size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.048 : GetScreenSize.getScreenWidth(context) * 0.03,
                maxline: 1,
                fontWeight: FontWeight.bold),
            subtitle: CustomText(
                text: widget.plandetail.subtitle,
                color: AppColors.talhagrey,
                size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.042 : GetScreenSize.getScreenWidth(context) * 0.025,
                maxline: 1,
                fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.arrow_forward)));
  }
}
