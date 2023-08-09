import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/task_model.dart';
import '../../../providers/task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _emojiController = TextEditingController();
  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
      children: [
        AlertDialog(
          elevation: 50,
          scrollable: true,
          backgroundColor: Colors.white,
          title: Text('Add a New Task'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _timeController,
                  maxLength: 4,
                  decoration: InputDecoration(
                      labelText: 'Time',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the time';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _taskController,
                  decoration: InputDecoration(labelText: 'Task'),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the task';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emojiController,
                  decoration: InputDecoration(labelText: 'Emoji'),
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
                  final taskProvider =
                      Provider.of<TaskProvider>(context, listen: false);
                  final newTask = Task(
                    _timeController.text,
                    _taskController.text,
                    _emojiController.text,
                  );
                  taskProvider.addTask(newTask);
                  Navigator.of(context).pop();
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
