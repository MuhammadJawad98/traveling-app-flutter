import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/views/personal_center/profile_page_widget.dart';
import 'package:traveling_app_flutter/views/sign_in/sign_in_page_widget.dart';

import 'package:traveling_app_flutter/views/sign_up_screen/sign_up_screen_widget.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider()),
      ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider()),
    ],
    child: const MaterialApp(
      //theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SafeArea(child: SignUpScreenWidget()),
    ),
  ));
}
