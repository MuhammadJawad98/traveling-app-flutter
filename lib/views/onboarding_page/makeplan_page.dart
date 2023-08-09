import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/provider_makeplan_page.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/front_page/front_page.dart';
import 'package:traveling_app_flutter/views/sign_in/sign_in_page_widget.dart';
import 'package:traveling_app_flutter/views/sign_up_screen/sign_up_screen_widget.dart';
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
                                ? AppAssets.imagepage2
                                : counter.count == 2
                                    ? AppAssets.imagepage3
                                    : AppAssets.imagepage4,
                            height: width * 0.67,
                            width: width * 0.67),
                        SizedBox(height: width * 0.05),
                        Text(
                          counter.count == 1
                              ? AppString.heading2
                              : counter.count == 2
                                  ? AppString.heading3
                                  : AppString.heading4,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontSize: width * 0.07),
                          // style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: width * 0.07),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: width * 0.06),
                        Text(
                          counter.count == 1
                              ? AppString.description2
                              : counter.count == 2
                                  ? AppString.description3
                                  : AppString.description4,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Colors.grey.shade400,
                              fontSize: width * 0.04),
                          // style: TextStyle(
                          //     fontWeight: FontWeight.normal,
                          //     color: Colors.grey.shade400,
                          //     fontSize: width * 0.04),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: width * 0.1),
                        CustomRonudedButton(
                            width: width * 0.125,
                            onTap: () {
                              if (counter.count < 3) {
                                counter.increment();
                              } else {
                                print(counter.count);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreenWidget()),
                                );
                              }
                              setState(() {});
                            }),
                      ]),
                    ),
                  ),
                ]))));
  }

  // void tapbutton(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const homePageScreenWidget()),
  //   );
  // }
}
