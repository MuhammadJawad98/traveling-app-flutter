import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/weather_query_page/widgets/day_tab.dart';
import 'package:traveling_app_flutter/views/weather_query_page/widgets/weather_app_bar.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';

import '../../providers/Itinerary_provider.dart';
import '../../utils/app_colors.dart';
import '../itinerary_page/widgets/custom_timeline_tile.dart';
import 'widgets/custom_group_button.dart';

class WeatherQueryPage extends StatefulWidget {
  const WeatherQueryPage({super.key});

  @override
  State<WeatherQueryPage> createState() => _WeatherQueryPageState();
}

class _WeatherQueryPageState extends State<WeatherQueryPage> {
  bool isFirst = false;
  bool isLast = false;
  bool isPast = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: GetScreenSize.getScreenWidth(context) * 0.065, vertical: GetScreenSize.getScreenWidth(context) * 0.02),
            child: CustomTextButton(height: 50, width: double.maxFinite, onTab: () {}, buttonText: AppString.viewSpecificItinerary, buttonColor: Colors.blue, radius: 30, fontSize: 16),
          ),

          backgroundColor: AppColors.containerColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const MyWeatherAppBar(title: AppString.itineraryForm),
                          GroupButton(
                            labels: const [AppString.island, AppString.beach, AppString.resort],
                            onPressed: (index) {},
                          ),
                          CustomSizedBox(
                            height: GetScreenSize.getScreenWidth(context) * 0.02,
                          ),
                          const TabBar(
                            indicatorColor: Colors.blue,
                            indicatorWeight: 3,
                            tabs: [
                              DayTab(title1: AppString.day1, title2: AppString.date1),
                              DayTab(title1: AppString.day2, title2: AppString.date2),
                              DayTab(title1: AppString.day3, title2: AppString.date3),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: GetScreenSize.getScreenWidth(context) * 1.3,
                    child: TabBarView(children: [
                      timelineView(context),
                      timelineView(context),
                      timelineView(context),
                    ]),
                  )
                ],
              ),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //         horizontal: GetScreenSize.getScreenWidth(context) * 0.065,
          //         vertical: GetScreenSize.getScreenWidth(context) * 0.02),
          //     child: CustomTextButton(
          //         height: 50,
          //         width: double.maxFinite,
          //         onTab: () {},
          //         buttonText: AppString.viewSpecificItinerary,
          //         buttonColor: Colors.blue,
          //         radius: 30,
          //         fontSize: 16),
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget timelineView(BuildContext context) {
    return Container(
      height: GetScreenSize.getScreenWidth(context) * 1.3,
      color: AppColors.containerColor,
      //height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ItineraryProvider>(builder: (context, provier, child) {
          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              //shrinkWrap: true,
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
                return CustomTimelineTile(isFirst: isFirst, isLast: isLast, isPast: isPast, location: provier.locations[index]);
              });
        }),
      ),
    );
  }
}
