import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:traveling_app_flutter/views/home_page/home_page.dart';

import 'Views/front_page/splash_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    home: SafeArea(child: SplashScreen()),
  ));
}
