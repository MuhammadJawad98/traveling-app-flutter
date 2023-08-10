import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';

import 'package:traveling_app_flutter/models/person_model.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/custom_timeline_tile.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/itinerary_top_bar.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/location_details_view_widget.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class ItineraryScreenWidget extends StatelessWidget {
  final Person person = Person(
      name: "Alanlove", profession: "Developer", image: AppAssets.prfileAvatar);
  ItineraryScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = GetScreenSize.getScreenWidth(context);

    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: CustomSizedBox()),
        ItineraryTopBar(
          person: person,
          subTitleSize: screenWidth * 0.06,
          titleSize: screenWidth * 0.04,
          radius: screenWidth * 0.056,
        ),
        Expanded(child: CustomSizedBox()),
        CustomText(
            text: "Maldives Island",
            color: Colors.black,
            size: screenWidth * 0.04,
            maxline: 1,
            fontWeight: FontWeight.w500),
        Expanded(child: CustomSizedBox()),
        LocationDetailsViewWidget(),
        Expanded(child: CustomSizedBox()),
      ]),
    ));
  }
}
