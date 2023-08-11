import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/person_model.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/views/friend_communication_page/widgets/fC_tile_desgin.dart';
import 'package:traveling_app_flutter/views/sign_in/sign_in_page_widget.dart';
import 'package:traveling_app_flutter/views/yourSocialLink/your_social_link.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';
import '../../utils/media_query.dart';

class FriendCommunicatioPage extends StatefulWidget {
  const FriendCommunicatioPage({super.key});

  @override
  State<FriendCommunicatioPage> createState() => _FriendCommunicatioPageState();
}

class _FriendCommunicatioPageState extends State<FriendCommunicatioPage> {
  List<Person> person = [
    Person(name: 'Charlotte', profession: 'Chief Travel Experiencer', image: AppAssets.image2),
    Person(name: 'Evangeline', profession: 'Chief Travel Experiencer', image: AppAssets.image3),
    Person(name: 'Geraldine', profession: 'Private tour guide', image: AppAssets.image4),
    Person(name: 'Prudence', profession: 'Travel youtube master', image: AppAssets.image5),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(top: 55, left: 15, bottom: 18),
          child: CustomText(
              text: AppString.fCPtitle,
              color: AppColors.talhablack,
              size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.07 : GetScreenSize.getScreenWidth(context) * 0.05,
              maxline: 1,
              fontWeight: FontWeight.bold)),
      ListTile(
          leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(AppAssets.image1)),
          title: CustomText(
              text: AppString.fCPprofiletitle,
              color: AppColors.talhablack,
              size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.05 : GetScreenSize.getScreenWidth(context) * 0.032,
              maxline: 1,
              fontWeight: FontWeight.bold),
          subtitle: CustomText(
              text: AppString.fCPsubtitletitle,
              color: AppColors.talhagrey,
              size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.042 : GetScreenSize.getScreenWidth(context) * 0.028,
              maxline: 1,
              fontWeight: FontWeight.w400),
          trailing: CustomTextButton(
              height: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenHeight(context) * 0.085 : GetScreenSize.getScreenHeight(context) * 0.09,
              fontColor: AppColors.talhawhite,
              width: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.27 : GetScreenSize.getScreenWidth(context) * 0.18,
              onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const YourSociallinkPage())),
              buttonText: AppString.fCPcardtext,
              buttonColor: AppColors.talhablue,
              radius: 25,
              fontSize: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.03 : GetScreenSize.getScreenWidth(context) * 0.02)),
      ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(child: FCtileDesgin(data: person[index]));
          },
          itemCount: person.length,
          separatorBuilder: (context, index) => const Divider(indent: 24, endIndent: 22)),
      const Divider(indent: 24, endIndent: 22),
      Padding(
          padding: const EdgeInsets.only(top: 20, left: 30),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPageScreenWidget(),
                )),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.logout,
                  color: AppColors.talhablue,
                  size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.06 : GetScreenSize.getScreenWidth(context) * 0.04),
              CustomText(
                  text: AppString.fCPlogout,
                  color: AppColors.talhablue,
                  size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.045 : GetScreenSize.getScreenWidth(context) * 0.03,
                  maxline: 1,
                  fontWeight: FontWeight.bold)
            ]),
          ))
    ]));
  }
}
