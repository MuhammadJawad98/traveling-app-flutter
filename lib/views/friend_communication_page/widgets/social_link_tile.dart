// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/sociallink.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class SocialLinkTile extends StatefulWidget {
  SocialLink data;
  SocialLinkTile({super.key, required this.data});

  @override
  State<SocialLinkTile> createState() => _SocialLinkTileState();
}

class _SocialLinkTileState extends State<SocialLinkTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        decoration: ShapeDecoration(color: AppColors.talhacontainerwhite, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Center(
            child: ListTile(
          leading: CircleAvatar(radius: 25, backgroundColor: AppColors.talhawhite, child: Image(image: AssetImage(widget.data.image))),
          title: CustomText(text: widget.data.title, color: AppColors.talhablack, size: 16, maxline: 1, fontWeight: FontWeight.bold),
          subtitle: CustomText(text: widget.data.subtitle, color: AppColors.talhagrey, size: 16, maxline: 1, fontWeight: FontWeight.w400),
        )));
  }
}
