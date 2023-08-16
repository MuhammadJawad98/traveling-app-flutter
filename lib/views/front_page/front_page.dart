import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/attraction_details_page.dart';
import 'package:traveling_app_flutter/views/front_page/front_page_widgets/horizontal_image.dart';
import 'package:traveling_app_flutter/views/front_page/front_page_widgets/vertical_image.dart';
import 'package:traveling_app_flutter/views/front_page/upload_image_location.dart';

import '../../providers/locations_provider.dart';
import '../../providers/upload_location_provider.dart';
import '../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';
import 'front_page_widgets/searchbar_icon.dart';
import 'front_page_widgets/searchbar_widget.dart';

class FrontPage extends StatefulWidget {
  // String userid;
  FrontPage({
    super.key,
  });

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    super.initState();
    // Use a short delay to ensure the initial build is complete
    Future.delayed(Duration(milliseconds: 100), () {
      final locationsProvider = Provider.of<LocationsProvider>(context, listen: false);

      final AddlocationsProvider = Provider.of<UploadLocationsProvider>(context, listen: false);
      AddlocationsProvider.fetchLocationsData();
      locationsProvider.createArray();
    });
  }

  @override
  Widget build(BuildContext context) {
    LocationsProvider provider = context.watch<LocationsProvider>();
    var AddlocationsProvider = Provider.of<UploadLocationsProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.05, top: GetScreenSize.getScreenWidth(context) * 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: AppString.findTripText, color: AppColors.frontPageTextColor, size: 16, maxline: 1, fontWeight: FontWeight.w500),
              const CustomText(color: AppColors.frontPageTextColor, fontWeight: FontWeight.w600, maxline: 1, size: 26, text: AppString.nordicscenery),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.07,
              ),
              Row(
                children: [
                  MySearchBar(
                    height: GetScreenSize.getScreenWidth(context) * 0.15,
                    width1: GetScreenSize.getScreenWidth(context) * 0.70,
                    fieldTextFont: GetScreenSize.getScreenWidth(context) * 0.04,
                    searchIconSize: GetScreenSize.getScreenWidth(context) * 0.04,
                    searchTextFont: GetScreenSize.getScreenWidth(context) * 0.04,
                  ),
                  SizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadImageData(),
                          ));
                    },
                    child: SearchBarBlueIcon(
                      height: GetScreenSize.getScreenWidth(context) * 0.15,
                      width: GetScreenSize.getScreenWidth(context) * 0.15,
                      radius: GetScreenSize.getScreenHeight(context) * 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.1,
              ),
              const CustomText(color: AppColors.frontPageTextColor, fontWeight: FontWeight.w600, maxline: 1, size: 18, text: AppString.popularLocations),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.06,
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.45,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AddlocationsProvider.locationsList.length,
                    itemBuilder: (context, index) {
                      return VerticalImage(
                        user: AddlocationsProvider.locationsList[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.08,
              ),
              const CustomText(color: AppColors.frontPageTextColor, fontWeight: FontWeight.w600, maxline: 1, size: 18, text: AppString.popularLocations),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.03,
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.56,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: LocationsProvider.locations.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AttractionDetailsPage(data: provider.getLocations[index]),
                            ),
                          );
                        },
                        child: HorizontalImage(
                          user: LocationsProvider.locations[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
