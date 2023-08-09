import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day2_task_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day3_task_provider.dart';

import 'package:traveling_app_flutter/views/home_page/home_page.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/travel_arrangement_screen.dart';

import 'providers/day_task_providers/day1_task_provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Day1TaskProvider()),
        ChangeNotifierProvider(create: (context) => Day2TaskProvider()),
        ChangeNotifierProvider(create: (context) => Day3TaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const SafeArea(child: TravelArrangementScreen()),
    );
  }
}
