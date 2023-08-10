import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day2_task_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day3_task_provider.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/day1_view.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/day2_view.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/day3_view.dart';
import '../../providers/day_task_providers/day1_task_provider.dart';
import '../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';

class TravelArrangementScreen extends StatefulWidget {
  const TravelArrangementScreen({super.key});

  @override
  State<TravelArrangementScreen> createState() =>
      _TravelArrangementScreenState();
}

class _TravelArrangementScreenState extends State<TravelArrangementScreen> {
  @override
  Widget build(BuildContext context) {
    final dayProvider1 = Provider.of<Day1TaskProvider>(context);
    final dayProvider2 = Provider.of<Day2TaskProvider>(context);
    final dayProvider3 = Provider.of<Day3TaskProvider>(context);
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              )),
          title: const Text(
            AppString.addIti,
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            tabs: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: AppString.day1,
                      color: Colors.black,
                      size: 18,
                      maxline: 1,
                      fontWeight: FontWeight.w500),
                  CustomText(
                      text: AppString.date1,
                      color: Colors.black45,
                      size: 14,
                      maxline: 1,
                      fontWeight: FontWeight.w500),
                ],
              ),
              Column(
                children: [
                  CustomText(
                      text: AppString.day2,
                      color: Colors.black,
                      size: 18,
                      maxline: 1,
                      fontWeight: FontWeight.w500),
                  CustomText(
                      text: AppString.date2,
                      color: Colors.black45,
                      size: 14,
                      maxline: 1,
                      fontWeight: FontWeight.w500),
                ],
              ),
              Column(
                children: [
                  CustomText(
                      text: AppString.day3,
                      color: Colors.black,
                      size: 18,
                      maxline: 1,
                      fontWeight: FontWeight.w500),
                  CustomText(
                      text: AppString.date3,
                      color: Colors.black45,
                      size: 14,
                      maxline: 1,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Day1View(taskProvider: dayProvider1),
            Day2View(taskProvider: dayProvider2),
            Day3View(taskProvider: dayProvider3)
          ],
        ),
      ),
    );
  }
}
