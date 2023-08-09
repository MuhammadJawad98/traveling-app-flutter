import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_sized_box.dart';
import 'star_widget.dart';

class HotelTile extends StatelessWidget {
  final BuildContext context;
  final String name;
  final int starCount;
  const HotelTile(
      {super.key,
      required this.context,
      required this.name,
      required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetScreenSize.getScreenHeight(context) * 0.25,
      width: double.maxFinite,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(Constants.transportationScreenImage),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomSizedBox(
              height: GetScreenSize.getScreenHeight(context) * 0.01,
            ),
            StarDisplayScreen(
              numberOfImages: starCount,
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
