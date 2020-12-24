import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';
import 'package:flutter_booking_app/src/views/widgets/pageview_progress_bar.dart';
import 'package:flutter_svg/svg.dart';

class PageViewAddEmail extends StatelessWidget {
  PageViewAddEmail({this.pageController});
  final PageController pageController;

  static const _EMAIL_ICON = 'assets/icons/signin_screen/bp_email_icon.svg';

  static const _TOTAL_STEP = 5;
  static const _CURRENT_STEP = 3;

  @override
  Widget build(BuildContext context) {
    final Duration _durationPageView = Duration(milliseconds: 500);
    final Curve _curvePageView = Curves.easeInOut;
    // This use to switch from a TextField to anothers.
    final FocusScopeNode _scopeNode = FocusScopeNode();
    // final TextEditingController _emailControl = TextEditingController();

    final _sgpTitleTextStyle =
        Theme.of(context).textTheme.headline3.copyWith(color: Colors.black);
    final _sgpInputTextStyle = Theme.of(context).textTheme.subtitle2;

    // Back the previous PageView
    backPageview() {
      pageController.animateToPage(1,
          curve: _curvePageView, duration: _durationPageView);
      _scopeNode.unfocus();
    }

    // Forward the next PageView
    nextPageView() {
      pageController.animateToPage(3,
          curve: _curvePageView, duration: _durationPageView);
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
                  backPageView: () => backPageview(),
                  nextPageView: () => nextPageView(),
                  totalStep: _TOTAL_STEP,
                  currentStep: _CURRENT_STEP),
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        SGP_ADD_EMAIL_TEXT,
                        style: _sgpTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SIZED_BOX_H20,
                      Text(
                        SGP_EMAIL_NOTICE_TEXT,
                        style: _sgpInputTextStyle.copyWith(
                            color: kSubTextColor, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      SIZED_BOX_H20,
                      
                      // Email Box
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

                        // Main Email TextField
                        child: Row(
                          children: [
                            SvgPicture.asset(_EMAIL_ICON, height: 16),
                            SIZED_BOX_W20,
                            Expanded(
                              child: FocusScope(
                                node: _scopeNode,
                                child: TextField(
                                  autofocus: true,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.emailAddress,
                                  style: _sgpInputTextStyle,
                                  expands: true,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: SGP_HINT_EMAIL_TEXT,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              // Confirm Button
              Expanded(
                flex: 4,
                child: Center(
                    child: BookingButton(
                        text: SGP_CONFIRM_TEXT,
                        onPressed: () => nextPageView())),
              )
            ],
          ),
        ));
  }
}
