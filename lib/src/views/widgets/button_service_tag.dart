import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class ButtonServiceTag extends StatelessWidget {
  ButtonServiceTag(
      {this.name,
      this.iconUrl,
      this.onPressed,
      this.disabled = false,
      this.color,
      this.size = 65,
      this.radius = 10,
      this.fontSize = 14});
  final String name;
  final String iconUrl;
  final Function onPressed;
  final bool disabled;
  final Color color;
  final double size;
  final double radius;
  final double fontSize;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          RawMaterialButton(
              elevation: 0,
              fillColor: disabled ? kDisabledButtonColor : color,
              constraints: BoxConstraints(minHeight: size, minWidth: size),
              onPressed: disabled ? null : onPressed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              child: SvgPicture.asset(iconUrl)),
          SIZED_BOX_H06,
          Text(name,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: kPrimaryDarkenColor, fontSize: fontSize))
        ],
      );
}
