import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/views/home_page/home_page.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: SafeArea(child: homePageScreenWidget()),
  ));
}
