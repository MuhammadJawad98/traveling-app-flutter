import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int count = 1;

  void increment() {
    ++count;
    notifyListeners();
  }
}
