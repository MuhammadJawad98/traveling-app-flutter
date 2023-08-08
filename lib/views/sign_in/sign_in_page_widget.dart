import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class SignInPageScreenWidget extends StatelessWidget {
  SignInPageScreenWidget({super.key});
  final TextEditingController emailController = TextEditingController();

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
                CustomText(
                    text: AppString.signUpfreeText,
                    color: Colors.black,
                    size: 30,
                    maxline: 1,
                    fontWeight: FontWeight.w600),
                const CustomSizedBox(
                  height: 27,
                ),
                const CustomSizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: emailController,
                  hint: "Enter Email",
                  raduis: 36,
                  prefixIcon: Image.asset(AppAssets.message),
                ),
                const CustomSizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: AppColors.dividerColor,
                      ),
                    ),
                    CustomText(
                        text: AppString.dividerText,
                        color: Colors.black,
                        size: GetScreenSize.getScreenWidth(context) * 0.04,
                        maxline: 1,
                        fontWeight: FontWeight.w400),
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: AppColors.dividerColor,
                      ),
                    )
                  ],
                ),
                const CustomSizedBox(
                  height: 30,
                ),
                CustomTextButton(
                  buttonColor: AppColors.blackColorButton,
                  height: buttonHeith,
                  onTab: () {},
                  addIcon: true,
                  icon: Image.asset(AppAssets.applelogo),
                  radius: 36,
                  buttonText: AppString.btnApple,
                  width: buttonWidth,
                  fontSize: GetScreenSize.getScreenWidth(context) * 0.05,
                ),
                CustomSizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  buttonColor: AppColors.facebookColorButton,
                  height: buttonHeith,
                  addIcon: true,
                  icon: Image.asset(AppAssets.facebooklogo),
                  onTab: () {},
                  radius: 36,
                  buttonText: AppString.btnFacebook,
                  width: buttonWidth,
                  fontSize: GetScreenSize.getScreenWidth(context) * 0.05,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 41),
              child: CustomTextButton(
                buttonColor: AppColors.blueButton,
                height: buttonHeith,
                onTab: () {},
                radius: 36,
                buttonText: AppString.btnContinue,
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
