import 'package:flutter/material.dart';

class homePageScreenWidget extends StatelessWidget {
  const homePageScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage")),
      body: const Column(children: [Text("Hello World")]),
    );
  }
}
