import 'package:catnap/services/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:catnap/services/compute_sleeping_time.dart';
import 'package:catnap/utilities/constants.dart';
import 'package:catnap/utilities/reusable_time_card.dart';

ComputeSleepingTime compute = ComputeSleepingTime();

class SleepPage extends StatefulWidget {
  @override
  _SleepPageState createState() => _SleepPageState();
}

int count = 0;

class _SleepPageState extends State<SleepPage> {
  DateTime _dateTime = DateTime.now();


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
                  'You want to wake up at',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 31.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox (
                  height: 100.0,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 31.0,
                          color: Colors.white,
                          letterSpacing: 5.0,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: _dateTime,
                      backgroundColor: Colors.transparent,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          _dateTime = dateTime;
                        });
                      },
                    ),
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
                    Time time = Time(_dateTime.hour, _dateTime.minute);
                    compute.computeSleepingTime(time.getHour(), time.getMinute());
                    bottomSheet(context);
                  },
                ),
              ),
              Opacity (
                opacity: 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
                  child: Text(
                    'Wake up with the purpose of making a brighter tomorrow. \n \nYou have real dreams to catch so think big and allow yourself to breathe.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontFamily: 'kMessageTextStyle', fontSize: 25.0),
                  ),
                ),
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
                  'You will have to sleep at these times',
                  textAlign: TextAlign.center,
                  style: kBottomSheetTextStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableTimeCard(
                    count: 1,
                    colour: kTimeCard1,
                    computeSleepingTime: compute,
                    edge: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                  ),
                  ReusableTimeCard(
                    count: 2,
                    colour: kTimeCard2,
                    computeSleepingTime: compute,
                    edge: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  ReusableTimeCard(
                    count: 3,
                    colour: kTimeCard3,
                    computeSleepingTime: compute,
                    edge: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  ReusableTimeCard(
                    count: 4,
                    colour: kTimeCard4,
                    computeSleepingTime: compute,
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
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      }
  );
}