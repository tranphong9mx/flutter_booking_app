import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  SocialButton({this.color, this.size, this.iconUrl});
  final double size;
  final Color color;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0,
        fillColor: color,
        constraints: BoxConstraints(minHeight: size, minWidth: size),
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(size)),
        child: SvgPicture.asset(iconUrl, width: 13, color: kBackgroundLightColor));
  }
}
