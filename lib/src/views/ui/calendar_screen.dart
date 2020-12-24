import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/widgets/button_booking.dart';
import 'package:flutter_booking_app/src/views/widgets/checking_booking_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController _calendarController;

  static const _BACKWARD_ICON =
      'assets/icons/signin_screen/bp_backward_icon.svg';
  static const _ARROW_ICON = 'assets/icons/detail_screen/bp_arrow_icon.svg';
  static const _BED_ICON = 'assets/icons/home_screen/bp_hotel_icon.svg';
  static const _PLUS_ICON = 'assets/icons/detail_screen/bp_plus_icon.svg';

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _calendarDayInsideStyle = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: kPrimaryDarkenColor);
    final _calendarDayOutsideStyle = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: kOutSideDateColor);
    final _calendarDaySeletecdStyle =
        Theme.of(context).textTheme.subtitle1.copyWith(
              color: kBackgroundLightColor,
              fontWeight: FontWeight.w500,
            );
    final _clrTitleTextStyle = Theme.of(context)
        .textTheme
        .headline4
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w600);

    final _clrHeadline5TitleTextStyle = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w600);
    final _clrHeadline6TitleTextStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w600);

    outSideDateWidget(DateTime date) => Container(
        alignment: Alignment.center,
        child: Text(date.day.toString(), style: _calendarDayOutsideStyle));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // Top Bar
              Expanded(
                flex: 1,
                child: Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(_BACKWARD_ICON,
                            color: kPrimaryColor),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(CLR_TITLE_TEXT, style: _clrTitleTextStyle),
                      ),
                    ],
                  ),
                ),
              ),

              // Calendar Part
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 20, 12, 24),
                        decoration: BoxDecoration(
                            color: kBackgroundLightColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Text(CLR_CALENDAR_TITLE_TEXT,
                                style: _clrHeadline5TitleTextStyle),

                            // Calendar table call from library
                            TableCalendar(
                              rowHeight: 38,
                              headerStyle: HeaderStyle(
                                titleTextBuilder: (date, locale) =>
                                    DateFormat.MMMM(locale).format(date),
                                titleTextStyle: _clrHeadline6TitleTextStyle,
                                centerHeaderTitle: true,
                                formatButtonVisible: false,
                                leftChevronIcon: Icon(Icons.chevron_left,
                                    color: kPrimaryColor, size: 32),
                                rightChevronIcon: Icon(Icons.chevron_right,
                                    color: kPrimaryColor, size: 32),
                              ),

                              // Rebuild UI of calendar
                              builders: CalendarBuilders(
                                dayBuilder: (_, date, __) => Container(
                                  alignment: Alignment.center,
                                  child: Text(date.day.toString(),
                                      style: _calendarDayInsideStyle.copyWith(
                                          color:
                                              date.compareTo(DateTime.now()) < 0
                                                  ? kPrimaryDarkenColor
                                                      .withOpacity(.3)
                                                  : kPrimaryDarkenColor)),
                                ),
                                outsideDayBuilder: (_, date, __) =>
                                    outSideDateWidget(date),
                                outsideWeekendDayBuilder: (_, date, __) =>
                                    outSideDateWidget(date),
                                dowWeekdayBuilder: (_, weekday) => Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      weekday[0],
                                      style: _clrHeadline6TitleTextStyle,
                                    )),
                                todayDayBuilder: (_, date, __) => Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: kPrimaryColor, width: 2)),
                                  child: Text(date.day.toString(),
                                      style: _calendarDaySeletecdStyle.copyWith(
                                          color: kPrimaryColor)),
                                ),
                                selectedDayBuilder: (_, date, __) => Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: Text(date.day.toString(),
                                      style: _calendarDaySeletecdStyle),
                                ),
                              ),
                              calendarController: _calendarController,
                              availableGestures: AvailableGestures.none,
                            ),

                            // A line bellow table calender
                            Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width / 2,
                                margin: EdgeInsets.only(top: 12, bottom: 20),
                                color: kSubTextColor.withOpacity(.2)),

                            // Day booking, not done
                            Padding(
                              padding: PAD_SYM_H20,
                              child: Row(
                                children: [
                                  CheckingBookingInfo(
                                    date: 3,
                                    month: 'Aug',
                                    time: 14,
                                    appoitment: 'From',
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(_ARROW_ICON),
                                  Spacer(),
                                  CheckingBookingInfo(
                                    date: 7,
                                    month: 'Aug',
                                    time: 12,
                                    appoitment: 'Before',
                                    checkIn: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // This part is a card to add more orders (not done)
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 30),
                        padding:
                            EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kBackgroundLightColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          Text(CLR_ADDITION_TEXT,
                              style: _clrHeadline5TitleTextStyle),
                          Padding(
                            padding: PAD_SYM_V20,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  _BED_ICON,
                                  color: kTagHotelColor,
                                  width: 28,
                                ),
                                SIZED_BOX_W20,
                                Text(CLR_EXTRA_BED_TEXT,
                                    style: _clrHeadline6TitleTextStyle.copyWith(
                                      color: kPrimaryDarkenColor,
                                    )),
                                Spacer(),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.5),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              kSubTextColor.withOpacity(.2))),
                                  child: Icon(Icons.remove,
                                      size: 16, color: kPrimaryColor),
                                ),
                                SIZED_BOX_W20,
                                Text('1', style: _clrHeadline5TitleTextStyle),
                                SIZED_BOX_W20,
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.5),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              kSubTextColor.withOpacity(.2))),
                                  child: Icon(Icons.add,
                                      size: 16, color: kPrimaryColor),
                                ),
                              ],
                            ),
                          ),

                          // The line separated
                          Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width / 2,
                              margin: EdgeInsets.only(top: 0, bottom: 20),
                              color: kSubTextColor.withOpacity(.2)),

                          // Icon plus for add orders (not done)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(_PLUS_ICON,
                                  width: 24,
                                  color: kSubTextColor.withOpacity(.3)),
                              SIZED_BOX_W20,
                              Text(CLR_ADDMORE_TEXT,
                                  style: _clrHeadline5TitleTextStyle.copyWith(
                                      color: kSubTextColor.withOpacity(.3),
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BookingButton(text: CLR_BOOKING_TEXT, expanded: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
