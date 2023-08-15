import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/Itinerary_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day1_task_provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/views/itinerary_page/itinerary_screen_widget.dart';
import 'package:traveling_app_flutter/views/onboarding_page/newplan_page.dart';
import 'package:traveling_app_flutter/views/onboarding_page/splash_screen.dart';
import 'package:traveling_app_flutter/views/weather_query_page/wearther_query_page.dart';
import 'providers/day_task_providers/day2_task_provider.dart';
import 'providers/day_task_providers/day3_task_provider.dart';
import 'providers/provider_makeplan_page.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
        ChangeNotifierProvider<SignInProvider>(
            create: (context) => SignInProvider()),
        ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider()),
        ChangeNotifierProvider<ItineraryProvider>(
            create: (context) => ItineraryProvider()),
        ChangeNotifierProvider<Day1TaskProvider>(
            create: (context) => Day1TaskProvider()),
        ChangeNotifierProvider<Day2TaskProvider>(
            create: (context) => Day2TaskProvider()),
        ChangeNotifierProvider<Day3TaskProvider>(
            create: (context) => Day3TaskProvider()),
      ],
      child: DevicePreview(
        builder: (BuildContext context) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          home: SafeArea(child: SplashScreen()),
        ),
      )));
}
