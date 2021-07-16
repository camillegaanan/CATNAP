

import 'package:flutter/cupertino.dart';

class Convert {

  int hour, min;
  String time,ampm, trueHour, trueMin, trueAMPM, timeNow;

  Convert({@required this.time});
  void convertToDuration() {
    String a,b,c,d,e,f,g;
    String h = "";
    a = time[0];
    b = time[1];
    c = time[2];
    d = time[3];
    e = time[4];
    f = time[5];
    g = time[6];
    if (time.length == 8) {
      h = time[7];
    }
    //if >=10 ung hour
    if (b != " ") {
      trueHour = "$a$b";
    }
    //if <10
    else {
      trueHour = a;
    }
    //if < 10 ung hour
    if (c != " ") {
      trueMin = "$c$d";
    }
    //if >= 10 ung hour
    else {
      trueMin = "$d$e";
    }
    //if <10 yung hour
    if (f != " ") {
      trueAMPM = "$f$g";
    }
    // if >=10 ung hour
    else {
      trueAMPM = "$g$h";
    }

    hour = int.parse(trueHour);

    min = int.parse(trueMin);
    print("hour: $hour");
    print("min: $min");
    ampm = trueAMPM;
    print(ampm);

    if (ampm == "PM") {
      hour = hour + 12;
    }
  }



  DateTime getDate() {
    DateTime today = DateTime.now();
    String month, day, hour2, min2;
    if (today.hour >= 13 && hour <= 12) {
      today.add(new Duration(days: 1));
    }
    if (today.month < 10) {
      month = "0" + today.month.toString();
    } else {
       month = today.month.toString();
    }
    if (today.day < 10) {
       day = "0" + today.day.toString();
    } else {
       day = today.day.toString();
    }
    if (hour < 10) {
       hour2 = "0" + hour.toString();
    } else {
       hour2 = hour.toString();
    }
    if (min < 10) {
       min2 = "0" + min.toString();
    } else {
       min2 = min.toString();
    }
    String year = today.year.toString();


    print("$year-$month-$day $hour2:$min2");



    DateTime computed = DateTime.parse("$year-$month-$day $hour2:$min2");
    return computed;
  }
}