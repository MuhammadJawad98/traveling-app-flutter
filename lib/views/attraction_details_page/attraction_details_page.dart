import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/rating_bar.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../utils/media_query.dart';
import '../../widgets/custom_sized_box.dart';

class AttractionDetailsPage extends StatelessWidget {
  final LocationsModel data;

  const AttractionDetailsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    double ratingValue = double.parse(data.rating);

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: CustomSizedBox(
              height: GetScreenSize.getScreenWidth(context) * 2.5,
              width: GetScreenSize.getScreenWidth(context),
              child: Image.network(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              GetScreenSize.getScreenWidth(context) * 0.04,
              GetScreenSize.getScreenWidth(context) * 0.17,
              0,
              0,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.attractionScreenText,
                size: GetScreenSize.getScreenWidth(context) * 0.07,
              ),
            ),
          ),
          Positioned(
            bottom: GetScreenSize.getScreenWidth(context) * 0.05,
            right: GetScreenSize.getScreenWidth(context) * 0.05,
            left: GetScreenSize.getScreenWidth(context) * 0.05,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: data.namelocation,
                  color: AppColors.attractionScreenText,
                  size: GetScreenSize.getScreenWidth(context) * 0.08,
                  maxline: 20,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.01,
                ),
                CustomText(
                  text: data.description,
                  color: AppColors.attractionScreenText,
                  size: GetScreenSize.getScreenWidth(context) * 0.03,
                  maxline: 20,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MYRatingBar(
                        ratingValue: ratingValue,
                        itemCount: 5,
                        itemPadding:
                            GetScreenSize.getScreenWidth(context) * 0.02,
                        itemSize: GetScreenSize.getScreenWidth(context) * 0.04,
                        minRating: 1),
                    const SizedBox(width: 10),
                    CustomText(
                      text: data.rating,
                      color: AppColors.talhawhite,
                      size: GetScreenSize.getScreenWidth(context) * 0.0356,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomText(
                        text: '(${data.numberReviews})',
                        color: AppColors.talhawhite,
                        size: GetScreenSize.getScreenWidth(context) * 0.0356,
                        maxline: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CustomText(
                      text: 'See reviews',
                      color: AppColors.talhawhite,
                      size: GetScreenSize.getScreenWidth(context) * 0.0356,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.0356,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextButton(
                      height: GetScreenSize.getScreenWidth(context) * 0.15,
                      width: GetScreenSize.getScreenWidth(context) * 0.38,
                      onTab: () {},
                      buttonText: 'Enter the Plan ',
                      buttonColor: const Color.fromRGBO(255, 255, 255, 0.5),
                      radius: 41,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.0356,
                      fontColor: AppColors.blackColorButton,
                    ),
                    CustomTextButton(
                      height: GetScreenSize.getScreenWidth(context) * 0.15,
                      width: GetScreenSize.getScreenWidth(context) * 0.38,
                      onTab: () {},
                      buttonText: 'View Other',
                      buttonColor: AppColors.talhawhite,
                      radius: 41,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.0356,
                      fontColor: AppColors.blackColorButton,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
