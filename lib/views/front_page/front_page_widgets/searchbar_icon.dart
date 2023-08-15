import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';

class SearchBarBlueIcon extends StatefulWidget {
  final double height;
  final double width;
  final double radius;
  const SearchBarBlueIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.radius});

  @override
  State<SearchBarBlueIcon> createState() => _SearchBarBlueIconState();
}

class _SearchBarBlueIconState extends State<SearchBarBlueIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      //color: Colors.amber,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: AppColors.searchBarIconColor),
      child: Padding(
        padding: EdgeInsets.all(GetScreenSize.getScreenWidth(context) * 0.033),
        child: Image.asset(AppString.searchBarIcon),
      ),
    );
  }
}
