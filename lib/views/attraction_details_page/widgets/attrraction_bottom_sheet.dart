import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/widgets/attraction_bottomsheet_list_desgin.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/widgets/rating_bar.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../../models/pricingplan.dart';
import '../../../providers/bottom_sheet_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_button.dart';

class AttractionBottomSheet extends StatefulWidget {
  final LocationsModel databotomsheet;
  final double ratingValue;

  const AttractionBottomSheet({
    super.key,
    required this.databotomsheet,
    required this.ratingValue,
  });

  @override
  State<AttractionBottomSheet> createState() => _AttractionBottomSheetState();
}

class _AttractionBottomSheetState extends State<AttractionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
                final bottomSheetProvider = Provider.of<BottomSheetStateProvider>(context, listen: false);
                bottomSheetProvider.initialValue(context);
              },
              child: const Icon(Icons.menu)),
          Padding(
              padding: const EdgeInsets.only(
                left: 9,
                bottom: 9,
                right: 9,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(text: widget.databotomsheet.namelocation, color: AppColors.talhablack, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                CustomText(text: widget.databotomsheet.description, color: AppColors.talhagrey, size: GetScreenSize.getScreenWidth(context) * 0.035, maxline: 3, fontWeight: FontWeight.w500),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  MYRatingBar(ratingValue: widget.ratingValue),
                  CustomText(text: widget.databotomsheet.rating, color: AppColors.talhablack, size: GetScreenSize.getScreenWidth(context) * 0.0356, maxline: 1, fontWeight: FontWeight.w400),
                  Expanded(
                      child: CustomText(
                          text: '(${widget.databotomsheet.numberReviews})',
                          color: AppColors.talhablack,
                          size: GetScreenSize.getScreenWidth(context) * 0.0356,
                          maxline: 1,
                          fontWeight: FontWeight.w400)),
                  CustomText(text: AppString.attractionBSreview, color: AppColors.talhagrey, size: GetScreenSize.getScreenWidth(context) * 0.0356, maxline: 1, fontWeight: FontWeight.bold)
                ]),
                CustomText(text: AppString.attractionBSpricing, color: AppColors.talhablack, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold),
                ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AttractionBottomsheetListDesgin(plandetail: planpricinglist[index]);
                    },
                    itemCount: planpricinglist.length,
                    separatorBuilder: (context, index) => const Divider(indent: 24, endIndent: 22)),
                CustomTextButton(
                    buttonColor: AppColors.blueButton,
                    height: GetScreenSize.getScreenHeight(context) * 0.12,
                    onTab: () {},
                    radius: 36,
                    buttonText: AppString.attractionBSbuttontext,
                    width: double.infinity,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.05)
              ])),
        ],
      ),
    );
  }
}
