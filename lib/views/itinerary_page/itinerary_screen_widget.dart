import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';

import 'package:traveling_app_flutter/models/person_model.dart';
import 'package:traveling_app_flutter/providers/Itinerary_provider.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/custom_timeline_tile.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/itinerary_top_bar.dart';
import 'package:traveling_app_flutter/views/itinerary_page/widgets/location_details_view_widget.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class ItineraryScreenWidget extends StatefulWidget {
  ItineraryScreenWidget({super.key});

  @override
  State<ItineraryScreenWidget> createState() => _ItineraryScreenWidgetState();
}

class _ItineraryScreenWidgetState extends State<ItineraryScreenWidget> {
  final Person person = Person(
      name: "Alanlove", profession: "Developer", image: AppAssets.prfileAvatar);

  @override
  Widget build(BuildContext context) {
    final screenWidth = GetScreenSize.getScreenWidth(context);
    bool isFirst = false;
    bool isLast = false;
    bool isPast = false;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomSizedBox(height: GetScreenSize.getScreenWidth(context) * 0.07),
          ItineraryTopBar(
            person: person,
            subTitleSize: screenWidth * 0.06,
            titleSize: screenWidth * 0.04,
            radius: screenWidth * 0.056,
          ),
          CustomSizedBox(height: GetScreenSize.getScreenWidth(context) * 0.04),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: CustomText(
                  text: "Maldives Island",
                  color: Colors.black,
                  size: screenWidth * 0.04,
                  maxline: 1,
                  fontWeight: FontWeight.w500)),
          CustomSizedBox(height: GetScreenSize.getScreenWidth(context) * 0.02),
          LocationDetailsViewWidget(),
          CustomSizedBox(height: GetScreenSize.getScreenWidth(context) * 0.05),
          Container(
            color: AppColors.containerColor,
            //height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Consumer<ItineraryProvider>(
                  builder: (context, provier, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        isFirst = true;
                        isLast = false;
                        isPast = true;
                      } else {
                        isFirst = false;
                        isPast = false;
                      }
                      if (index == provier.locations.length - 1) {
                        isLast = true;
                      }
                      return CustomTimelineTile(
                          isFirst: isFirst,
                          isLast: isLast,
                          isPast: isPast,
                          location: provier.locations[index]);
                    });
              }),
            ),
          ),
        ]),
      ),
    ));
  }
}
