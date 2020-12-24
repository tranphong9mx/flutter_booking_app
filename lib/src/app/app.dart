import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/theme_customed.dart';
import 'package:flutter_booking_app/src/views/ui/calendar_screen.dart';
import 'package:flutter_booking_app/src/views/ui/home_screen.dart';
import 'package:flutter_booking_app/src/views/ui/signin_screen.dart';
import 'package:flutter_booking_app/src/views/ui/signup_screen.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeCustomed,
      themeMode: ThemeMode.light,
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/calendar': (context) => CalendarScreen()
      },
    );
  }
}
