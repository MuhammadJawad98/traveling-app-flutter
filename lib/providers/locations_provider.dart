import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/models/locations_model.dart';

class LocationsProvider with ChangeNotifier {
  static List<LocationsModel> locations = [];
  List<LocationsModel> get getLocations => locations;
  void createArray() {
    locations = [
      LocationsModel(
          namelocation: 'Switzerland',
          price: 'from \$699  ',
          image:
              'https://media.istockphoto.com/id/636208094/photo/tropical-jungle.jpg?s=1024x1024&w=is&k=20&c=Zyc6mQ-VrbJIVjPOhrdzKlr6CpUdpcqT__bPJHJemXI=',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
          numberReviews: '4500',
          rating: '4.5'),
      LocationsModel(
          namelocation: 'Paris',
          price: 'from \$599',
          image:
              'https://images.unsplash.com/photo-1556609894-0ae309cb8354?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
          numberReviews: '45',
          rating: '4.5'),
      LocationsModel(
          namelocation: 'London',
          price: 'from \$899',
          image:
              'https://images.unsplash.com/photo-1603751721676-b27ee077d37f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=310&q=80',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
          numberReviews: '45',
          rating: '4.5'),
      LocationsModel(
          namelocation: 'Karachi',
          price: ' from \$09',
          image:
              'https://images.unsplash.com/photo-1497548637115-d2bc86a3c716?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG9vciUyMHBlb3BsZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
          numberReviews: '45',
          rating: '4.5'),
    ];
    notifyListeners();
  }
}
