import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
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
                CustomSizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.01,
                ),
                CustomText(
                  text: data.description,
                  color: AppColors.attractionScreenText,
                  size: GetScreenSize.getScreenWidth(context) * 0.03,
                  maxline: 20,
                  fontWeight: FontWeight.w500,
                ),
                CustomSizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.04,
                      child: RatingBar.builder(
                        initialRating: ratingValue,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemSize: GetScreenSize.getScreenWidth(context) * 0.04,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.ratingStarsColor,
                        ),
                        onRatingUpdate: (rating) {},
                        unratedColor: AppColors.unratedStarsColor,
                      ),
                    ),
                    const CustomSizedBox(width: 10),
                    CustomText(
                      text: data.rating,
                      color: Colors.white,
                      size: GetScreenSize.getScreenWidth(context) * 0.0356,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    const CustomSizedBox(width: 10),
                    Expanded(
                      child: CustomText(
                        text: '(${data.numberReviews})',
                        color: Colors.white,
                        size: GetScreenSize.getScreenWidth(context) * 0.0356,
                        maxline: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CustomText(
                      text: 'See reviews',
                      color: Colors.white,
                      size: GetScreenSize.getScreenWidth(context) * 0.0356,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                CustomSizedBox(
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
                      buttonColor: Color.fromRGBO(255, 255, 255, 0.5),
                      radius: 41,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.0356,
                      fontColor: Colors.black,
                    ),
                    CustomTextButton(
                      height: GetScreenSize.getScreenWidth(context) * 0.15,
                      width: GetScreenSize.getScreenWidth(context) * 0.38,
                      onTab: () {},
                      buttonText: 'View Other',
                      buttonColor: Colors.white,
                      radius: 41,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.0356,
                      fontColor: Colors.black,
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
