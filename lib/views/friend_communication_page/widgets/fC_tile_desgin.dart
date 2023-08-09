// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/person_model.dart';

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
    return Container(
      width: double.infinity,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(widget.data.image),
        ),
        title: CustomText(text: widget.data.name, color: AppColors.talhablack, size: 16, maxline: 1, fontWeight: FontWeight.bold),
        subtitle: CustomText(text: widget.data.profession, color: AppColors.talhagrey, size: 16, maxline: 1, fontWeight: FontWeight.w400),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
