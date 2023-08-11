import 'package:flutter/material.dart';

class AttractionInroPageWidget extends StatelessWidget {
  const AttractionInroPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // CustomBottomModalSheet.show(context, child: )
                },
                child: Text("Enter"))
          ],
        ));
  }
}
