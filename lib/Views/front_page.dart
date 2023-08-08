import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatefulWidget {
  FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find your next trip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Nordic scenery',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color.fromRGBO(233, 233, 233, 1),
                        width: 1,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 52,
                    width: 52,
                    //color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue),

                    child: const Icon(Icons.line_axis),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              const CustomText(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 18,
                  text: 'Popular locations'),
            ],
          ),
        ),
      ),
    );
  }
}
