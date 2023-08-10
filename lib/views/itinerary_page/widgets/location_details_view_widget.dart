import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class LocationDetailsViewWidget extends StatelessWidget {
  const LocationDetailsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var fontSize = GetScreenSize.getScreenWidth(context) * 0.04;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: GetScreenSize.getScreenWidth(context) * 0.60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1639919397870-cc2c183be021?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fExvY2F0aW9uc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"))),
        child: Stack(children: [
          Positioned(
            bottom: 22,
            right: 23,
            child: CustomTextButton(
                height: GetScreenSize.getScreenWidth(context) * 0.12,
                width: null,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                onTab: () {},
                buttonText: "Maldives",
                buttonColor: AppColors.blueButton,
                radius: 12,
                fontSize: fontSize),
          ),
          Positioned(
            left: 20,
            top: 28,
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: GetScreenSize.getScreenWidth(context) * 0.04,
                  color: AppColors.screenTextColor,
                ),
                CustomText(
                    text: "Beach Reef",
                    color: AppColors.screenTextColor,
                    size: GetScreenSize.getScreenWidth(context) * 0.04,
                    maxline: 1,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
          Positioned(
              top: 20,
              right: 52,
              child: CircleAvatar(
                // backgroundImage: AssetImage(AppAssets.prfileAvatar),
                radius: GetScreenSize.getScreenWidth(context) * 0.04,
              )),
          Positioned(
              top: 20,
              right: 77,
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                // backgroundImage: AssetImage(AppAssets.prfileAvatar),
                radius: GetScreenSize.getScreenWidth(context) * 0.04,
              )),
          Positioned(
              top: 20,
              right: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.prfileAvatar),
                radius: GetScreenSize.getScreenWidth(context) * 0.04,
              )),
        ]),
      ),
    );
  }
}
