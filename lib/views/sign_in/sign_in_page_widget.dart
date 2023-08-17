import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/sign_in_provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/utils/helper_function.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/media_query.dart';
import '../../widgets/bottom_navigationbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class SignInPageScreenWidget extends StatefulWidget {
  const SignInPageScreenWidget({super.key});

  @override
  State<SignInPageScreenWidget> createState() => _SignInPageScreenWidgetState();
}

class _SignInPageScreenWidgetState extends State<SignInPageScreenWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    Provider.of<SignInProvider>(context, listen: false).cheeckVaidEmail(emailController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = GetScreenSize.getScreenWidth(context) * 0.8;
    final double buttonHeith = GetScreenSize.getScreenWidth(context) * 0.14;
    double width1 = GetScreenSize.getScreenWidth(context);

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          left: width1 * 0.08,
          right: width1 * 0.08,
          top: width1 * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomIconButton(
                      iconData: Icons.arrow_back,
                      onTab: () {
                        Navigator.pop(context);
                      },
                      size: width1 * 0.065),
                ),
                CustomSizedBox(
                  height: width1 * 0.04,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(text: AppString.loginText, color: Colors.black, size: 30, maxline: 1, fontWeight: FontWeight.w600),
                ),
                CustomSizedBox(
                  height: width1 * 0.04,
                ),
                CustomTextField(
                  controller: emailController,
                  hint: AppString.hintEmailText,
                  raduis: 36,
                  erroText: AppString.invalidEmail,
                  isValid: Provider.of<SignUpProvider>(context, listen: true).isValidEmail,
                  prefixIcon: Image.asset(AppAssets.message),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  hint: AppString.hintPasswordText,
                  raduis: 36,
                  obsecure: true,
                  prefixIcon: Image.asset(AppAssets.lock),
                  erroText: AppString.invalidPasswordHint,
                  isValid: Provider.of<SignUpProvider>(context, listen: true).isValidPassword,
                ),
                CustomSizedBox(
                  height: width1 * 0.05,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: AppColors.dividerColor,
                      ),
                    ),
                    CustomText(text: AppString.dividerText, color: Colors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.w400),
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

  void onTabContinue() {
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();
    var signinemail = Provider.of<SignUpProvider>(context, listen: false).isValidEmail;
    var signinpassword = Provider.of<SignUpProvider>(context, listen: false).isValidPassword;
    if (email.isEmpty || signinemail == false) {
      AppCommonFunctions.showToast("Please use correctEmail", context);
    } else if (pass.isEmpty || signinpassword == false) {
      AppCommonFunctions.showToast("Please use correctPass", context);
    } else {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.toString(), password: pass.toString())
          .then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBottomNavigationBar())).onError(
                (error, stackTrace) => AppCommonFunctions.showToast(error.toString(), context),
              ));
    }
  }
}
