import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';

class CheckingBookingInfo extends StatelessWidget {
  CheckingBookingInfo(
      {this.checkIn = true, this.date, this.time, this.month, this.appoitment});
  final bool checkIn;
  final int date, time;
  final String month;
  final String appoitment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(checkIn ? 'Check-In:' : 'Check-Out',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.normal)),
        SizedBox(height: 6),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: date.toString(),
                style: Theme.of(context).textTheme.headline2),
            TextSpan(
                text: ' $month',
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: kPrimaryDarkenColor, fontWeight: FontWeight.w500)),
          ]),
        ),
        SizedBox(height: 6),
        Text('$appoitment ${time.toString()}:00',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.normal)),
      ],
    );
  }
}
