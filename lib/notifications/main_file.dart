// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// // Initialize the FlutterLocalNotificationsPlugin
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> initializeNotifications() async {
//   tz.initializeTimeZones(); // Initialize timezone data

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

// void scheduleNotification(DateTime scheduledDateTime, String taskTitle) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'task_channel_id',
//     'task_channel_name',
//     channelDescription: 'Task reminders',
//     importance: Importance.max,
//     priority: Priority.high,
//     playSound: true,
//   );

//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   final tz.TZDateTime tzScheduledDateTime = tz.TZDateTime.from(
//     tz.local as DateTime, // Use tz.local for current timezone
//     scheduledDateTime as tz.Location, // Convert DateTime to TZDateTime
//   );

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     0,
//     'Task Reminder',
//     'It\'s time for: $taskTitle',
//     tzScheduledDateTime,
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true, // Use this for notifications while idle
//     payload: 'Task Reminder Payload',
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//   );
// }
