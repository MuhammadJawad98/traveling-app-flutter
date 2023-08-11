import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_sized_box.dart';

class MYRatingBar extends StatefulWidget {
  final double ratingValue;
  const MYRatingBar({super.key, required this.ratingValue});
  @override
  State<MYRatingBar> createState() => _MYRatingBarState();
}

class _MYRatingBarState extends State<MYRatingBar> {
  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      height: GetScreenSize.getScreenWidth(context) * 0.04,
      child: RatingBar.builder(
        initialRating: widget.ratingValue,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
        itemSize: GetScreenSize.getScreenWidth(context) * 0.04,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: AppColors.ratingStarsColor,
        ),
        onRatingUpdate: (rating) {},
        unratedColor: AppColors.unratedStarsColor,
      ),
    );
  }
}
