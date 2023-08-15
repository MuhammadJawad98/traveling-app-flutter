import 'package:flutter/material.dart';

import '../../../providers/day_task_providers/day1_task_provider.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_button.dart';
import 'add_task_dialog.dart';
import 'task_tile.dart';
import 'time_oval_tile.dart';

class Day1View extends StatelessWidget {
  final Day1TaskProvider taskProvider;
  const Day1View({super.key, required this.taskProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                SizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.6,
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
                            TaskTile(context: context, task: task.task, emoji: task.emoji),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                CustomTextButton(
                    height: GetScreenSize.getScreenWidth(context) * 0.14,
                    width: double.maxFinite,
                    onTab: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddTaskDialog(day: 1),
                      );
                    },
                    buttonText: 'Add Activity',
                    buttonColor: Colors.blue.shade200,
                    radius: 30,
                    fontSize: 16)
              ]),
              // CustomTextButton(height: GetScreenSize.getScreenWidth(context) * 0.14, width: double.maxFinite, onTab: () {}, buttonText: 'Next step', buttonColor: Colors.blue, radius: 30, fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}
