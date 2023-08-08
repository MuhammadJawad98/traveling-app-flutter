import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/personal_center/widgets/top_bar_widget.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../utils/app_assets.dart';
import '../../widgets/custom_button.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInPageWidge extends StatelessWidget {
  SignInPageWidge({super.key});
  final TextEditingController controller = TextEditingController();
  final TextEditingController passowrTfcontroller = TextEditingController();
  final TextEditingController authenticateTfcontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    const double buttonWidth = double.infinity;
    final double buttonHeith = GetScreenSize.getScreenHeight(context) * 0.07;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 26, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(
                  iconData: Icons.arrow_back,
                  onTab: () {},
                  size: 28,
                ),
                const CustomSizedBox(
                  height: 27,
                ),
                ProfileTopBarWidget(
                    title: AppString.title, imgPath: AppAssets.prfileAvatar),
                const CustomSizedBox(
                  height: 27,
                ),
                CustomText(
                    text: AppString.emailText,
                    color: AppColors.screenTextColor,
                    size: 15,
                    maxline: 1,
                    fontWeight: FontWeight.w400),
                const CustomSizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: controller,
                  hint: "Enter Email",
                  raduis: 36,
                  prefixIcon: Image.asset(AppAssets.perosn),
                ),
                const CustomSizedBox(
                  height: 30,
                ),
                CustomText(
                    text: AppString.passwordText,
                    color: AppColors.screenTextColor,
                    size: 15,
                    maxline: 1,
                    fontWeight: FontWeight.w400),
                const CustomSizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passowrTfcontroller,
                  hint: "Enter Password",
                  raduis: 36,
                  obsecure: true,
                  prefixIcon: Image.asset(AppAssets.lock),
                  suffixIcon: CustomTextButton(
                    buttonColor: AppColors.blueButton,
                    height: GetScreenSize.getScreenHeight(context) * 0.02,
                    onTab: () {},
                    radius: 36,
                    buttonText: AppString.btnChange,
                    width: GetScreenSize.getScreenWidth(context) * 0.3,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                ),
                const CustomSizedBox(
                  height: 30,
                ),
                CustomText(
                    text: AppString.authenticateText,
                    color: AppColors.screenTextColor,
                    size: 15,
                    maxline: 1,
                    fontWeight: FontWeight.w400),
                const CustomSizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: authenticateTfcontroller,
                  hint: "Authenticate",
                  raduis: 36,
                  prefixIcon: Image.asset(AppAssets.perosn),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 41),
              child: CustomTextButton(
                buttonColor: AppColors.blueButton,
                height: buttonHeith,
                onTab: () {},
                radius: 36,
                buttonText: AppString.btnSaveSetting,
                width: buttonWidth,
                fontSize: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
