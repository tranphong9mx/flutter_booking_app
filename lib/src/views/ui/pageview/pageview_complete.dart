import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';

class PageViewCompleted extends StatelessWidget {
  static const _THUMBNAIL_IMAGE = 'assets/images/bp_thumbnail.png';
  @override
  Widget build(BuildContext context) {
    final _sgpTitleTextStyle =
        Theme.of(context).textTheme.headline3.copyWith(color: Colors.black);
    final _sgpSubTextStyle = Theme.of(context)
        .textTheme
        .subtitle2
        .copyWith(color: kSubTextColor, height: 1.5);

    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  _THUMBNAIL_IMAGE,
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      SGP_FINAL_DONE_TEXT,
                      style: _sgpTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SIZED_BOX_H16,
                    Text(
                      SGP_FINAL_NOTICE_TEXT,
                      style: _sgpSubTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SIZED_BOX_H24,
                    BookingButton(
                        text: SGP_CONFIRM_TEXT,
                        onPressed: () => Navigator.pushNamed(context, '/home'))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
