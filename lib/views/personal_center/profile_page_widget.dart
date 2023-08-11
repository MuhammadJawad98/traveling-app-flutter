import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/personal_center/widgets/top_bar_widget.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../utils/app_assets.dart';
import '../../widgets/bottom_navigationbar.dart';
import '../../widgets/custom_button.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_field.dart';

class ProfilePageScreenWidget extends StatelessWidget {
  ProfilePageScreenWidget({super.key});
  final TextEditingController controller = TextEditingController();
  final TextEditingController passowrTfcontroller = TextEditingController();
  final TextEditingController authenticateTfcontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double buttonWidth = GetScreenSize.getScreenWidth(context) * 0.8;
    final double buttonHeith = GetScreenSize.getScreenWidth(context) * 0.14;
    double width1 = GetScreenSize.getScreenWidth(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 26, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconButton(
                iconData: Icons.arrow_back,
                onTab: () {
                  Navigator.pop(context);
                },
                size: width1 * 0.065),
            const Expanded(
              child: CustomSizedBox(),
            ),
            ProfileTopBarWidget(
                title: AppString.title, imgPath: AppAssets.prfileAvatar),
            const CustomSizedBox(
              height: 27,
            ),
            CustomText(
                text: AppString.emailText,
                color: AppColors.screenTextColor,
                size: width1 * 0.04,
                maxline: 1,
                fontWeight: FontWeight.w400),
            const Expanded(
              child: CustomSizedBox(),
            ),
            CustomTextField(
              controller: controller,
              hint: AppString.hintEmailText,
              raduis: 36,
              prefixIcon: Image.asset(AppAssets.perosn),
            ),
            const Expanded(
              child: CustomSizedBox(),
            ),
            CustomText(
                text: AppString.passwordText,
                color: AppColors.screenTextColor,
                size: width1 * 0.04,
                maxline: 1,
                fontWeight: FontWeight.w400),
            const Expanded(
              child: CustomSizedBox(),
            ),
            CustomTextField(
              controller: passowrTfcontroller,
              hint: AppString.enterPasswordText,
              raduis: 36,
              obsecure: true,
              prefixIcon: Image.asset(AppAssets.lock),
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: CustomTextButton(
                    buttonColor: AppColors.blueButton,
                    height: GetScreenSize.getScreenHeight(context) * 0.02,
                    onTab: () {},
                    radius: 36,
                    buttonText: AppString.btnChange,
                    width: GetScreenSize.getScreenWidth(context) * 0.25,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.037,
                  )),
            ),
            const Expanded(
              child: CustomSizedBox(),
            ),
            CustomText(
                text: AppString.authenticateText,
                color: AppColors.screenTextColor,
                size: width1 * 0.04,
                maxline: 1,
                fontWeight: FontWeight.w400),
            const Expanded(
              child: CustomSizedBox(),
            ),
            CustomTextField(
              controller: authenticateTfcontroller,
              hint: AppString.authenticateHintText,
              raduis: 36,
              prefixIcon: Image.asset(AppAssets.perosn),
            ),
            const Expanded(
              child: CustomSizedBox(),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomTextButton(
                  buttonColor: AppColors.blueButton,
                  height: buttonHeith,
                  onTab: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBottomNavigationBar(),
                        ));
                  },
                  radius: 36,
                  buttonText: AppString.btnSaveSetting,
                  width: buttonWidth,
                  fontSize: GetScreenSize.getScreenWidth(context) * 0.05,
                )),
            const Expanded(child: CustomSizedBox()),
          ],
        ),
      ),
    ));
  }
}
