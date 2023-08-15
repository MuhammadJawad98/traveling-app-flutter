import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/app_assets.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';

class PricingPlan {
  final String heading;
  final String subtitle;
  final String image;
  final Color avatorcolor;

  PricingPlan({required this.heading, required this.subtitle, required this.image, required this.avatorcolor});
}

List<PricingPlan> planpricinglist = [
  PricingPlan(heading: "Flights", subtitle: "from \$199", image: AppAssets.planimg, avatorcolor: AppColors.plancolor),
  PricingPlan(heading: "Hotels", subtitle: "from \$199/ night", image: AppAssets.buildingimg, avatorcolor: AppColors.buildingcolor)
];
