import 'package:traveling_app_flutter/utils/app_assets.dart';

class Person {
  final String name;
  final String profession;
  final String image;

  Person({
    required this.name,
    required this.profession,
    required this.image,
  });
}

List<Person> person = [
  Person(name: 'Charlotte', profession: 'Chief Travel Experiencer', image: AppAssets.image2),
  Person(name: 'Evangeline', profession: 'Chief Travel Experiencer', image: AppAssets.image3),
  Person(name: 'Geraldine', profession: 'Private tour guide', image: AppAssets.image4),
  Person(name: 'Prudence', profession: 'Travel youtube master', image: AppAssets.image5),
];
