import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/models/hotel_info.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingCard extends StatelessWidget {
  BookingCard(this.hotel);
  final HotelInfo hotel;

  static const _LOADING_IMAGE = 'assets/images/bp_loading.gif';
  static const _BOOKMARK_ICON = 'assets/icons/home_screen/bp_bookmark_icon.svg';
  static const _LOCATION_ICON = 'assets/icons/home_screen/bp_location_icon.svg';
  static const _STAR_ICON = 'assets/icons/home_screen/bp_star_icon.svg';

  @override
  Widget build(BuildContext context) {
    final _bodTitleTextStyle = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w500);
    final _bodBody2TextStyle = Theme.of(context).textTheme.bodyText2;
    final _bodBody1TextStyle = Theme.of(context).textTheme.bodyText1;

    return Container(
        width: 248,
        height: 268,
        decoration: BoxDecoration(
            color: kBackgroundLightColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10), blurRadius: 30, color: kShadowColor)
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Stack(
                children: [
                  Container(
                    width: 224,
                    height: 154,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage(
                            placeholder: AssetImage(_LOADING_IMAGE),
                            image: ResizeImage(AssetImage(hotel.image),
                                width: 154, height: 224),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      width: 108,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text('Start From: \$${hotel.price.round()}',
                          style: _bodBody2TextStyle),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: PAD_SYM_H16,
              child: Row(
                children: [
                  Text(hotel.type == HotelType.HOTEL ? 'HOTEL' : 'RESORT',
                      style: _bodBody1TextStyle),
                  Spacer(),
                  SvgPicture.asset(_BOOKMARK_ICON)
                ],
              ),
            ),
            SIZED_BOX_H06,
            Padding(
              padding: PAD_SYM_H16,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(hotel.name, style: _bodTitleTextStyle),
              ),
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(_LOCATION_ICON),
                    SIZED_BOX_W06,
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: hotel.distance.toString(),
                          style: _bodBody1TextStyle.copyWith(
                              color: kPrimaryDarkenColor)),
                      TextSpan(text: ' km', style: _bodBody2TextStyle),
                    ])),
                    SIZED_BOX_W20,
                    SvgPicture.asset(_STAR_ICON),
                    SIZED_BOX_W06,
                    Text(hotel.rating.toString(),
                        style: _bodBody1TextStyle.copyWith(
                            color: kPrimaryDarkenColor))
                  ],
                ))
          ],
        ));
  }
}
