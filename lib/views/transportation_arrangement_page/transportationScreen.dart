import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/constants.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/transportation_arrangement_page/widgets/star_widget.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';

import 'widgets/flight_tile.dart';

class TransportationArrangementScreen extends StatefulWidget {
  const TransportationArrangementScreen({super.key});

  @override
  State<TransportationArrangementScreen> createState() =>
      _TransportationArrangementScreenState();
}

class _TransportationArrangementScreenState
    extends State<TransportationArrangementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Travel Plan',
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 25,
                      )),
                  SizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.2,
                  ),
                  const Text(
                    AppString.travelPlan,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 20,
              ),
              const Text(
                AppString.hotel,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 10,
              ),
              Container(
                height: GetScreenSize.getScreenHeight(context) * 0.15,
                width: double.maxFinite,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(Constants.transportationScreenImage),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.nordinCottage,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 10,
                      ),
                      StarDisplayScreen(
                        numberOfImages: 5,
                        context: context,
                      )
                    ],
                  ),
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              const Text(
                AppString.flights,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  flightTile(context, AppString.chineseFlag, AppString.chn,
                      AppString.time, AppString.firstClass),
                  Image.asset(Constants.transportationScreenArrow),
                  flightTile(context, AppString.UkFlag, AppString.uk,
                      AppString.time, AppString.firstClass)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
