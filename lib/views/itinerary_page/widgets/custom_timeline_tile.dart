import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/timeline_end_child.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../../models/locations_model.dart';

class CustomTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final LocationsModel location;
  const CustomTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    double width = GetScreenSize.getScreenWidth(context);
    return SizedBox(
      height: width * 0.28,
      child: TimelineTile(
        lineXY: width * 0.00052,
        alignment: TimelineAlign.manual,
        indicatorStyle: IndicatorStyle(
            color: isPast ? AppColors.blueButton : AppColors.screenTextColor,
            width: width * 0.08,
            iconStyle: IconStyle(
              fontSize: isPast ? width * 0.055 : width * 0.08,
              iconData: isPast ? Icons.location_on : Icons.circle,
              color: Colors.white,
            )),
        beforeLineStyle: LineStyle(
            color: isPast ? AppColors.blueButton : AppColors.screenTextColor),
        isFirst: isFirst,
        isLast: isLast,
        endChild: TimelineEndChild(
            radius: width * 0.055,
            size: width * 0.05,
            title: location.namelocation,
            subtile: location.description,
            weather: location.wetherEmojy),
        startChild: CustomText(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            size: width * 0.045,
            maxline: 1,
            text: location.time),
      ),
    );
  }
}
