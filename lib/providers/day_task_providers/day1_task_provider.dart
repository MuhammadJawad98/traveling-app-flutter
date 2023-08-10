import 'package:flutter/material.dart';
import '../../models/task_model.dart';

class Day1TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addDay1Task(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
