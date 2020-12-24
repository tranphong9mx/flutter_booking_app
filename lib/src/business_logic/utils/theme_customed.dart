import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';

final themeCustomed = ThemeData(
    primaryColor: kPrimaryColor,
    backgroundColor: kBackgroundLightColor,
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: TextTheme(
        headline1: TextStyle(
            color: kPrimaryDarkenColor,
            fontSize: 40,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: kPrimaryDarkenColor,
            fontSize: 32,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500),
        headline3: TextStyle(
            color: kPrimaryDarkenColor,
            fontSize: 28,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500),
        headline4: TextStyle(
            color: kPrimaryColor,
            fontSize: 24,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold),
        headline5: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold),
        headline6: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold),
        subtitle1:
            TextStyle(color: kPrimaryColor, fontSize: 16, fontFamily: 'Rubik'),
        subtitle2: TextStyle(
            color: kPrimaryDarkenColor, fontSize: 14, fontFamily: 'Rubik'),
        bodyText2: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            fontFamily: 'Rubik'),
        bodyText1: TextStyle(
            color: kTagRentColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Rubik')),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: kDisabledButtonColor, fontSize: 14, fontFamily: 'Rubik'),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none)));
