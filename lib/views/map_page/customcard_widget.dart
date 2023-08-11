import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../attraction_details_page/rating_bar.dart';

class CustomCard extends StatefulWidget {
  final LocationsModel user;
  const CustomCard({super.key, required this.user});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: GetScreenSize.getScreenWidth(context) * 0.09, right: 8),
      child: Container(
        height: GetScreenSize.getScreenWidth(context) * 0.5,
        width: GetScreenSize.getScreenWidth(context) * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: AppColors.talhawhite),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: GetScreenSize.getScreenWidth(context) * 0.03,
              vertical: GetScreenSize.getScreenWidth(context) * 0.02),
          child: Row(
            children: [
              Container(
                height: GetScreenSize.getScreenWidth(context) * 0.45,
                width: GetScreenSize.getScreenWidth(context) * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.user.image,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: GetScreenSize.getScreenWidth(context) * 0.03,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.02,
                    ),
                    CustomText(
                      text: 'Sunset evening avenue',
                      color: AppColors.abubakarBlack,
                      size: GetScreenSize.getScreenWidth(context) * 0.0378,
                      maxline: 10,
                      fontWeight: FontWeight.w900,
                    ),
                    CustomSizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.04,
                    ),
                    MYRatingBar(
                      ratingValue: 2,
                      itemCount: 5,
                      itemPadding: GetScreenSize.getScreenWidth(context) * 0,
                      itemSize: GetScreenSize.getScreenHeight(context) * 0.04,
                      minRating: 1,
                    ),
                    CustomSizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.04,
                    ),
                    CustomText(
                      text: 'from',
                      color: AppColors.talhagrey,
                      size: GetScreenSize.getScreenWidth(context) * 0.032,
                      maxline: 10,
                      fontWeight: FontWeight.w900,
                    ),
                    CustomSizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: '\$ 299/night',
                            color: AppColors.abubakarBlack,
                            size: GetScreenSize.getScreenWidth(context) * 0.035,
                            maxline: 10,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        CustomIconButton(
                            iconData: Icons.heart_broken,
                            onTab: () {},
                            size: GetScreenSize.getScreenWidth(context) * 0.04,
                            color: AppColors.searchBarIconColor),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
