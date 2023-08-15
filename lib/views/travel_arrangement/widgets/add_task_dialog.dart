import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day2_task_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day3_task_provider.dart';

import '../../../models/task_model.dart';
import '../../../providers/day_task_providers/day1_task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  final int day;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _emojiController = TextEditingController();

  AddTaskDialog({super.key, required this.day});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
      children: [
        AlertDialog(
          elevation: 50,
          backgroundColor: Colors.white,
          title: Text('Add a New Task'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _timeController,
                  maxLength: 5,
                  decoration: InputDecoration(labelText: 'Time', border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the time';
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 10,
                  controller: _taskController,
                  decoration: InputDecoration(labelText: 'Task', border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the task';
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 1,
                  controller: _emojiController,
                  decoration: InputDecoration(labelText: 'Emoji', border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter an emoji';
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (day == 1) {
                    final taskProvider = Provider.of<Day1TaskProvider>(context, listen: false);
                    final newTask = Task(
                      _timeController.text,
                      _taskController.text,
                      _emojiController.text,
                    );
                    taskProvider.addDay1Task(newTask);
                    Navigator.of(context).pop();
                  } else if (day == 2) {
                    final taskProvider = Provider.of<Day2TaskProvider>(context, listen: false);
                    final newTask = Task(
                      _timeController.text,
                      _taskController.text,
                      _emojiController.text,
                    );
                    taskProvider.addTask(newTask);
                    Navigator.of(context).pop();
                  } else if (day == 3) {
                    final taskProvider = Provider.of<Day3TaskProvider>(context, listen: false);
                    final newTask = Task(
                      _timeController.text,
                      _taskController.text,
                      _emojiController.text,
                    );
                    taskProvider.addTask(newTask);
                    Navigator.of(context).pop();
                  }
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}
