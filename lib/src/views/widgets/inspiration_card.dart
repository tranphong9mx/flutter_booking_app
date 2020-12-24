import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/models/inspiration_title.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class InspirationCard extends StatelessWidget {
  InspirationCard(this.inspiration);
  final InspirationTitle inspiration;
  @override
  Widget build(BuildContext context) {
    final _indTitleTextStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w500);
    final _indSubTextStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(color: kSubTextColor);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 140,
        padding: EdgeInsets.only(left: 20),
        width: double.infinity,
        decoration: BoxDecoration(color: kBackgroundLightColor, boxShadow: [
          BoxShadow(offset: Offset(0, 6), blurRadius: 20, color: kShadowColor)
        ]),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  inspiration.icon,
                  height: 20,
                  color: kTagHotelColor,
                ),
                SIZED_BOX_H20,
                Text(inspiration.title, style: _indTitleTextStyle),
                SIZED_BOX_H06,
                Row(
                  children: [
                    Text(inspiration.getType(inspiration.type),
                        style: _indSubTextStyle),
                    SIZED_BOX_W04,
                    Icon(Icons.circle, size: 4, color: kSubTextColor),
                    SIZED_BOX_W04,
                    Text('${inspiration.minutes} mins', style: _indSubTextStyle)
                  ],
                )
              ],
            ),
            Positioned(
              right: -60,
              top: -6,
              child: Container(
                height: 186,
                width: 190,
                child: CircleAvatar(
                  backgroundImage: ResizeImage(AssetImage(inspiration.image),
                      width: 190, height: 186),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
