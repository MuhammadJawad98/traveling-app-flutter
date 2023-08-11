// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/views/attraction_introduction_page/widgets/attraction_sheet_model.dart';

class AttractionInroPageWidget extends StatelessWidget {
  const AttractionInroPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [ElevatedButton(onPressed: () {}, child: const Text("Enter"))],
        ));
  }
}
