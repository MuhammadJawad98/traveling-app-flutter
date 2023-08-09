import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/provider_makeplan_page.dart';
import 'package:traveling_app_flutter/utils/app_constants.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/home_page/home_page.dart';
import 'package:traveling_app_flutter/widgets/custom_rounded_button.dart';
import 'package:traveling_app_flutter/widgets/custom_image.dart';

class MakePlan extends StatefulWidget {
  const MakePlan({super.key});

  @override
  State<MakePlan> createState() => _MakePlanState();
}

class _MakePlanState extends State<MakePlan> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    final width = GetScreenSize.getScreenWidth(context);
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.all(width * 0.1),
                child: Row(children: [
                  if (width > 500) Container(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        CustomImage(
                            img: counter.count == 1
                                ? AppString.image2
                                : counter.count == 2
                                    ? AppString.image3
                                    : AppString.image4,
                            height: width * 0.67,
                            width: width * 0.67),
                        SizedBox(height: width * 0.05),
                        Text(
                          counter.count == 1
                              ? AppString.heading2
                              : counter.count == 2
                                  ? AppString.heading3
                                  : AppString.heading4,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.07),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: width * 0.06),
                        Text(
                          counter.count == 1
                              ? AppString.description2
                              : counter.count == 2
                                  ? AppString.description3
                                  : AppString.description4,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade400,
                              fontSize: width * 0.04),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: width * 0.1),
                        CustomRonudedButton(
                            width: width * 0.125,
                            onTap: () {
                              if (counter.count < 3) {
                                counter.increment();
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const homePageScreenWidget()),
                                );
                              }
                              setState(() {});

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const MakePlan()),
                              // );
                            }),
                      ]),
                    ),
                  ),
                ]))));
  }

  void tapbutton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const homePageScreenWidget()),
    );
  }
}
