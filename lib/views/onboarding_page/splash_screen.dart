// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';

import 'makeplan_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MakePlan())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue, body: Center(child: Image.asset(AppAssets.imageSplashpage1)));
  }
}
