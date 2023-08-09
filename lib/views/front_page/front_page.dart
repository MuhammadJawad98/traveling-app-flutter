import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/attraction_details_page.dart';
import 'package:traveling_app_flutter/views/front_page/front_page_widgets/horizontal_image.dart';
import 'package:traveling_app_flutter/views/front_page/front_page_widgets/vertical_image.dart';

import '../../providers/locations_provider.dart';
import '../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';
import 'front_page_widgets/searchbar_widget.dart';

class FrontPage extends StatefulWidget {
  FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final locationsProvider =
        Provider.of<LocationsProvider>(context, listen: false);
    locationsProvider.createArray();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: GetScreenSize.getScreenWidth(context) * 0.05,
              top: GetScreenSize.getScreenHeight(context) * 0.09),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                  text: 'Find your next trip',
                  color: AppColors.frontPageTextColor,
                  size: 16,
                  maxline: 1,
                  fontWeight: FontWeight.w500),
              const CustomText(
                  color: AppColors.frontPageTextColor,
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 26,
                  text: 'Nordic scenery'),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.02,
              ),
              Row(
                children: [
                  MySearchBar(
                      height: GetScreenSize.getScreenHeight(context) * 0.065,
                      width1: GetScreenSize.getScreenWidth(context) * 0.70),
                  SizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                  Container(
                    height: GetScreenSize.getScreenHeight(context) * 0.07,
                    width: GetScreenSize.getScreenWidth(context) * 0.15,
                    //color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.searchBarIconColor),
                    child: Image.asset(AppString.searchBarIcon),
                  )
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              const CustomText(
                  color: AppColors.frontPageTextColor,
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 18,
                  text: 'Popular locations'),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.20,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: LocationsProvider.locations.length,
                    itemBuilder: (context, index) {
                      return VerticalImage(
                        user: LocationsProvider.locations[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              const CustomText(
                  color: AppColors.frontPageTextColor,
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 18,
                  text: 'Popular locations'),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.24,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification notification) {
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
                                  builder: (context) => AttractionDetailsPage(
                                      data:
                                          LocationsProvider.locations[index])));
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
