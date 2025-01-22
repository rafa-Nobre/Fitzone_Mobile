import 'package:fitzone_app/core/models/custom_notification.dart';
import 'package:fitzone_app/routes/app_routes.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  late AndroidNotificationDetails _androidNotificationDetails;

  NotificationService() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
    // _androidNotificationDetails = const AndroidNotificationDetails(
    //   'channel id',
    //   'channel name',
    //   importance: Importance.max,
    //   priority: Priority.high,
    // );
    
  }
  

 _setupNotifications() async { 
  await _setupTimezone();
  await _initilizeNotifications();
}

Future<void> _setupTimezone() async {
 tz.initializeTimeZones();

final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  _initilizeNotifications() async {
    const AndroidInitializationSettings android = AndroidInitializationSettings('@mipmap/ic_launcher');
    
    await _flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: android
    ),
    onSelectNotification: (payload) => onSelectNotification(payload),
   );
  }
  
onSelectNotification(String? payload) async {
  if (payload != null && payload.isNotEmpty) {
    Navigator.of(Routes.navigatorKey.currentContext!).pushReplacementNamed(payload);
  print('Payload: $payload');

}
}

showNotification (CustomNotification not) {
  _androidNotificationDetails = const AndroidNotificationDetails(
    'channel id',
    'channel name',
    importance: Importance.max,
    priority: Priority.high,
  );

_flutterLocalNotificationsPlugin.show(
  not.id,
  not.title,
  not.body,
  NotificationDetails(
    android: _androidNotificationDetails,
  ),
  payload: not.payload,
);

checkForNotification() async {
  final pendingNotificationRequests =
   await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
  print('Pending notifications: $pendingNotificationRequests');

}

}
}