import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

class MySearchBar extends StatefulWidget {
  final double height;
  final double width1;
  const MySearchBar({
    super.key,
    required this.height,
    required this.width1,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width1,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color.fromRGBO(233, 233, 233, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(GetScreenSize.getScreenWidth(context) * 0.009),
        child: TextField(
          style: TextStyle(
              fontSize: GetScreenSize.getScreenWidth(context) *
                  0.04), // Set font size for entered text
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: GetScreenSize.getScreenWidth(context) * 0.07,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
                fontSize: GetScreenSize.getScreenWidth(context) *
                    0.04), // Set font size for hint text
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
