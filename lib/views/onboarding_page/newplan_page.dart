import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:traveling_app_flutter/models/eventsmodal.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_rounded_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text_field.dart';

import '../../utils/app_strings.dart';

class NewPlan extends StatefulWidget {
  NewPlan({super.key});

  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  final TextEditingController queryJourneyController = TextEditingController();
  final TextEditingController eventTFController = TextEditingController();
  //Map<DateTime, List<EventsModels>> events = {};
  bool isSwitched = false;
  DateTime today = DateTime.now();
  DateTime? selectedDay;
  //late final ValueNotifier<List<EventsModels>> _selectedEvents;

  @override
  initState() {
    super.initState();
    selectedDay = today;
    // _selectedEvents = ValueNotifier(_getEventsForDay(selectedDay!));
  }

  //List<EventsModels> _getEventsForDay(DateTime day) {
  //  return events[day] ?? [];
  // }

  // void ondayselected(DateTime day, DateTime dayFocus) {
  //   if (!isSameDay(selectedDay, day)) {
  //     setState(() {
  //       selectedDay = day;
  //       today = dayFocus;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final width = GetScreenSize.getScreenWidth(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(13.0),
      child: SingleChildScrollView(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: width * 0.1,
              ),
              Center(
                child: Text(
                  AppString.headingNewPlan,
                  style: TextStyle(
                      // fontFamily: AppString.poppins,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: width * 0.07),
                ),
              ),
              SizedBox(
                width: width * 0.1,
              ),
              SizedBox(height: width * 0.05),
              Center(
                child: SizedBox(
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(AppAssets.imagepage5,
                          width: width,
                          height: width * 0.3,
                          fit: BoxFit.fitHeight),
                    ),
                    Positioned(
                        top: width * 0.12,
                        left: width * 0.04,
                        child: Text(
                          AppString.placeNewPlan,
                          style: TextStyle(
                              //  fontFamily: AppString.poppins,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: width * 0.05),
                        )),
                    Positioned(
                        top: width * 0.18,
                        left: width * 0.04,
                        child: Text(
                          AppString.placeNewPlan,
                          style: TextStyle(
                              //  fontFamily: AppString.poppins,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: width * 0.07),
                        ))
                  ]),
                ),
              ),
              SizedBox(height: width * 0.05),
              content(context, eventTFController),
              SizedBox(height: width * 0.05),
              Text(
                AppString.selectdatesNewPlan,
                style: TextStyle(
                    // fontFamily: AppString.poppins,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: width * 0.045),
              ),
              SizedBox(height: width * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                        prefixIcon: const Icon(
                          Icons.people_outline_outlined,
                          color: Colors.black,
                        ),
                        hint: AppString.tfNewPlan,
                        controller: queryJourneyController,
                        raduis: 30),
                  ),
                  SizedBox(width: width * 0.05),
                  CustomRonudedButton(
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
                      AppString.sendNewPlan,
                      style: TextStyle(
                          //   fontFamily: AppString.poppins,
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
                  buttonText: AppString.nextstepNewPlan,
                  width: width * 0.9,
                  radius: 50,
                  height: width * 0.15,
                ),
              )
            ],
          ),
          Positioned(
            top: width * 0.1,
            left: width * 0.01,
            child: Icon(
              Icons.arrow_back_sharp,
              size: width * 0.08,
            ),
          )
        ]),
      ),
    ));
  }

  Widget content(context, TextEditingController eventTFController) {
    //Text("Selected Day = " + today.toString().split(" ")[0]),
    final width = GetScreenSize.getScreenWidth(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.selectdatesNewPlan,
          style: TextStyle(
              //  fontFamily: AppString.poppins,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: width * 0.045),
        ),
        TableCalendar(
          locale: 'en_US',
          rowHeight: GetScreenSize.getScreenWidth(context) * 0.09,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(today, day),
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 10, 30),
          //onDaySelected: ondayselected,
          //eventLoader: _getEventsForDay,
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.grey.shade500),
              weekendStyle: TextStyle(color: Colors.grey.shade500)),
          calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                  color: Colors.blue.shade600, shape: BoxShape.circle),
              todayDecoration: const BoxDecoration(
                  color: AppColors.blueButton, shape: BoxShape.circle)),
        ),
        SizedBox(
          height: width * 0.1,
        ),
        // ValueListenableBuilder<List<EventsModels>>(
        //     valueListenable: _selectedEvents,
        //     builder: (context, value, _) {
        //       return ListView.builder(itemBuilder: (context, index) {
        //         return Container(
        //           margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        //           decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(12)),
        //           child: ListTile(
        //             onTap: () => print(""),
        //             title: Text('${value[index]}'),
        //           ),
        //         );
        //       });
        //     }),
        // FloatingActionButton(
        //   onPressed: () {
        //     showDialog(
        //         context: context,
        //         builder: (context) {
        //           return AlertDialog(
        //             scrollable: true,
        //             title: Text("Event Name"),
        //             content: Padding(
        //               padding: EdgeInsets.all(8),
        //               child: TextField(
        //                 controller: eventTFController,
        //               ),
        //             ),
        //             actions: [
        //               ElevatedButton(
        //                   onPressed: () {
        //                     events.addAll(
        //                       {
        //                         selectedDay!: [
        //                           EventsModels(eventTFController.text)
        //                         ]
        //                       },
        //                     );
        //                     Navigator.of(context).pop();
        //                     eventTFController.clear();
        //                     print(events[1]);
        //                   },
        //                   child: const Text("Submit"))
        //             ],
        //           );
        //         });
        //   },
        //   child: Icon(Icons.add),
        // )
      ],
    );
  }
}
