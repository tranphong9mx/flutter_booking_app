class InspirationTitle {
  final String icon, title, image;
  final int minutes;
  final InspirationType type;
  InspirationTitle(
      {this.icon,
      this.title,
      this.minutes = 0,
      this.type = InspirationType.TRAVEL,
      this.image})
      : assert(icon != null),
        assert(title != null),
        assert(image != null);
  String getType(InspirationType type) {
    switch (type) {
      case InspirationType.TRAVEL:
        return 'Travel';
        break;
      case InspirationType.BEACH:
        return 'Beach';
        break;
      case InspirationType.BEDROOM:
        return 'Bedroom';
        break;
      case InspirationType.DINNER:
        return 'Dinner';
        break;
      default:
        return 'Unknow';
        break;
    }
  }
}

enum InspirationType { TRAVEL, BEACH, BEDROOM, DINNER }
