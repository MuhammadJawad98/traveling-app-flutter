// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/person_model.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class FCtileDesgin extends StatefulWidget {
  Person data;
  FCtileDesgin({super.key, required this.data});

  @override
  State<FCtileDesgin> createState() => _FCtileDesginState();
}

class _FCtileDesginState extends State<FCtileDesgin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(widget.data.image),
        ),
        title: CustomText(
            text: widget.data.name,
            color: AppColors.talhablack,
            size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.048 : GetScreenSize.getScreenWidth(context) * 0.03,
            maxline: 1,
            fontWeight: FontWeight.bold),
        subtitle: CustomText(
            text: widget.data.profession,
            color: AppColors.talhagrey,
            size: GetScreenSize.getScreenOrienation(context) == Orientation.portrait ? GetScreenSize.getScreenWidth(context) * 0.042 : GetScreenSize.getScreenWidth(context) * 0.025,
            maxline: 1,
            fontWeight: FontWeight.w400),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
