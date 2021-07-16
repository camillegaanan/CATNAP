import 'package:flutter/material.dart';
import 'utilities/constants.dart';
import 'screens/home_page.dart';
import 'services/schedule_alarm.dart';

void main() {
  runApp(CatnapApp());
  ScheduleAlarm s = new ScheduleAlarm();
  s.initializing();
}

class CatnapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kMainBGColor,
        scaffoldBackgroundColor: kMainBGColor,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
              color: kLightTextColor,
              fontFamily: 'Comfortaa-Bold',
              fontSize: 25.0
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}