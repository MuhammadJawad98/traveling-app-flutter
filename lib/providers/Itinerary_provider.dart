import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';
import 'package:traveling_app_flutter/utils/app_strings.dart';

class ItineraryProvider extends ChangeNotifier {
  List<LocationsModel> locations = AppString.locationsList;
}
