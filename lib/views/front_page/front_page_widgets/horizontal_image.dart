import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class HorizontalImage extends StatefulWidget {
  final LocationsModel user;
  const HorizontalImage({super.key, required this.user});

  @override
  State<HorizontalImage> createState() => _HorizontalImageState();
}

class _HorizontalImageState extends State<HorizontalImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), //color: Colors.red
        ),
        child: Stack(
          children: [
            Container(
              height: GetScreenSize.getScreenHeight(context) * 0.24,
              width: GetScreenSize.getScreenWidth(context) * 0.40,
              child: ClipRRect(
                // Wrap the Image.network with ClipRRect to make the edges circular
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.user.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              // Add padding to the right side
              padding: EdgeInsets.fromLTRB(10.0, 120, 0, 0),
              child: CustomText(
                text: widget.user.namelocation,
                color: AppColors.textOnImagesColor,
                size: 18,
                maxline: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              // Add padding to the right side
              padding: EdgeInsets.fromLTRB(10.0, 145, 0, 0),
              child: CustomText(
                text: widget.user.price,
                color: AppColors.textOnImagesColor,
                size: 12,
                maxline: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
