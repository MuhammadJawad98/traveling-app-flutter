import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/utils/helper_function.dart';
import 'package:traveling_app_flutter/views/sign_in/sign_in_page_widget.dart';
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

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({super.key});

  @override
  State<SignUpScreenWidget> createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final TextEditingController emailTfController = TextEditingController();
  final TextEditingController passwordTfController = TextEditingController();

  final TextEditingController confirmPasswordTfController =
      TextEditingController();

  @override
  void initState() {
    Provider.of<SignUpProvider>(context, listen: false)
        .cheeckVaidEmail(emailTfController);
    Provider.of<SignUpProvider>(context, listen: false)
        .cheeckVaidPassword(passwordTfController);
    super.initState();
    Provider.of<SignUpProvider>(context, listen: false)
        .checkConfirmPasswordPassword(
            passwordTfController, confirmPasswordTfController);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    confirmPasswordTfController.dispose();
    emailTfController.dispose();
    passwordTfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppCommonFunctions.printLogs(
        "getScreenSize: ${GetScreenSize.getScreenSize(context)}");
    AppCommonFunctions.printLogs(
        "getScreenHeight: ${GetScreenSize.getScreenHeight(context)}");
    AppCommonFunctions.printLogs(
        "getScreenWidth: ${GetScreenSize.getScreenWidth(context)}");
    double buttonWidth = GetScreenSize.getScreenWidth(context) * 0.8;
    final double buttonHeith = GetScreenSize.getScreenWidth(context) * 0.14;
    return SafeArea(
        child: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                              size: 28),
                          const CustomSizedBox(height: 27),
                          CustomText(
                              text: AppString.signUpfreeText,
                              color: Colors.black,
                              size: 30,
                              maxline: 1,
                              fontWeight: FontWeight.w600),
                          const CustomSizedBox(height: 27),
                          CustomText(
                              text: AppString.emailText,
                              color: AppColors.screenTextColor,
                              size: 15,
                              maxline: 1,
                              fontWeight: FontWeight.w400),
                          const CustomSizedBox(height: 10),
                          CustomTextField(
                            controller: emailTfController,
                            hint: AppString.hintEmailText,
                            raduis: 36,
                            prefixIcon: Image.asset(AppAssets.perosn),
                            erroText: AppString.invalidEmail,
                            isValid: Provider.of<SignUpProvider>(context,
                                    listen: true)
                                .isValidEmail,
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
                          const CustomSizedBox(height: 10),
                          CustomTextField(
                            controller: passwordTfController,
                            hint: AppString.hintPasswordText,
                            raduis: 36,
                            obsecure: true,
                            prefixIcon: Image.asset(AppAssets.lock),
                            erroText: AppString.invalidPasswordHint,
                            isValid: Provider.of<SignUpProvider>(context,
                                    listen: true)
                                .isValidPassword,
                          ),
                          const CustomSizedBox(height: 30),
                          CustomText(
                              text: AppString.confirmPasswordText,
                              color: AppColors.screenTextColor,
                              size: 15,
                              maxline: 1,
                              fontWeight: FontWeight.w400),
                          const CustomSizedBox(height: 10),
                          CustomTextField(
                              controller: confirmPasswordTfController,
                              hint: AppString.hintConfirmPasswordText,
                              raduis: 36,
                              prefixIcon: Image.asset(AppAssets.perosn)),
                          const CustomSizedBox(height: 30),
                          Row(children: [
                            Image.asset(AppAssets.richTexticon),
                            const CustomSizedBox(width: 10),
                            CustomRichText(
                                text: AppString.termsOfServicesPart1,
                                defaultStyle:
                                    const TextStyle(color: Colors.black),
                                textSpans: [
                                  TextSpan(
                                      text: AppString.termsOfServicesPart2,
                                      style: const TextStyle(
                                          color: AppColors.blueButton))
                                ])
                          ])
                        ]),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 41),
                        child: CustomTextButton(
                          buttonColor: AppColors.blueButton,
                          height: buttonHeith,
                          onTab: () {
                            onTabConfirm();
                          },
                          radius: 36,
                          buttonText: AppString.btnContinue,
                          width: buttonWidth,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.05,
                        ))
                  ]))),
    ));
  }

  void onTabConfirm() {
    String email = emailTfController.text.trim();
    String password = passwordTfController.text.trim();
    String confirmPassword = confirmPasswordTfController.text.trim();
    if (email.isEmpty) {
      AppCommonFunctions.showToast(AppString.emptyEmailText, context);
    }
    if (password.isEmpty) {
      AppCommonFunctions.showToast(AppString.emptyPasswordText, context);
    }
    if (confirmPassword.isEmpty) {
      AppCommonFunctions.showToast(AppString.emptyConfirmPasswordText, context);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SignInPageScreenWidget()));
    }
  }
}
