import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../../models/locations_model.dart';
import '../../../utils/media_query.dart';

class VerticalImage extends StatefulWidget {
  final LocationsModel user;
  const VerticalImage({super.key, required this.user});

  @override
  State<VerticalImage> createState() => _VerticalImageState();
}

class _VerticalImageState extends State<VerticalImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          SizedBox(
            height: GetScreenSize.getScreenWidth(context) * 1.6,
            width: GetScreenSize.getScreenWidth(context) * 0.65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                // Wrap the Image.network with ClipRRect to make the edges circular
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.user.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            // Add padding to the right side
            padding: EdgeInsets.fromLTRB(
                GetScreenSize.getScreenWidth(context) * 0.05,
                GetScreenSize.getScreenWidth(context) * 0.25,
                0,
                0),
            child: CustomText(
              text: widget.user.namelocation,
              color: AppColors.textOnImagesColor,
              size: GetScreenSize.getScreenWidth(context) * 0.06,
              maxline: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            // Add padding to the right side
            padding: EdgeInsets.fromLTRB(
                GetScreenSize.getScreenWidth(context) * 0.05,
                GetScreenSize.getScreenWidth(context) * 0.33,
                0,
                0),
            child: CustomText(
              text: widget.user.price,
              color: AppColors.textOnImagesColor,
              size: GetScreenSize.getScreenWidth(context) * 0.0378,
              maxline: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
