import 'package:flutter/material.dart';
import '../../models/task_model.dart';

class Day2TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
