import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'convert.dart';
import 'package:catnap/screens/home_page.dart';

class ScheduleAlarm {

  var context;
  String alarmTime;
  Convert dur;
  ScheduleAlarm({this.context, this.alarmTime});

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  void showNotification() async {
  await notificationSchedule();
  }

  void initializing() async {
  androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  iosInitializationSettings = IOSInitializationSettings(
  onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  initializationSettings = InitializationSettings(
  androidInitializationSettings, iosInitializationSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  onSelectNotification: onSelectNotification);
  }

  Future<void> notificationSchedule() async {
   // var timeDelayed = DateTime.now().add(Duration(hours: dur.getHour(), minutes: dur.getMin()));
    Convert con = Convert(time: alarmTime);
    dur = con;
    dur.convertToDuration();
    var timeDelayed = dur.getDate();
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'second channel ID', 'second Channel title', 'second channel body',
        priority: Priority.High,
        importance: Importance.Max,
        sound: RawResourceAndroidNotificationSound('alarm'),
        playSound: true,
        ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails(
      sound: 'alarm.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails =
    NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(0, 'Rise and Shine!',
        'It\'s time to get up!', timeDelayed, notificationDetails, androidAllowWhileIdle: true);
  }

  Future onSelectNotification(String payLoad) async{
  if (payLoad != null) {
  print(payLoad);
  }
  await Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomePage(),
    )
  );
// If we tab in the notification we can set the nagivator to navigate to the next page,
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }
}