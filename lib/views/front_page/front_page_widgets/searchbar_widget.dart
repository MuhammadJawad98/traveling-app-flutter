import 'package:flutter/material.dart';

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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
