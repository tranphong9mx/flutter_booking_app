class HotelInfo {
  final String name, image;
  final double distance, rating, price;
  final int reviewers;
  final HotelType type;

  HotelInfo(
      {this.name,
      this.image,
      this.distance = 0.0,
      this.rating = 0.0,
      this.price = 20.0,
      this.type = HotelType.HOTEL,
      this.reviewers})
      : assert(name != null),
        assert(image != null);
}

enum HotelType { HOTEL, RESORT }
