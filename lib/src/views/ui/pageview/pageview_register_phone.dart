import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/data/singletons/app_data.dart';
import 'package:flutter_booking_app/src/business_logic/models/country.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';
import 'package:flutter_booking_app/src/views/widgets/pageview_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewRegisterPhone extends StatefulWidget {
  PageViewRegisterPhone({this.list, this.pageController, this.appData});
  final Future<List<Country>> list;
  final PageController pageController;
  final AppData appData;

  @override
  _PageViewRegisterPhoneState createState() => _PageViewRegisterPhoneState();
}

class _PageViewRegisterPhoneState extends State<PageViewRegisterPhone> {
  final Duration _durationPageView = Duration(milliseconds: 500);
  final Curve _curvePageView = Curves.easeInOut;
  final FocusScopeNode _scopeNode = FocusScopeNode();

  final TextEditingController _phoneControl = TextEditingController();

  static const _TOTAL_STEP = 5;
  static const _CURRENT_STEP = 1;
  static const _DROPDOWN_ICON =
      'assets/icons/signin_screen/bp_dropdown_icon.svg';

  // Change calling code when user change the dropdown button
  changedCallingCode(dynamic value) => setState(() {
        widget.list.then((_value) => _value.forEach((instance) {
              if (instance.alpha2Code == value)
                widget.appData.setCountry = instance;
            }));
      });

  // Update AppData to reuse in another pageview
  updateAppData(dynamic value) => setState(() {
        widget.appData.setPhone = value;
      });

  @override
  void initState() {
    widget.appData.reset();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scopeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _countryData = widget.appData.getCountry();
    var _phone = widget.appData.getPhone();

    final _sgpTitleTextStyle =
        Theme.of(context).textTheme.headline3.copyWith(color: Colors.black);
    final _sgpInputTextStyle = Theme.of(context).textTheme.subtitle2;

    // Back the previous PageView
    backPageview() {
      Navigator.pop(context);
      _scopeNode.unfocus();
    }

    // Forward the next PageView
    nextPageView() {
      _phoneControl.text.isNotEmpty
          ? widget.pageController.animateToPage(1,
              curve: _curvePageView, duration: _durationPageView)
          : widget.appData.reset();
      _scopeNode.unfocus();
    }

    _phoneControl.text = _phone;
    _phoneControl.selection = TextSelection.fromPosition(
        TextPosition(offset: _phoneControl.text.length));

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
                        SGP_ADD_PHONE_TEXT,
                        style: _sgpTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SIZED_BOX_H20,
                      Text(
                        SGP_PHONE_NOTICE_TEXT,
                        style:
                            _sgpInputTextStyle.copyWith(color: kSubTextColor),
                        textAlign: TextAlign.center,
                      ),
                      SIZED_BOX_H20,

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
                            FutureBuilder<List<Country>>(
                              future: widget.list,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var country = snapshot.data;
                                  // Dropdown menu for calling code
                                  return DropdownButton(
                                      value: _countryData.alpha2Code,
                                      icon: SvgPicture.asset(_DROPDOWN_ICON),
                                      dropdownColor: kBackgroundLightColor,
                                      underline: Container(),
                                      elevation: 0,
                                      onChanged: (value) =>
                                          changedCallingCode(value),
                                      items: country
                                          .map((c) => DropdownMenuItem(
                                              value: c.alpha2Code,
                                              child: flagWidget(c.alpha2Code,
                                                  c.callingCodes.first)))
                                          .toList());
                                } else
                                  return Row(
                                    // When data loading CircularProgressIndicator will visible
                                    children: [
                                      SIZED_BOX_W45,
                                      Container(
                                          width: 12,
                                          height: 12,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2)),
                                      SIZED_BOX_W45
                                    ],
                                  );
                              },
                            ),
                            SIZED_BOX_W10,
                            Expanded(
                              child: FocusScope(
                                node: _scopeNode,
                                child: TextField(
                                  autofocus: true,
                                  onChanged: (value) => updateAppData(value),
                                  controller: _phoneControl,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.number,
                                  style: _sgpInputTextStyle,
                                  expands: true,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: SGP_HINT_PHONE_TEXT,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              // END PHONE FIELD BOX
              Expanded(
                flex: 4,
                child: Center(
                    child: BookingButton(
                        text: SGP_SEND_OTP_TEXT,
                        onPressed: () => nextPageView())),
              )
            ],
          ),
        ));
  }

  // Flag will be get on this site bellow, after we got calling code
  Widget flagWidget(String code, String phoneCode) {
    const _FLAGURL = 'https://www.countryflags.io';
    const _FLAGSIZE = 64;
    return Row(children: [
      Image.network('$_FLAGURL/${code.toLowerCase()}/flat/$_FLAGSIZE.png',
          scale: 1.6),
      SizedBox(width: 6),
      Text('+' + phoneCode),
      SizedBox(width: 2)
    ]);
  }
}
