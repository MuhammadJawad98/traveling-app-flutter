import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/locations_model.dart';

class UploadLocationsProvider extends ChangeNotifier {
  List<LocationsModel> locationsList = [];
  List<LocationsModel> get getLocationsList => locationsList;
  Future<void> fetchLocationsData() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('locations').get();
      final List<LocationsModel> locations = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return LocationsModel(
          namelocation: data['name'],
          price: data['price'],
          image: data['imageUrl'],
          description: data['description'],
          rating: data['rating'],
        );
      }).toList();
      locationsList = locations;
      notifyListeners();
    } catch (error) {
      print("Error fetching locations data: $error");
    }
  }
}
