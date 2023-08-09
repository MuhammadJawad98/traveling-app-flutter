import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/task_tile.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/widgets/time_oval_tile.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';

import '../../providers/task_provider.dart';
import '../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';
import 'widgets/add_task_dialog.dart';

class TravelArrangementScreen extends StatefulWidget {
  const TravelArrangementScreen({super.key});

  @override
  State<TravelArrangementScreen> createState() =>
      _TravelArrangementScreenState();
}

class _TravelArrangementScreenState extends State<TravelArrangementScreen> {
  @override
  Widget build(BuildContext context) {
    final dayProvider1 = Provider.of<TaskProvider>(context);
    final dayProvider2 = Provider.of<TaskProvider>(context);
    final dayProvider3 = Provider.of<TaskProvider>(context);
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
            dayTabView(context, dayProvider1),
            dayTabView(context, dayProvider2),
            dayTabView(context, dayProvider3),
          ],
        ),
      ),
    );
  }

  Padding dayTabView(BuildContext context, TaskProvider taskProvider) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SizedBox(
              height: GetScreenSize.getScreenHeight(context) * 0.55,
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = taskProvider.tasks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TimeTile(context: context, time: task.time),
                        TaskTile(
                            context: context,
                            task: task.task,
                            emoji: task.emoji),
                      ],
                    ),
                  );
                },
              ),
            ),
            CustomTextButton(
                height: 50,
                width: double.maxFinite,
                onTab: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddTaskDialog(),
                  );
                },
                buttonText: 'Add Activity',
                buttonColor: Colors.blue.shade200,
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
    );
  }
}
