import 'package:flutter_booking_app/src/business_logic/models/hotel_info.dart';
import 'package:flutter_booking_app/src/business_logic/models/inspiration_title.dart';
import 'package:flutter_booking_app/src/business_logic/models/service_tag.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';

class ExampleData {
  List<HotelInfo> getHotelData() => [
        HotelInfo(
            name: 'Majorelle Hotel',
            image: 'assets/images/bp_hotel01.jpg',
            type: HotelType.HOTEL,
            distance: 1.4,
            price: 29,
            rating: 4.5,
            reviewers: 5378),
        HotelInfo(
            name: 'Hotel On Boat',
            image: 'assets/images/bp_hotel02.jpg',
            type: HotelType.HOTEL,
            distance: 2.3,
            price: 45,
            rating: 4.7,
            reviewers: 7093),
        HotelInfo(
            name: 'Cozumel Resort',
            image: 'assets/images/bp_hotel03.jpg',
            type: HotelType.RESORT,
            distance: 3.8,
            price: 49,
            rating: 4.8,
            reviewers: 8291),
        HotelInfo(
            name: 'DCondo Resort',
            image: 'assets/images/bp_hotel04.jpg',
            type: HotelType.RESORT,
            distance: 2.7,
            price: 32,
            rating: 4.6,
            reviewers: 6298),
      ];

  List<InspirationTitle> getInspiration() => [
        InspirationTitle(
            title: 'Top 5 Beatiful Beach',
            image: 'assets/images/bp_inspiration01.png',
            icon: 'assets/icons/home_screen/bp_umbrella_icon.svg',
            minutes: 10,
            type: InspirationType.BEACH),
        InspirationTitle(
            title: 'Top 10 Delicious Dinner',
            image: 'assets/images/bp_inspiration02.png',
            icon: 'assets/icons/detail_screen/bp_breakfast_icon.svg',
            minutes: 15,
            type: InspirationType.DINNER),
        InspirationTitle(
            title: 'A Wonderful Bedroom',
            image: 'assets/images/bp_thumbnail.png',
            icon: 'assets/icons/home_screen/bp_hotel_icon.svg',
            minutes: 7,
            type: InspirationType.BEDROOM),
      ];

  List<ServiceTag> getServiceTags() => [
        ServiceTag(
            name: 'Hotel',
            iconUrl: 'assets/icons/home_screen/bp_hotel_icon.svg',
            color: kTagHotelColor),
        ServiceTag(
            name: 'Rent',
            iconUrl: 'assets/icons/home_screen/bp_rent_icon.svg',
            color: kTagRentColor),
        ServiceTag(
            name: 'Flight',
            iconUrl: 'assets/icons/home_screen/bp_flight_icon.svg',
            color: kTagFlightColor),
        ServiceTag(
            name: 'Event',
            iconUrl: 'assets/icons/home_screen/bp_event_icon.svg',
            color: kTagEventColor),
      ];

  List<String> getNavigationIcon() => [
        'assets/icons/home_screen/bp_home_icon.svg',
        'assets/icons/home_screen/bp_favorite_icon.svg',
        'assets/icons/home_screen/bp_message_icon.svg',
        'assets/icons/home_screen/bp_info_icon.svg'
      ];

  List<ServiceTag> getAmenitiesTags() => [
        ServiceTag(
          name: 'Gym',
          iconUrl: 'assets/icons/detail_screen/bp_gym_icon.svg',
        ),
        ServiceTag(
          name: 'Breakfast',
          iconUrl: 'assets/icons/detail_screen/bp_breakfast_icon.svg',
        ),
        ServiceTag(
          name: 'Parking',
          iconUrl: 'assets/icons/detail_screen/bp_parking_icon.svg',
        ),
        ServiceTag(
          name: 'Bar',
          iconUrl: 'assets/icons/detail_screen/bp_bar_icon.svg',
        ),
        ServiceTag(
          name: 'More',
          iconUrl: 'assets/icons/detail_screen/bp_more_icon.svg',
        ),
      ];
}
