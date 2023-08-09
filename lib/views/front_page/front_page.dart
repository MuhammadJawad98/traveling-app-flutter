import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/attraction_details_page.dart';
import 'package:traveling_app_flutter/views/front_page/front_page_widgets/horizontal_image.dart';
import 'package:traveling_app_flutter/views/front_page/front_page_widgets/vertical_image.dart';
import '../../models/locations_model.dart';
import '../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';

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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: GetScreenSize.getScreenWidth(context) * 0.05,
              top: GetScreenSize.getScreenHeight(context) * 0.09),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                  text: 'Find your next trip',
                  color: Color.fromRGBO(0, 0, 0, 1),
                  size: 16,
                  maxline: 1,
                  fontWeight: FontWeight.w500),
              const CustomText(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 26,
                  text: 'Nordic scenery'),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.02,
              ),
              Row(
                children: [
                  //const SearchBar(),
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
                  SizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                  Container(
                    height: GetScreenSize.getScreenHeight(context) * 0.07,
                    width: GetScreenSize.getScreenWidth(context) * 0.15,
                    //color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue),
                    child: Image.asset(AppString.searchBarIcon),
                  )
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              const CustomText(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 18,
                  text: 'Popular locations'),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.20,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return VerticalImage(
                        user: locations[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              const CustomText(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  maxline: 1,
                  size: 18,
                  text: 'Popular locations'),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.03,
              ),
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 0.24,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttractionDetailsPage(
                                      data: locations[index])));
                        },
                        child: HorizontalImage(
                          user: locations[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
