import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/constants.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/transportation_arrangement_page/widgets/my_app_bar.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import 'widgets/flight_tile.dart';
import 'widgets/hotel_tile.dart';
import 'widgets/price_tile.dart';

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
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(title: AppString.travelPlan),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.01,
                ),
                const CustomText(
                    text: AppString.hotel,
                    color: Colors.black,
                    size: 16,
                    maxline: 1,
                    fontWeight: FontWeight.w600),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.025,
                ),
                HotelTile(
                    context: context,
                    name: AppString.nordinCottage,
                    starCount: 5),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.03,
                ),
                const CustomText(
                    text: AppString.flights,
                    color: Colors.black,
                    size: 16,
                    maxline: 1,
                    fontWeight: FontWeight.w600),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlightTile(
                        context: context,
                        flag: AppString.chineseFlag,
                        title: AppString.chn,
                        time: AppString.time,
                        flightype: AppString.firstClass),
                    Image.asset(Constants.transportationScreenArrow),
                    FlightTile(
                        context: context,
                        flag: AppString.UkFlag,
                        title: AppString.uk,
                        time: AppString.time,
                        flightype: AppString.firstClass)
                  ],
                ),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.05,
                ),
                const CustomText(
                    text: AppString.flights,
                    color: Colors.black,
                    size: 16,
                    maxline: 1,
                    fontWeight: FontWeight.w600),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.04,
                ),
                SizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.3,
                  width: double.maxFinite,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PriceTile(
                          desc: AppString.hotelNights,
                          price: AppString.hotelPrice),
                      PriceTile(
                          desc: AppString.flights,
                          price: AppString.flightsPrice),
                      PriceTile(
                          desc: AppString.total, price: AppString.totalPrice),
                    ],
                  ),
                ),
                CustomSizedBox(
                  height: GetScreenSize.getScreenHeight(context) * 0.04,
                ),
                CustomTextButton(
                    height: GetScreenSize.getScreenHeight(context) * 0.15,
                    width: double.maxFinite,
                    onTab: () {},
                    buttonText: AppString.determinePlan,
                    buttonColor: Colors.blue,
                    radius: 30,
                    fontSize: 19)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
