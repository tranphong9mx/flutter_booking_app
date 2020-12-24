import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_booking_app/src/business_logic/data/singletons/app_data.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';
import 'package:flutter_booking_app/src/views/widgets/pageview_progress_bar.dart';

class PageViewAuthenticatePhone extends StatefulWidget {
  PageViewAuthenticatePhone({this.pageController, this.appData});
  final PageController pageController;
  final AppData appData;

  @override
  _PageViewAuthenticatePhoneState createState() =>
      _PageViewAuthenticatePhoneState();
}

class _PageViewAuthenticatePhoneState extends State<PageViewAuthenticatePhone> {
  final Duration _durationPageView = Duration(milliseconds: 500);
  final Curve _curvePageView = Curves.easeInOut;
  static const _OTP_SIZE = 4;
  static const _TOTAL_STEP = 5;
  static const _CURRENT_STEP = 2;

  // This use to switch from a TextField to anothers.
  final FocusScopeNode _scopeNode = FocusScopeNode();

  List<OtpField> _listOtpFieldGroup = [];
  String _otpValue;

  @override
  void initState() {
    super.initState();
    _listOtpFieldGroup = otpGenerate(_OTP_SIZE);
  }

  @override
  void dispose() {
    super.dispose();
    _scopeNode.dispose();
  }

  // Generate length of OTP
  otpGenerate(int length) => List<OtpField>.generate(length, (index) {
        if (index == 0)
          return OtpField(isStart: true, onFocus: true);
        else
          return OtpField();
      })
        ..forEach((otp) {
          otp.scopeNode = _scopeNode;
        })
        ..last.isEnd = true;

  // Get value of OTP when user done
  getOtpValue(List<OtpField> list) {
    String _otpString = '';
    list.forEach((otp) =>
        _otpString = otp.value != null ? _otpString += otp.value : _otpString);
    return _otpString;
  }

  @override
  Widget build(BuildContext context) {
    var _phone = widget.appData.getPhone();
    var _countryData = widget.appData.getCountry();

    final _sgpTitleTextStyle =
        Theme.of(context).textTheme.headline3.copyWith(color: Colors.black);
    final _sgpSendMessageTextStyle = Theme.of(context).textTheme.subtitle2;

    final _screenWidth = MediaQuery.of(context).size.width;

    // Back the previous PageView
    backPageview() {
      widget.pageController
          .animateToPage(0, curve: _curvePageView, duration: _durationPageView);
      _scopeNode.unfocus();
    }

    // Forward the next PageView
    nextPageView() {
      setState(() => _otpValue = getOtpValue(_listOtpFieldGroup));
      _otpValue != null && _otpValue.length == _OTP_SIZE
          ? widget.pageController.animateToPage(2,
              curve: _curvePageView, duration: _durationPageView)
          : otpGenerate(_OTP_SIZE);
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
                        SGP_VERIFY_NUMBER_TEXT,
                        style: _sgpTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SIZED_BOX_H20,
                      // Phone number was user typed will present here
                      Text(
                        '$SGP_SEND_MESSAGE_TEXT+${_countryData.callingCodes.first}$_phone',
                        style: _sgpSendMessageTextStyle.copyWith(
                            color: kSubTextColor, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      // Container of OTP Field
                      Container(
                          margin: PAD_SYM_V20,
                          alignment: Alignment.center,
                          width: _screenWidth / 2.4,
                          child: FocusScope(
                            node: _scopeNode,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _listOtpFieldGroup,
                            ),
                          )),
                      Text(SGP_RESEND_TEXT,
                          style: _sgpSendMessageTextStyle.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
              // Confirm Button
              Expanded(
                flex: 4,
                child: Center(
                    child: BookingButton(
                        text: SGP_CONFIRM_TEXT, onPressed: () => nextPageView())),
              )
            ],
          ),
        ));
  }
}

// Use StateFulWidget for hide the circle container when user type a number
// ignore: must_be_immutable
class OtpField extends StatefulWidget {
  OtpField(
      {this.isEnd = false,
      this.isStart = false,
      this.scopeNode,
      this.onFocus = false,
      this.value});
  bool isStart;
  bool isEnd;
  FocusScopeNode scopeNode;
  bool onFocus;
  String value;

  @override
  _OtpFieldState createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  hideHasValueBox(String value) {
    // Set value for parent get OTP when user done
    setState(() {
      widget.value = value.isNotEmpty ? value : null;
    });

    // When user type a TextField, If that Input have a value, forward next one.
    // When user remove a value in TextField, backward previous one
    if (widget.value != null) {
      if (!widget.isEnd)
        widget.scopeNode.nextFocus();
      else
        widget.scopeNode.unfocus();
    } else if (!widget.isStart)
      widget.scopeNode.previousFocus();
    else
      widget.scopeNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // This Container with circle shape will invisible when user type a number
        Positioned(
          top: 6,
          left: 10,
          child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.value != null
                      ? Colors.transparent
                      : kDisabledButtonColor)),
        ),
        // Main TextField for OTP
        Container(
          width: 40,
          height: 40.0,
          child: TextField(
            // Input acceptable for number and only 1 number for each TextField
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(1)
            ],
            autofocus: widget.onFocus,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            cursorHeight: 0,
            cursorColor: Colors.transparent,
            cursorWidth: 0,
            style: Theme.of(context).textTheme.headline1,
            keyboardType: TextInputType.number,
            onChanged: (value) => hideHasValueBox(value),
          ),
        )
      ],
    );
  }
}
