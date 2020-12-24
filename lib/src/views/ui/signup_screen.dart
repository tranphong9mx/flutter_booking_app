import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/data/country_handle.dart';
import 'package:flutter_booking_app/src/business_logic/data/singletons/app_data.dart';
import 'package:flutter_booking_app/src/business_logic/models/country.dart';
import 'package:flutter_booking_app/src/views/ui/pageview/pageview_add_email.dart';
import 'package:flutter_booking_app/src/views/ui/pageview/pageview_add_password.dart';
import 'package:flutter_booking_app/src/views/ui/pageview/pageview_authenticate_phone.dart';
import 'package:flutter_booking_app/src/views/ui/pageview/pageview_complete.dart';
import 'package:flutter_booking_app/src/views/ui/pageview/pageview_register_phone.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<List<Country>> _list = CountryHandle().getFutureListCountries();
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: false);
  final AppData _appData = AppData();

  @override
  Widget build(BuildContext context) {
    _list.then((value) => debugPrint(value.first.toString()));
    Widget _pageViewBuilder(_, index) {
      switch (index) {
        case 1:
          return PageViewAuthenticatePhone(
              pageController: _pageController, appData: _appData);
          break;
        case 2:
          return PageViewAddEmail(pageController: _pageController);
          break;
        case 3:
          return PageViewAddPassword(pageController: _pageController);
          break;
        case 4:
          return PageViewCompleted();
          break;
        default:
          return PageViewRegisterPhone(
              list: _list, pageController: _pageController, appData: _appData);
          break;
      }
    }

    return Scaffold(
        body: SafeArea(
            child: PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: _pageViewBuilder,
      controller: _pageController,
    )));
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
