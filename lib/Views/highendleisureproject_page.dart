import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/Views/highendtravel_page.dart';
import 'package:traveling_app_flutter/utils/app_constants.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';

import '../widgets/custom_image.dart';

class HighEndLeisureProject extends StatelessWidget {
  const HighEndLeisureProject({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding:
                    EdgeInsets.all(GetScreenSize.getScreenWidth(context) * 0.1),
                child: Column(children: [
                  CustomImage(
                      img: AppString.image4,
                      height: GetScreenSize.getScreenWidth(context) * 0.67,
                      width: GetScreenSize.getScreenWidth(context) * 0.67),
                  SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.05),
                  Text(
                    AppString.heading4,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.07),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.06),
                  Padding(
                    padding: EdgeInsets.only(
                        left: GetScreenSize.getScreenWidth(context) * 0.06,
                        right: GetScreenSize.getScreenWidth(context) * 0.06),
                    child: Text(
                      AppString.description4,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade400,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.05),
                  CustomButton(
                      width: GetScreenSize.getScreenWidth(context) * 0.125,
                      onTap: () {
                        tapbutton(context);
                      }),
                ]))));
  }

  void tapbutton(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HighEndeTravel()),
    // );
  }
}
