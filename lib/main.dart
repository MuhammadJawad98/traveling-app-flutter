import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveling_app_flutter/views/personal_center/profile_page_widget.dart';
import 'package:traveling_app_flutter/views/sign_in_page/sign_in_page_widget.dart';
import 'package:traveling_app_flutter/views/sign_up_screen/sign_up_screen_widget.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    //theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    home: SafeArea(child: SignInPageScreenWidget()),
  ));
}
