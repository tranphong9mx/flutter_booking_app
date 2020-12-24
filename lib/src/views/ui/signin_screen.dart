import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';
import 'package:flutter_booking_app/src/views/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key key}) : super(key: key);
  static const _HEADER_IMAGE = 'assets/icons/signin_screen/bp_header_login.svg';
  static const _FACEBOOK_ICON =
      'assets/icons/signin_screen/bp_facebook_icon.svg';
  static const _GOOGLE_ICON = 'assets/icons/signin_screen/bp_google_icon.svg';
  static const _SOCIAL_BUTTON_SIZE = 42.0;
  @override
  Widget build(BuildContext context) {
    final _sgnTitleTextStyle = Theme.of(context).textTheme.headline4;
    final _sgnNoAccTextStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // IMAGE IN THE TOP HEADER
            Container(
                color: kBackgroundColor,
                height: 200,
                width: double.infinity,
                child: SvgPicture.asset(
                  _HEADER_IMAGE,
                  alignment: Alignment.bottomCenter,
                )),

            // SIGN IN FORM
            Padding(
              padding: PAD_SYM_H30,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: PAD_SYM_V20,
                      child: Text(SGN_SIGNIN_TEXT, style: _sgnTitleTextStyle),
                    ),
                    SignInForm(), // SIGN IN FORM
                    // SIGN UP WILL NAVIGATION TO REGISTER SCREEN
                    Container(
                      margin: PAD_SYM_V20,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(SGN_NOACC_TEXT, style: _sgnNoAccTextStyle),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/signup'),
                              child: Text(SGN_SIGNUP_TEXT,
                                  style: _sgnNoAccTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor)),
                            )
                          ]),
                    ),

                    // SOCIAL BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                            color: kIconFacebookColor,
                            iconUrl: _FACEBOOK_ICON,
                            size: _SOCIAL_BUTTON_SIZE),
                        SIZED_BOX_W06,
                        SocialButton(
                            color: kIconGoogleColor,
                            iconUrl: _GOOGLE_ICON,
                            size: _SOCIAL_BUTTON_SIZE)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formTitleTextStyle = Theme.of(context).textTheme.subtitle1;
    final _formInputTextStyle = Theme.of(context).textTheme.subtitle2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(SGN_EMAIL_TEXT, style: _formTitleTextStyle),
        Container(
          padding: PAD_SYM_H20,
          alignment: Alignment.centerLeft,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 20),
          height: 60,
          decoration: BoxDecoration(
              color: kBackgroundLightColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: kShadowColor, offset: Offset(0, 10), blurRadius: 20)
              ]),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.emailAddress,
            style: _formInputTextStyle,
            expands: true,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: SGN_HINT_EMAIL_TEXT,
            ),
          ),
        ),
        Text(
          SGN_PASS_TEXT,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Container(
          padding: PAD_SYM_H20,
          alignment: Alignment.centerLeft,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 40),
          height: 60,
          decoration: BoxDecoration(
              color: kBackgroundLightColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: kShadowColor, offset: Offset(0, 10), blurRadius: 20)
              ]),
          child: TextField(
            obscureText: true,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.visiblePassword,
            style: _formInputTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: SGN_HINT_PASS_TEXT,
            ),
          ),
        ),
        Center(
            child: BookingButton(
                text: SGN_SIGNIN_TEXT,
                onPressed: () => Navigator.pushNamed(context, '/home')))
      ],
    );
  }
}
