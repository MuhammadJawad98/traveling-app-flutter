import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/app_colors.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_sized_box.dart';

class MYRatingBar extends StatefulWidget {
  final double ratingValue;
  final double minRating;
  final double itemPadding;
  final int itemCount;
  final double itemSize;

  const MYRatingBar({
    super.key,
    required this.minRating,
    required this.ratingValue,
    required this.itemPadding,
    required this.itemCount,
    required this.itemSize,
  });
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
        minRating: widget.minRating,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: widget.itemCount,
        itemPadding: EdgeInsets.symmetric(horizontal: widget.itemPadding),
        itemSize: widget.itemSize,
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
