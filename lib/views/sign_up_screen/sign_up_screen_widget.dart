import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/sign_up_provider.dart';
import 'package:traveling_app_flutter/utils/helper_function.dart';
import 'package:traveling_app_flutter/views/front_page/front_page.dart';
import 'package:traveling_app_flutter/views/sign_in/sign_in_page_widget.dart';
import 'package:traveling_app_flutter/views/sign_up_screen/widgets/custom_rich_text.dart';
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

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({super.key});

  @override
  State<SignUpScreenWidget> createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final TextEditingController emailTfController = TextEditingController();
  final TextEditingController passwordTfController = TextEditingController();
  final TextEditingController confirmPasswordTfController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    Provider.of<SignUpProvider>(context, listen: false).cheeckVaidEmail(emailTfController);
    Provider.of<SignUpProvider>(context, listen: false).cheeckVaidPassword(passwordTfController);
    super.initState();
    Provider.of<SignUpProvider>(context, listen: false).checkConfirmPasswordPassword(passwordTfController, confirmPasswordTfController);
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
    //
    double width1 = GetScreenSize.getScreenWidth(context);
    AppCommonFunctions.printLogs("getScreenSize: ${GetScreenSize.getScreenSize(context)}");
    AppCommonFunctions.printLogs("getScreenHeight: ${GetScreenSize.getScreenHeight(context)}");
    AppCommonFunctions.printLogs("getScreenWidth: ${GetScreenSize.getScreenWidth(context)}");
    double buttonWidth = GetScreenSize.getScreenWidth(context) * 0.8;
    final double buttonHeith = GetScreenSize.getScreenWidth(context) * 0.12;
    return SafeArea(
      child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: EdgeInsets.only(
                  left: width1 * 0.08,
                  right: width1 * 0.08,
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: [
                  const Expanded(child: CustomSizedBox()),
                  CustomIconButton(
                      iconData: Icons.arrow_back,
                      onTab: () {
                        Navigator.pop(context);
                      },
                      size: width1 * 0.065),
                  // CustomSizedBox(height: width1 * 0.05),
                  const Expanded(child: CustomSizedBox()),
                  CustomText(text: AppString.signUpfreeText, color: Colors.black, size: GetScreenSize.getScreenWidth(context) * 0.07, maxline: 1, fontWeight: FontWeight.w600),
                  CustomSizedBox(height: width1 * 0.05),
                  CustomText(text: AppString.emailText, color: AppColors.screenTextColor, size: width1 * 0.03, maxline: 1, fontWeight: FontWeight.w400),
                  CustomSizedBox(height: width1 * 0.02),
                  CustomTextField(
                    controller: emailTfController,
                    hint: AppString.hintEmailText,
                    raduis: 36,
                    prefixIcon: Image.asset(AppAssets.perosn),
                    erroText: AppString.invalidEmail,
                    isValid: Provider.of<SignUpProvider>(context, listen: true).isValidEmail,
                  ),
                  CustomSizedBox(height: width1 * 0.05),
                  CustomText(text: AppString.passwordText, color: AppColors.screenTextColor, size: width1 * 0.03, maxline: 1, fontWeight: FontWeight.w400),
                  CustomSizedBox(height: width1 * 0.02),
                  CustomTextField(
                    controller: passwordTfController,
                    hint: AppString.hintPasswordText,
                    raduis: 36,
                    obsecure: true,
                    prefixIcon: Image.asset(AppAssets.lock),
                    erroText: AppString.invalidPasswordHint,
                    isValid: Provider.of<SignUpProvider>(context, listen: true).isValidPassword,
                  ),
                  CustomSizedBox(height: width1 * 0.05),
                  CustomText(text: AppString.confirmPasswordText, color: AppColors.screenTextColor, size: width1 * 0.03, maxline: 1, fontWeight: FontWeight.w400),
                  CustomSizedBox(height: width1 * 0.02),
                  CustomTextField(controller: confirmPasswordTfController, hint: AppString.hintConfirmPasswordText, raduis: 36, prefixIcon: Image.asset(AppAssets.perosn)),
                  CustomSizedBox(height: width1 * 0.03),
                  Row(children: [
                    Image.asset(AppAssets.richTexticon, width: width1 * 0.04),
                    const CustomSizedBox(width: 10),
                    Expanded(
                      child: CustomRichText(
                          text: AppString.termsOfServicesPart1,
                          defaultStyle: TextStyle(
                            color: Colors.black,
                            fontSize: width1 * 0.03,
                          ),
                          textSpans: [
                            TextSpan(
                                text: AppString.termsOfServicesPart2,
                                style: const TextStyle(
                                  color: AppColors.blueButton,
                                ))
                          ]),
                    )
                  ]),
                  Expanded(child: CustomSizedBox()),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomTextButton(
                        buttonColor: AppColors.blueButton,
                        height: buttonHeith,
                        onTab: () {
                          onTabConfirm();
                        },
                        radius: 36,
                        buttonText: AppString.btnContinue,
                        width: buttonWidth,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.05,
                      )),
                  const Expanded(
                    child: CustomSizedBox(),
                  )
                ]),
              ))),
    );
  }

  void onTabConfirm() {
    var email = emailTfController.text.trim();
    var password = passwordTfController.text.trim();
    var signupemail = Provider.of<SignUpProvider>(context, listen: false).isValidEmail;
    var signuppassword = Provider.of<SignUpProvider>(context, listen: false).isValidPassword;
    var signuppasscnfrm = confirmPasswordTfController.text.trim();
    if (signupemail == false) {
      AppCommonFunctions.showToast("Enter correct email", context);
    } else if (signuppassword == false) {
      AppCommonFunctions.showToast("Enter correct pass", context);
    } else if (signuppasscnfrm.isEmpty || passwordTfController.text != signuppasscnfrm) {
      AppCommonFunctions.showToast("Pass doesnot match", context);
    } else {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(), password: password.toString()).then(
        (value) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => MyBottomNavigationBar(
                        userid: FirebaseAuth.instance.currentUser!.uid,
                      )),
              (Route<dynamic> route) => false);
          _firestore.collection("SignUp").doc(FirebaseAuth.instance.currentUser!.uid).set({
            'cnfrm': signuppasscnfrm,
            'email': email,
            'password': password,
          });
        },
      ).onError(
        (error, stackTrace) {
          // Provider.of<DataProvider>(context, listen: false).showSnackbar(context, "Account Registor");
        },
      );
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPageScreenWidget()));
  }
}
