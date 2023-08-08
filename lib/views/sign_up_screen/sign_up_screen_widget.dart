import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/views/sign_up_screen/widgets/custom_rich_text.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreenWidget extends StatelessWidget {
  final TextEditingController emailTfController = TextEditingController();
  final TextEditingController passwordTfController = TextEditingController();
  final TextEditingController confirmPasswordTfController =
      TextEditingController();
  SignUpScreenWidget({super.key});

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
                  controller: emailTfController,
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
                  controller: passwordTfController,
                  hint: "Enter Password",
                  raduis: 36,
                  obsecure: true,
                  prefixIcon: Image.asset(AppAssets.lock),
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
                  controller: confirmPasswordTfController,
                  hint: "Confirm Password",
                  raduis: 36,
                  prefixIcon: Image.asset(AppAssets.perosn),
                ),
                const CustomSizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Image.asset(AppAssets.richTexticon),
                    const CustomSizedBox(
                      width: 10,
                    ),
                    CustomRichText(
                        text: AppString.termsOfServicesPart1,
                        defaultStyle: const TextStyle(color: Colors.black),
                        textSpans: [
                          TextSpan(
                              text: AppString.termsOfServicesPart2,
                              style:
                                  const TextStyle(color: AppColors.blueButton))
                        ])
                  ],
                )
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
