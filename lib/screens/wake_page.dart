import 'package:catnap/services/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:catnap/services/compute_waking_time.dart';
import 'package:catnap/utilities/constants.dart';
import 'package:catnap/utilities/reusable_time_button.dart';
import 'package:catnap/services/schedule_alarm.dart';
import 'package:catnap/screens/goodnight_page.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';

ComputeWakingTime compute = ComputeWakingTime();

class WakePage extends StatefulWidget {
  @override
  _WakePageState createState() => _WakePageState();
}

int count = 0;

class _WakePageState extends State<WakePage> {
  DateTime now = DateTime.now();
  String timeStamp = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgimage.png'),
            fit: BoxFit.cover,
          )
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              new IconButton(
                icon: new Image.asset('images/logo.png'),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: Text(
                  'If you sleep right now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 31.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(new DateFormat.jm().format(DateTime.parse(timeStamp)),
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 43,
                    color: Colors.white,
                    letterSpacing: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: kTransparentButtonColor,
                  splashColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Calculate Sleeping Time',
                      style: kButtonTextStyle,
                    ),
                  ),
                  onPressed: () {
                    //compute sleeping time here
                    Time time = Time(now.hour, now.minute);
                    compute.computeWakingTime(time.getHour(), time.getMinute());
                    bottomSheet(context);
                  },
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      child: Text(
                        'A good night\'s sleep consists of',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white.withOpacity(0.7), fontFamily: 'kMessageTextStyle', fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      child: Text(
                        '5-6 complete sleeping cycles \n',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.deepPurple, fontFamily: 'kMessageTextStyle', fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      child: Text(
                        'You have real dreams to catch so think big and allow yourself to breathe.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white.withOpacity(0.7), fontFamily: 'kMessageTextStyle', fontSize: 25.0),
                      ),
                    ),

                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }




}

bottomSheet(context) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (BuildContext c) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                child: Text(
                  'You will have to wake up at these times',
                  textAlign: TextAlign.center,
                  style: kBottomSheetTextStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableTimeButton(
                    count:4,
                    colour: kTimeCard1,
                    computeWakingTime: compute,
                    onTap: () {
                      count = 4;
                      showAlertDialog(context);
                    },
                    edge: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                  ),
                  ReusableTimeButton(
                    count:3,
                    colour: kTimeCard2,
                    computeWakingTime: compute,
                    onTap: () {
                      count = 3;
                      showAlertDialog(context);
                    },
                    edge: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  ReusableTimeButton(
                    count: 2,
                    colour: kTimeCard3,
                    computeWakingTime: compute,
                    onTap: () {
                      count = 2;
                      showAlertDialog(context);
                    },
                    edge: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  ReusableTimeButton(
                    count:1,
                    colour: kTimeCard4,
                    computeWakingTime: compute,
                    onTap: () {
                      count = 1;
                      showAlertDialog(context);
                    },
                    edge: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color(0XFF070B34),
                  splashColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'CALCULATE AGAIN',
                      style: kButtonTextStyle,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
  );
}

showAlertDialog(BuildContext context) {

  Widget noButton = FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Color(0XFF070B34),
    splashColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Text(
        'NO',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
          fontFamily: 'Comfortaa-Bold',
        ),
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget yesButton = FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Color(0XFF070B34),
    splashColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Text(
        'YES',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
          fontFamily: 'Comfortaa-Bold',
        ),
      ),
    ),
    onPressed: () {
      //alarm
      String time = compute.getTime(count);
      print(time[0]);
      ScheduleAlarm(context: context, alarmTime: time).showNotification();
      //showNotifications();
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => GoodnightPage(
        time: compute.getTime(count),
          )
      ),);
    },
  );

  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: Colors.white,
    content: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text(
              'Do you want to set an alarm for',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Comfortaa-Bold',
                fontSize: 30.0,
                color: Color(0xFF261462),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //'10:45 PM',
                  compute.getTime(count),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Blogger',
                    fontSize: 40.0,
                    color: Color(0xFF614CBF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Comfortaa-Bold',
                    fontSize: 35.0,
                    color: Color(0xFF261462),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                noButton,
                yesButton,
              ],
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}