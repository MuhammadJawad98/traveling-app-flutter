import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/sociallink.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';
import 'package:traveling_app_flutter/views/friend_communication_page/widgets/social_link_tile.dart';
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
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
              Row(children: [
                Image(image: AssetImage(AppAssets.socialSaringtitle)),
                const CustomSizedBox(width: 5),
                CustomText(text: AppString.yoursociallinktitle, color: AppColors.talhablack, size: 22, maxline: 1, fontWeight: FontWeight.bold),
              ]),
              CustomText(text: AppString.yoursociallinksubtitle, color: AppColors.talhablack, size: 18, maxline: 2, fontWeight: FontWeight.w400),
              ListView.separated(
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
              CustomText(text: AppString.yoursociallinkbottomtext, color: AppColors.talhablack, size: 17, maxline: 2, fontWeight: FontWeight.w300)
            ]))));
  }
}
