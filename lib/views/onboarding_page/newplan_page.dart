import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_rounded_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text_field.dart';

class NewPlan extends StatefulWidget {
  NewPlan({super.key});

  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  final TextEditingController queryJourneyController = TextEditingController();
  bool isSwitched = false;
  DateTime today = DateTime.now();

  void ondayselected(DateTime day, DateTime dayFocus) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = GetScreenSize.getScreenWidth(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width * 0.1,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_back_sharp,
                  size: width * 0.08,
                ),
                SizedBox(
                  width: width * 0.25,
                ),
                Text(
                  "New Plan",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: width * 0.07),
                )
              ],
            ),
            SizedBox(height: width * 0.05),
            Center(
              child: SizedBox(
                child: Stack(children: [
                  Image.asset(AppAssets.imagepage5,
                      width: width * 1,
                      height: width * 0.3,
                      fit: BoxFit.fitHeight),
                  Positioned(
                      top: width * 0.12,
                      left: width * 0.04,
                      child: Text(
                        "Nordic Cottage",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: width * 0.05),
                      )),
                  Positioned(
                      top: width * 0.18,
                      left: width * 0.04,
                      child: Text(
                        "Nordic Cottage",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: width * 0.07),
                      ))
                ]),
              ),
            ),
            SizedBox(height: width * 0.05),
            content(context),
            SizedBox(height: width * 0.05),
            Text(
              "Select Dates",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontSize: width * 0.05),
            ),
            SizedBox(height: width * 0.02),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: width * 0.14,
                    width: width * 0.75,
                    child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.people_outline_outlined),
                            hintText: "Query Journey",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                  ),
                ),
                SizedBox(width: width * 0.05),
                CustomRonudedButton(
                  width: width * 0.4,
                  onTap: () {},
                  icon: Icons.send,
                )
              ],
            ),
            SizedBox(height: width * 0.04),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Send to your email",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: width * 0.05),
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.grey.shade400,
                  activeColor: AppColors.blueButton,
                  splashRadius: width * 0.5,
                ),
              ],
            ),
            SizedBox(height: width * 0.04),
            Center(
              child: CustomTextButton(
                buttonColor: AppColors.blueButton,
                fontSize: width * 0.05,
                onTab: () {},
                buttonText: 'Next Step',
                width: width * 0.9,
                radius: 30,
                height: width * 0.17,
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget content(context) {
    //Text("Selected Day = " + today.toString().split(" ")[0]),

    return SizedBox(
      child: TableCalendar(
        locale: 'en_US',
        rowHeight: GetScreenSize.getScreenWidth(context) * 0.09,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day, today),
        focusedDay: today,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 10, 30),
        onDaySelected: ondayselected,
      ),
    );
  }
}
