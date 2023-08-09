import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/widgets/bottom_navigationbar.dart';
import 'package:traveling_app_flutter/providers/locations_provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocationsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const SafeArea(child: MyBottomNavigationBar()),
    );
  }
}
