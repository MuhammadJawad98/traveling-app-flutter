// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/dynamic_text_field.dart';
import 'package:traveling_app_flutter/firebase_options.dart';
import 'package:traveling_app_flutter/providers/Itinerary_provider.dart';
import 'package:traveling_app_flutter/providers/bottom_sheet_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day1_task_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day2_task_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/day3_task_provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/map_page_provider.dart';
import 'package:traveling_app_flutter/providers/locations_provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/providers/upload_location_provider.dart';
import 'providers/provider_makeplan_page.dart';
import 'views/onboarding_page/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
    // DevicePreview(
    //   builder: (context) => MyApp(), // Wrap your app with DevicePreview
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
        ChangeNotifierProvider<SignInProvider>(create: (context) => SignInProvider()),
        ChangeNotifierProvider<SignUpProvider>(create: (context) => SignUpProvider()),
        ChangeNotifierProvider<LocationsProvider>(create: (context) => LocationsProvider()),
        ChangeNotifierProvider<BottomSheetStateProvider>(create: (context) => BottomSheetStateProvider()),
        ChangeNotifierProvider(create: (context) => Day1TaskProvider()),
        ChangeNotifierProvider(create: (context) => Day2TaskProvider()),
        ChangeNotifierProvider(create: (context) => Day3TaskProvider()),
        ChangeNotifierProvider(create: (context) => MapPageProvider()),
        ChangeNotifierProvider<ItineraryProvider>(create: (context) => ItineraryProvider()),
        ChangeNotifierProvider<UploadLocationsProvider>(create: (context) => UploadLocationsProvider()),
      ],
      child: MaterialApp(
        // builder: DevicePreview.appBuilder, // Enable device preview builder
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: SafeArea(child: DynamicListExample()),
      ),
    );
  }
}
