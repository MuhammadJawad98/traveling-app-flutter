import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/sociallink.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/yourSocialLink/widget/social_link_tile.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

class YourSociallinkPage extends StatefulWidget {
  const YourSociallinkPage({super.key});

  @override
  State<YourSociallinkPage> createState() => _YourSociallinkPageState();
}

class _YourSociallinkPageState extends State<YourSociallinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back)),
              Row(children: [
                Image(image: AssetImage(AppAssets.socialSaringtitle)),
                const CustomSizedBox(width: 14),
                CustomText(
                    text: AppString.yoursociallinktitle,
                    color: AppColors.talhablack,
                    size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.06 : GetScreenSize.getScreenWidth(context) * 0.03,
                    maxline: 1,
                    fontWeight: FontWeight.bold),
              ]),
              CustomText(
                  text: AppString.yoursociallinksubtitle,
                  color: AppColors.talhagrey,
                  size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.049 : GetScreenSize.getScreenWidth(context) * 0.03,
                  maxline: 2,
                  fontWeight: FontWeight.w300),
              ListView.separated(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SocialLinkTile(data: social[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const CustomSizedBox(height: 5);
                  },
                  itemCount: social.length),
              const CustomSizedBox(height: 10),
              CustomText(
                  text: AppString.yoursociallinkbottomtext,
                  color: AppColors.talhablack,
                  size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.044 : GetScreenSize.getScreenWidth(context) * 0.025,
                  maxline: 2,
                  fontWeight: FontWeight.w300)
            ]))));
  }
}
