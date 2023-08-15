import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/constants.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

class StarDisplayScreen extends StatelessWidget {
  final int numberOfImages;
  final BuildContext context;
  const StarDisplayScreen({super.key, required this.numberOfImages, required this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: _buildImagesList(),
    );
  }

  List<Widget> _buildImagesList() {
    List<Widget> imagesList = [];
    for (int i = 0; i < numberOfImages; i++) {
      imagesList.add(Image(
        image: AssetImage(Constants.transportationScreenStar), // Replace with your image path
        width: GetScreenSize.getScreenWidth(context) * 0.05, // Adjust the width as needed
        height: 15, // Adjust the height as needed
      ));
    }
    return imagesList;
  }
}
