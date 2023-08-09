import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class SignInPageScreenWidget extends StatefulWidget {
  SignInPageScreenWidget({super.key});

  @override
  State<SignInPageScreenWidget> createState() => _SignInPageScreenWidgetState();
}

class _SignInPageScreenWidgetState extends State<SignInPageScreenWidget> {
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    Provider.of<SignInProvider>(context, listen: false)
        .cheeckVaidEmail(emailController);
    super.initState();
  }

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
                    text: AppString.loginText,
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
                  hint: AppString.hintEmailText,
                  raduis: 36,
                  erroText: AppString.invalidEmail,
                  isValid: Provider.of<SignInProvider>(context, listen: true)
                      .isValidEmail,
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
                const CustomSizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  buttonColor: AppColors.facebookColorButton,
                  height: buttonHeith,
                  addIcon: true,
                  icon: const Icon(Icons.facebook, color: Colors.white),
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
                onTab: () {
                  onTabContinue();
                },
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

  void onTabContinue() {}
}
