import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/weather_query_page/widgets/day_tab.dart';
import 'package:traveling_app_flutter/views/weather_query_page/widgets/weather_app_bar.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'widgets/custom_group_button.dart';

class WeatherQueryPage extends StatefulWidget {
  const WeatherQueryPage({super.key});

  @override
  State<WeatherQueryPage> createState() => _WeatherQueryPageState();
}

class _WeatherQueryPageState extends State<WeatherQueryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const MyWeatherAppBar(title: AppString.itineraryForm),
            GroupButton(
              labels: const [
                AppString.island,
                AppString.beach,
                AppString.resort
              ],
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: GetScreenSize.getScreenWidth(context) * 0.065),
              child: CustomTextButton(
                  height: 50,
                  width: double.maxFinite,
                  onTab: () {},
                  buttonText: AppString.viewSpecificItinerary,
                  buttonColor: Colors.blue,
                  radius: 30,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
