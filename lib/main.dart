import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/locations_provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/views/transportation_arrangement_page/transportationScreen.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/travel_arrangement_screen.dart';

import 'providers/day_task_providers/day1_task_provider.dart';
import 'providers/day_task_providers/day2_task_provider.dart';
import 'providers/day_task_providers/day3_task_provider.dart';
import 'providers/provider_makeplan_page.dart';
import 'views/onboarding_page/splash_screen.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
        ChangeNotifierProvider<SignInProvider>(
            create: (context) => SignInProvider()),
        ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider()),
        ChangeNotifierProvider<LocationsProvider>(
            create: (context) => LocationsProvider()),
        ChangeNotifierProvider<Day1TaskProvider>(
            create: (context) => Day1TaskProvider()),
        ChangeNotifierProvider<Day2TaskProvider>(
            create: (context) => Day2TaskProvider()),
        ChangeNotifierProvider<Day3TaskProvider>(
            create: (context) => Day3TaskProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: const SafeArea(child: TransportationArrangementScreen()),
      )));
}
