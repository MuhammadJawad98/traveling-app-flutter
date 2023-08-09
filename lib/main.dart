import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/widgets/bottom_navigationbar.dart';
import 'package:traveling_app_flutter/providers/locations_provider.dart'; // Import your LocationsProvider

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocationsProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SafeArea(child: MyBottomNavigationBar()),
    );
  }
}
