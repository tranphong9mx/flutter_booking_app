import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';
import 'package:flutter_booking_app/src/views/widgets/pageview_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewAddPassword extends StatefulWidget {
  PageViewAddPassword({this.pageController});
  final PageController pageController;

  @override
  _PageViewAddPasswordState createState() => _PageViewAddPasswordState();
}

class _PageViewAddPasswordState extends State<PageViewAddPassword>
    with TickerProviderStateMixin {
  static const _TOTAL_LEVEL_RATING = 4;
  static const _TOTAL_STEP = 5;
  static const _CURRENT_STEP = 4;
  static const _PASSWORD_ICON =
      'assets/icons/signin_screen/bp_password_icon.svg';

  final Duration _durationPageView = Duration(milliseconds: 500);
  final Curve _curvePageView = Curves.easeInOut;
  // This use to switch from a TextField to anothers.
  final FocusScopeNode _scopeNode = FocusScopeNode();
  TextEditingController _passwordControl = TextEditingController();

  AnimationController _controller;
  Animation<double> _buttonDisabled;

  bool eightChar = false;
  bool numberCharacter = false;
  bool upperCaseChar = false;
  bool specialChar = false;

  // bool _allValid() =>
  //     eightChar && numberCharacter && upperCaseChar && specialChar;

  int _protectionRating() {
    var count = 0;
    count += eightChar ? 1 : 0;
    count += numberCharacter ? 1 : 0;
    count += upperCaseChar ? 1 : 0;
    count += specialChar ? 1 : 0;
    return count;
  }

  @override
  void initState() {
    super.initState();
    _passwordControl.addListener(() {
      setState(() {
        eightChar = _passwordControl.text.length > 8;
        numberCharacter = _passwordControl.text.contains(RegExp(r'\d'), 0);
        upperCaseChar = _passwordControl.text.contains(RegExp(r'[A-Z]'), 0);
        specialChar = _passwordControl.text.isNotEmpty &&
            !_passwordControl.text.contains(RegExp(r'^[\w&.-]+$'), 0);
      });
      if (_protectionRating() > 1) {
        _controller.forward();
      } else
        _controller.reverse();
    });

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _buttonDisabled = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _buttonDisabled.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordControl.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _sgpTitleTextStyle =
        Theme.of(context).textTheme.headline3.copyWith(color: Colors.black);
    final _sgpInputTextStyle = Theme.of(context).textTheme.subtitle2;

    // Back the previous PageView
    backPageView() {
      widget.pageController
          .animateToPage(2, curve: _curvePageView, duration: _durationPageView);
      _scopeNode.unfocus();
    }

    // Forward the next PageView
    nextPageView() {
      if (_protectionRating() > 1) {
        widget.pageController.animateToPage(4,
            curve: _curvePageView, duration: _durationPageView);
        _scopeNode.unfocus();
      } else
        _scopeNode.unfocus();
    }

    return Container(
        margin: PAD_ONLY_T20,
        padding: PAD_SYM_H20,
        child: Center(
          child: Column(
            children: [
              // Progress Sign Up An Account (Header Bar)
              PageViewProgressBar(
                  backPageView: () => backPageView(),
                  nextPageView: () => nextPageView(),
                  totalStep: _TOTAL_STEP,
                  currentStep: _CURRENT_STEP),
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          SGP_SETUP_PASS_TEXT,
                          style: _sgpTitleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SIZED_BOX_H16,
                      Center(
                        child: Text(
                          SGP_PASS_NOTICE_TEXT,
                          style: _sgpInputTextStyle
                              .copyWith(color: kSubTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SIZED_BOX_H16,
                      // START PHONE FIELD BOX
                      Container(
                        margin: PAD_SYM_H20,
                        padding: PAD_SYM_H20,
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: kBackgroundLightColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: kShadowColor,
                                  offset: Offset(0, 10),
                                  blurRadius: 20)
                            ]),
                        child: Row(
                          children: [
                            SvgPicture.asset(_PASSWORD_ICON, height: 16),
                            SIZED_BOX_W20,
                            Expanded(
                              child: FocusScope(
                                node: _scopeNode,
                                child: TextField(
                                  obscureText: true,
                                  autofocus: true,
                                  controller: _passwordControl,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: _sgpInputTextStyle,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: SGP_HINT_PASS_TEXT,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SIZED_BOX_H24,

                      // Password Rating
                      PasswordRating(
                          totalLevel: _TOTAL_LEVEL_RATING,
                          currentLevel: _protectionRating(),
                          color:
                              SGP_PASSWORD_RATING_COLOR[_protectionRating()]),
                      SIZED_BOX_H16,
                      // Helper Text
                      Padding(
                        padding: PAD_SYM_H10,
                        child: Text(SGP_PASSWORD_HELPER[_protectionRating()],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(
                                    color: SGP_PASSWORD_RATING_COLOR[
                                        _protectionRating()]),
                            textAlign: TextAlign.left),
                      )
                    ],
                  )),
              // Confirm Button
              Expanded(
                  flex: 3,
                  child: Center(
                      child: BookingButton(
                          disabled: _buttonDisabled.value == 1 ? true : false,
                          text: SGP_CONFIRM_TEXT,
                          onPressed: () => nextPageView())))
            ],
          ),
        ));
  }
}

class PasswordRating extends StatelessWidget {
  PasswordRating(
      {this.totalLevel,
      this.currentLevel = 0,
      this.color = kDisabledButtonColor})
      : assert(totalLevel > 0),
        assert(currentLevel >= 0),
        assert(currentLevel <= totalLevel);
  final int totalLevel;
  final int currentLevel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    List<Widget> _listRating = List<Widget>.generate(
        totalLevel,
        (index) => Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                height: 7,
                decoration: BoxDecoration(
                  color: () {
                    return currentLevel > 0 && index < currentLevel
                        ? color
                        : kDisabledButtonColor;
                  }(),
                  borderRadius: BorderRadius.circular(3.5),
                ),
              ),
            ));
    return Container(
      margin: PAD_SYM_H10,
      child: Row(
        children: _listRating,
      ),
    );
  }
}
