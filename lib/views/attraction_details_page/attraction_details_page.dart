import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../utils/media_query.dart';

class AttractionDetailsPage extends StatefulWidget {
  final LocationsModel data;
  const AttractionDetailsPage({super.key, required this.data});

  @override
  State<AttractionDetailsPage> createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double ratingValue =
        double.parse(widget.data.rating); // Convert string to double

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: GetScreenSize.getScreenHeight(context),
            width: GetScreenSize.getScreenWidth(context),
            child: Image.network(
              widget.data.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                GetScreenSize.getScreenWidth(context) * 0.05,
                GetScreenSize.getScreenHeight(context) * 0.60,
                GetScreenSize.getScreenWidth(context) * 0.05,
                0),
            child: CustomText(
                text: widget.data.description,
                color: Colors.white70,
                size: 16,
                maxline: 20,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                GetScreenSize.getScreenWidth(context) * 0.05,
                GetScreenSize.getScreenHeight(context) * 0.53,
                GetScreenSize.getScreenWidth(context) * 0.05,
                0),
            child: CustomText(
                text: widget.data.namelocation,
                color: Colors.white70,
                size: 42,
                maxline: 20,
                fontWeight: FontWeight.w500),
          ),
          Positioned(
            top: GetScreenSize.getScreenHeight(context) * 0.75,
            left: GetScreenSize.getScreenWidth(context) * 0.07,
            right: GetScreenSize.getScreenWidth(context) * 0.05,
            child: SizedBox(
              height: 40,
              child: RatingBar.builder(
                initialRating: ratingValue,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemSize: 30,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
                unratedColor: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
