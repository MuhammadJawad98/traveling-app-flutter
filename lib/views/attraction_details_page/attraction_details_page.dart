import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/providers/bottom_sheet_provider.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/views/attraction_details_page/rating_bar.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_sized_box.dart';
import '../onboarding_page/newplan_page.dart';

class AttractionDetailsPage extends StatefulWidget {
  final LocationsModel data;
  const AttractionDetailsPage({super.key, required this.data});

  @override
  State<AttractionDetailsPage> createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final bottomSheetProvider =
          Provider.of<BottomSheetStateProvider>(context, listen: false);
      bottomSheetProvider.initialValue(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double ratingValue = double.parse(widget.data.rating);
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Expanded(
            child: CustomSizedBox(
              height: GetScreenSize.getScreenWidth(context) * 2.5,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.data.image,
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
            bottom: context.watch<BottomSheetStateProvider>().getValue,
            right: GetScreenSize.getScreenWidth(context) * 0.05,
            left: GetScreenSize.getScreenWidth(context) * 0.05,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.data.namelocation,
                  color: AppColors.talhawhite,
                  size: GetScreenSize.getScreenWidth(context) * 0.08,
                  maxline: 20,
                  fontWeight: FontWeight.w500,
                ),
                CustomSizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.01,
                ),
                CustomText(
                  text: widget.data.description,
                  color: AppColors.talhawhite,
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
                    MYRatingBar(
                      itemCount: 5,
                      itemPadding:
                          GetScreenSize.getScreenWidth(context) * 0.003,
                      itemSize: GetScreenSize.getScreenWidth(context) * 0.047,
                      minRating: 1,
                      ratingValue: ratingValue,
                    ),
                    const CustomSizedBox(width: 10),
                    CustomText(
                      text: widget.data.rating,
                      color: AppColors.talhawhite,
                      size: GetScreenSize.getScreenWidth(context) * 0.0356,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    const CustomSizedBox(width: 10),
                    Expanded(
                      child: CustomText(
                        text: '(${widget.data.numberReviews})',
                        color: AppColors.talhawhite,
                        size: GetScreenSize.getScreenWidth(context) * 0.0356,
                        maxline: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CustomText(
                      text: AppString.attractionDSreview,
                      color: AppColors.talhawhite,
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
                      onTab: () {
                        context
                            .read<BottomSheetStateProvider>()
                            .changeListener(context);
                        // _showBottomSheet(context);
                        Provider.of<BottomSheetStateProvider>(context,
                                listen: false)
                            .showBottomSheet(context, widget.data);
                      },
                      buttonText: AppString.attractionDSbuttonplan,
                      buttonColor: AppColors.attractiiondetailbuttongrey,
                      radius: 41,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.0356,
                      fontColor: AppColors.blackColorButton,
                    ),
                    CustomTextButton(
                      height: GetScreenSize.getScreenWidth(context) * 0.15,
                      width: GetScreenSize.getScreenWidth(context) * 0.38,
                      onTab: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewPlan()));
                      },
                      buttonText: AppString.attractionDSbuttonview,
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
