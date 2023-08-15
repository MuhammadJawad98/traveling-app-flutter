class LocationsModel {
  final String namelocation;
  final String price;
  final String image;
  final String description;
  final String numberReviews;
  final String rating;
  final String time;
  final String wetherEmojy;
  LocationsModel(
      {this.time = "",
      this.wetherEmojy = "",
      this.namelocation = "",
      this.price = "",
      this.image = "",
      this.description = "",
      this.numberReviews = "",
      this.rating = ""});
}
