import 'package:flutter/material.dart';
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
          Container(
            height: GetScreenSize.getScreenHeight(context) * 0.2,
            width: GetScreenSize.getScreenWidth(context) * 0.6,
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
            padding: EdgeInsets.fromLTRB(35.0, 80, 0, 0),
            child: CustomText(
              text: widget.user.namelocation,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 22,
              maxline: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            // Add padding to the right side
            padding: EdgeInsets.fromLTRB(35.0, 110, 0, 0),
            child: CustomText(
              text: widget.user.price,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 12,
              maxline: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
