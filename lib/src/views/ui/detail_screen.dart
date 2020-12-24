import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/models/hotel_info.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/detail_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.hotel);
  final HotelInfo hotel;

  static const _LOADING_IMAGE = 'assets/images/bp_loading.gif';
  static const _BACKWARD_ICON =
      'assets/icons/signin_screen/bp_backward_icon.svg';

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    final _dtlPriceTextStyle = Theme.of(context)
        .textTheme
        .headline3
        .copyWith(color: kBackgroundLightColor, fontWeight: FontWeight.w500);
    final _dtlSubTextStyle = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(color: kBackgroundLightColor, fontWeight: FontWeight.normal);
    final _dtlButtonTextStyle = Theme.of(context).textTheme.headline6.copyWith(
        color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 14);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox.expand(
                child: FadeInImage(
                  image: ResizeImage(AssetImage(hotel.image),
                      width: _screenWidth.round(),
                      height: _screenHeight.round()),
                  placeholder: AssetImage(_LOADING_IMAGE),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(_BACKWARD_ICON,
                      color: kBackgroundLightColor),
                ),
              ),
            ),

            // Draggable for extended the info
            DraggableScrollableSheet(
                initialChildSize: .2,
                maxChildSize: .5,
                minChildSize: .2,
                builder: (context, scrollController) => Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          height: _screenHeight * 0.45,
                          decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Stack(
                            children: [
                              DetailExtension(hotel),
                              Positioned(
                                top: 12,
                                left: _screenWidth / 2 - 12,
                                child: Container(
                                  width: 24,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: kSubTextColor.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ],
        ),
      ),

      // Bottom contain price and booking button
      bottomNavigationBar: SizedBox(
          height: 72,
          child: Container(
            padding: PAD_SYM_H20,
            color: kPrimaryColor,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('\$${hotel.price.round()}', style: _dtlPriceTextStyle),
                  Text(' / night', style: _dtlSubTextStyle),
                  Spacer(),
                  RawMaterialButton(
                      elevation: 0,
                      fillColor: kBackgroundLightColor,
                      constraints: BoxConstraints(minHeight: 42, minWidth: 100),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/calendar'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(DTL_BOOKING_TEXT, style: _dtlButtonTextStyle))
                ],
              ),
            ),
          )),
    );
  }
}
