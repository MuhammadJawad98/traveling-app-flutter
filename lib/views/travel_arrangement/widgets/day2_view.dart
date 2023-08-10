import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day2_task_provider.dart';

import '../../../utils/media_query.dart';
import '../../../widgets/custom_button.dart';
import 'add_task_dialog.dart';
import 'task_tile.dart';
import 'time_oval_tile.dart';

class Day2View extends StatelessWidget {
  final Day2TaskProvider taskProvider;
  const Day2View({super.key, required this.taskProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SizedBox(
              height: GetScreenSize.getScreenWidth(context) * 0.9,
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
                    builder: (context) => AddTaskDialog(day: 2),
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
