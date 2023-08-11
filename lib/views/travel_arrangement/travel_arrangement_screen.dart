import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/task_tile.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/time_oval_tile.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';

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
          bottom: TabBar(
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            // indicatorPadding: EdgeInsets.only(top: 10),
            tabs: [
              // Tab(text: 'Day 1',child: Text(data)),
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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    SizedBox(
                      height: 200,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TimeTile(
                                    context: context,
                                    time: AppString.timeShort),
                                TaskTile(
                                    context: context,
                                    task: 'Wakeup',
                                    emoji: AppString.UkFlag)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                        height: 50,
                        width: double.maxFinite,
                        onTab: () {},
                        buttonText: 'Add Activity',
                        buttonColor: Colors.blue.shade100,
                        radius: 30,
                        fontSize: 16)
                  ]),
                  CustomTextButton(
                      height: 50,
                      width: double.maxFinite,
                      onTab: () {},
                      buttonText: 'Next step',
                      buttonColor: Colors.blue,
                      radius: 30,
                      fontSize: 16)
                ],
              ),
            ),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
          ],
        ),
      ),
    );
  }
}
