import 'package:flutter/material.dart';

/// COLOR

// Primary Color
const kPrimaryColor = Color(0xFF003580);
const kPrimaryDarkenColor = Color(0xFF2D3142);
// Background Color
const kBackgroundColor = Color(0xFFF5FAFF);
const kBackgroundLightColor = Color(0xFFFFFFFF);
// Box Color
const kDisabledButtonColor = Color(0xFFD2D2D2);
const kSizeBoxLightColor = Color(0xFFEBF3FF);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.15);
const kUnseletedColor = Color(0xFF91A2BA);
const kOutSideDateColor = Color(0xFFE9E9E9);
// Icon Color
const kIconFacebookColor = Color(0xFF3A58BA);
const kIconGoogleColor = Color(0xFFEB4335);
const kIconStarColor = Color(0xFFFFCF23);
// Tag Color
const kTagHotelColor = Color(0xFF59B9FD);
const kTagRentColor = Color(0xFF1F87FE);
const kTagFlightColor = Color(0xFFFF9B90);
const kTagEventColor = Color(0xFFAF8EFF);
// Rating Color
const kDangerRatingColor = Color(0xFFFF5050);
const kWarningRatingColor = Color(0xFFEDA566);
const kMediumRatingColor = Color(0xFFA5BF5C);
// Orthers
const kSubTextColor = Color(0xFF95A0AF);

/// SIZE

const SIZED_BOX_W04 = SizedBox(width: 4);
const SIZED_BOX_W06 = SizedBox(width: 6);
const SIZED_BOX_W10 = SizedBox(width: 10);
const SIZED_BOX_W20 = SizedBox(width: 20);
const SIZED_BOX_W45 = SizedBox(width: 45);

const SIZED_BOX_H04 = SizedBox(width: 4);
const SIZED_BOX_H06 = SizedBox(height: 6);
const SIZED_BOX_H12 = SizedBox(height: 12);
const SIZED_BOX_H16 = SizedBox(height: 16);
const SIZED_BOX_H20 = SizedBox(height: 20);
const SIZED_BOX_H24 = SizedBox(height: 24);
const SIZED_BOX_H30 = SizedBox(height: 30);

/// PADDING

const PAD_ONLY_T20 = EdgeInsets.only(top: 20);
const PAD_ONLY_R20 = EdgeInsets.only(right: 20);
const PAD_SYM_H10 = EdgeInsets.symmetric(horizontal: 10);
const PAD_SYM_H16 = EdgeInsets.symmetric(horizontal: 16);
const PAD_SYM_H20 = EdgeInsets.symmetric(horizontal: 20);
const PAD_SYM_H30 = EdgeInsets.symmetric(horizontal: 30);
const PAD_SYM_V20 = EdgeInsets.symmetric(vertical: 20);

/// STRING

// Sign In Screen String
const SGN_SIGNIN_TEXT = 'Sign In';
const SGN_NOACC_TEXT = 'Don\'t have an account?';
const SGN_SIGNUP_TEXT = ' Sign up';
const SGN_EMAIL_TEXT = 'Email';
const SGN_HINT_EMAIL_TEXT = 'johndoe@mymail.com';
const SGN_HINT_PASS_TEXT = '********';
const SGN_PASS_TEXT = 'Password';

// Sign Up Screen String
const SGP_VERIFY_NUMBER_TEXT = 'Verify your number';
const SGP_SEND_MESSAGE_TEXT = 'We\'ve sent a message to\n';
const SGP_RESEND_TEXT = 'Resend a code';
const SGP_CONFIRM_TEXT = 'Confirm';
const SGP_ADD_EMAIL_TEXT = 'Add your email';
const SGP_EMAIL_NOTICE_TEXT = 'Trust me, it\'t not spammy.\nJust an invoice';
const SGP_HINT_EMAIL_TEXT = 'youremail@email.com';
const SGP_SETUP_PASS_TEXT = 'Set up your\npassword';
const SGP_PASS_NOTICE_TEXT = 'Keep you safe';
const SGP_HINT_PASS_TEXT = 'Your Password';
const SGP_FINAL_NOTICE_TEXT =
    'Thanks for registering! Now let\'s\nfind the cozy places';
const SGP_FINAL_DONE_TEXT = 'You\'re all set';
const SGP_ADD_PHONE_TEXT = 'Start with your\nnumber';
const SGP_PHONE_NOTICE_TEXT = 'So we can reach you with it';
const SGP_HINT_PHONE_TEXT = 'Your Number';
const SGP_SEND_OTP_TEXT = 'Send Me OTP';

// Home Screen String
const HME_HINT_SEARCH_TEXT = 'Explore \"Bali\"';
const HME_NEARBY_TEXT = 'Nearby';
const HME_INSPIRATION_TEXT = 'Get Inspiration';

const Map<int, String> SGP_PASSWORD_HELPER = {
  0: 'Your password should have at least contain:\nA number, a special character, an uppercase :~',
  1: 'Your password is so weak! :((',
  2: 'Your password is medium protection! :||',
  3: 'Your password is ready to use :>',
  4: 'Your password is wonderful :D'
};

const Map<int, Color> SGP_PASSWORD_RATING_COLOR = {
  0: kDisabledButtonColor,
  1: kDangerRatingColor,
  2: kWarningRatingColor,
  3: kMediumRatingColor,
  4: kPrimaryColor
};

// Detail Screen String
const DTL_SAMPLE_DESCRIPT_TEXT =
    'We serve the best facilities for our best costumers. Relaxed room in an elegant property featuring a 24-hour restaurant, an outdoor pool & a gym.';
const DTL_BOOKING_TEXT = 'Book Now';
const DTL_AMENITY_TEXT = 'Amenities';

// Calender Screen String
const CLR_TITLE_TEXT = 'Book a Room';
const CLR_CALENDAR_TITLE_TEXT = 'Select Dates';
const CLR_ADDITION_TEXT = 'Additional';
const CLR_EXTRA_BED_TEXT = 'Extra bed';
const CLR_ADDMORE_TEXT = 'Add More';
const CLR_BOOKING_TEXT = 'Book My Room';