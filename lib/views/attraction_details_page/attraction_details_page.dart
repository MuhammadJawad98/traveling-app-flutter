// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../utils/media_query.dart';

class AttractionDetailsPage extends StatefulWidget {
  final LocationsModel data;
  const AttractionDetailsPage({super.key, required this.data});

  @override
  State<AttractionDetailsPage> createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double ratingValue =
        double.parse(widget.data.rating); // Convert string to double

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: GetScreenSize.getScreenHeight(context) * 1.94,
                width: GetScreenSize.getScreenWidth(context),
                child: Image.network(
                  widget.data.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    GetScreenSize.getScreenWidth(context) * 0.04,
                    GetScreenSize.getScreenWidth(context) * 0.17,
                    0,
                    0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.attractionScreenText,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    GetScreenSize.getScreenWidth(context) * 0.05,
                    GetScreenSize.getScreenWidth(context) * 0.9,
                    GetScreenSize.getScreenWidth(context) * 0.05,
                    0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: widget.data.namelocation,
                        color: AppColors.attractionScreenText,
                        size: 42,
                        maxline: 20,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.01,
                    ),
                    CustomText(
                        text: widget.data.description,
                        color: AppColors.attractionScreenText,
                        size: 14,
                        maxline: 20,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: RatingBar.builder(
                            initialRating: ratingValue,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemSize: 16,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.ratingStarsColor,
                            ),
                            onRatingUpdate: (rating) {},
                            unratedColor: AppColors.unratedStarsColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomText(
                            text: widget.data.rating,
                            color: Colors.white,
                            size: 14,
                            maxline: 1,
                            fontWeight: FontWeight.w400),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomText(
                              text: '(${widget.data.numberReviews})',
                              color: Colors.white,
                              size: 14,
                              maxline: 1,
                              fontWeight: FontWeight.w400),
                        ),
                        const CustomText(
                            text: 'See reviews',
                            color: Colors.white,
                            size: 14,
                            maxline: 1,
                            fontWeight: FontWeight.w400)
                      ],
                    ),
                    SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextButton(
                          height: GetScreenSize.getScreenWidth(context) * 0.15,
                          width: GetScreenSize.getScreenWidth(context) * 0.38,
                          onTab: () {},
                          buttonText: 'Enter the Plan ',
                          buttonColor: Color.fromRGBO(255, 255, 255, 0.5),
                          radius: 41,
                          fontSize: 16,
                          fontColor: Colors.black,
                        ),
                        SizedBox(
                          width: GetScreenSize.getScreenWidth(context) * 0.12,
                        ),
                        CustomTextButton(
                          height: GetScreenSize.getScreenWidth(context) * 0.15,
                          width: GetScreenSize.getScreenWidth(context) * 0.38,
                          onTab: () {},
                          buttonText: 'View Other',
                          buttonColor: Colors.white,
                          radius: 41,
                          fontSize: 16,
                          fontColor: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(
              //       GetScreenSize.getScreenWidth(context) * 0.05,
              //       GetScreenSize.getScreenWidth(context) * 1.25,
              //       GetScreenSize.getScreenWidth(context) * 0.05,
              //       0),
              //   child: CustomText(
              //       text: widget.data.description,
              //       color: AppColors.attractionScreenText,
              //       size: 14,
              //       maxline: 20,
              //       fontWeight: FontWeight.w500),
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(
              //       GetScreenSize.getScreenWidth(context) * 0.05,
              //       GetScreenSize.getScreenWidth(context) * 1.1,
              //       GetScreenSize.getScreenWidth(context) * 0.05,
              //       0),
              //   child: CustomText(
              //       text: widget.data.namelocation,
              //       color: AppColors.attractionScreenText,
              //       size: 42,
              //       maxline: 20,
              //       fontWeight: FontWeight.w500),
              // ),
              // Positioned(
              //   top: GetScreenSize.getScreenWidth(context) * 1.65,
              //   left: GetScreenSize.getScreenWidth(context) * 0.07,
              //   right: GetScreenSize.getScreenWidth(context) * 0.05,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         height: 40,
              //         child: RatingBar.builder(
              //           initialRating: ratingValue,
              //           minRating: 1,
              //           direction: Axis.horizontal,
              //           allowHalfRating: true,
              //           itemCount: 5,
              //           itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              //           itemSize: 16,
              //           itemBuilder: (context, _) => const Icon(
              //             Icons.star,
              //             color: AppColors.ratingStarsColor,
              //           ),
              //           onRatingUpdate: (rating) {},
              //           unratedColor: AppColors.unratedStarsColor,
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       CustomText(
              //           text: widget.data.rating,
              //           color: Colors.white,
              //           size: 14,
              //           maxline: 1,
              //           fontWeight: FontWeight.w400),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: CustomText(
              //             text: '(${widget.data.numberReviews})',
              //             color: Colors.white,
              //             size: 14,
              //             maxline: 1,
              //             fontWeight: FontWeight.w400),
              //       ),
              //       const CustomText(
              //           text: 'See reviews',
              //           color: Colors.white,
              //           size: 14,
              //           maxline: 1,
              //           fontWeight: FontWeight.w400)
              //     ],
              //   ),
              // ),
              //  Positioned(
              //   top: GetScreenSize.getScreenWidth(context) * 1.75,
              //   left: GetScreenSize.getScreenWidth(context) * 0.07,
              //   right: GetScreenSize.getScreenWidth(context) * 0.05,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomTextButton(
              //         height: GetScreenSize.getScreenWidth(context) * 0.15,
              //         width: GetScreenSize.getScreenWidth(context) * 0.38,
              //         onTab: () {},
              //         buttonText: 'Enter the Plan ',
              //         buttonColor: Color.fromRGBO(255, 255, 255, 0.5),
              //         radius: 41,
              //         fontSize: 16,
              //         fontColor: Colors.black,
              //       ),
              //       SizedBox(
              //         width: GetScreenSize.getScreenWidth(context) * 0.12,
              //       ),
              //       CustomTextButton(
              //         height: GetScreenSize.getScreenWidth(context) * 0.15,
              //         width: GetScreenSize.getScreenWidth(context) * 0.38,
              //         onTab: () {},
              //         buttonText: 'View Other',
              //         buttonColor: Colors.white,
              //         radius: 41,
              //         fontSize: 16,
              //         fontColor: Colors.black,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
