import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';

class BookingButton extends StatelessWidget {
  BookingButton(
      {this.text,
      this.onPressed,
      this.disabled = false,
      this.expanded = false});
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool expanded;
  @override
  Widget build(BuildContext context) => RawMaterialButton(
      elevation: 0,
      fillColor: disabled ? kDisabledButtonColor : kPrimaryColor,
      constraints: BoxConstraints(
          minHeight: 56,
          minWidth: expanded ? MediaQuery.of(context).size.width : 250),
      onPressed: disabled ? null : onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Text(text,
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: kBackgroundLightColor,
              fontWeight: FontWeight.normal,
              fontSize: 18)));
}
