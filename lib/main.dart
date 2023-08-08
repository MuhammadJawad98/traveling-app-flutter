import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:traveling_app_flutter/views/home_page/home_page.dart';
import 'package:traveling_app_flutter/views/transportation_arrangement_page/transportationScreen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    home: const SafeArea(child: TransportationArrangementScreen()),
  ));
}
