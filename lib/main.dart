import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/locations_provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:device_preview/device_preview.dart'; // Import device_preview package
import 'package:traveling_app_flutter/views/map_page/map_page.dart';
import 'providers/provider_makeplan_page.dart';
import 'views/onboarding_page/splash_screen.dart';

void main(List<String> args) {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app with DevicePreview
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
        ChangeNotifierProvider<SignInProvider>(
            create: (context) => SignInProvider()),
        ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider()),
        ChangeNotifierProvider<LocationsProvider>(
            create: (context) => LocationsProvider()),
      ],
      child: MaterialApp(
        builder: DevicePreview.appBuilder, // Enable device preview builder
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: SafeArea(child: MapScreen()),
      ),
    );
  }
}
