import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/person_model.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/views/friend_communication_page/widgets/fC_tile_desgin.dart';
import 'package:traveling_app_flutter/views/friend_communication_page/your_social_link.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../utils/media_query.dart';

class FriendCommunicatioPage extends StatefulWidget {
  const FriendCommunicatioPage({super.key});

  @override
  State<FriendCommunicatioPage> createState() => _FriendCommunicatioPageState();
}

class _FriendCommunicatioPageState extends State<FriendCommunicatioPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(top: 43, left: 15, bottom: 18), child: CustomText(text: AppString.fCPtitle, color: AppColors.talhablack, size: 24, maxline: 1, fontWeight: FontWeight.bold)),
      ListTile(
          leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(AppAssets.image1)),
          title: CustomText(text: AppString.fCPprofiletitle, color: AppColors.talhablack, size: 16, maxline: 1, fontWeight: FontWeight.bold),
          subtitle: CustomText(text: AppString.fCPsubtitletitle, color: AppColors.talhagrey, size: 16, maxline: 1, fontWeight: FontWeight.w400),
          trailing: CustomTextButton(
              height: GetScreenSize.getScreenHeight(context) * 0.06,
              textcolor: AppColors.talhawhite,
              width: GetScreenSize.getScreenWidth(context) * 0.26,
              onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const YourSociallinkPage())),
              buttonText: AppString.fCPcardtext,
              buttonColor: AppColors.talhablue,
              radius: 25,
              fontSize: 12)),
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.logout, color: AppColors.talhablue), CustomText(text: AppString.fCPlogout, color: AppColors.talhablue, size: 13, maxline: 1, fontWeight: FontWeight.bold)]))
    ]));
  }
}
