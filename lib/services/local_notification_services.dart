import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugins =
      FlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/splash');

    var initializationSettingIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingIOS);
    await notificationsPlugins.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

 Future notificationDetails() async {
    return   const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high), iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {required int id , String? title, String? body, String? payload}) async {
    return await notificationsPlugins.show(
        id, title, body,  await notificationDetails());
  }
}

/* class localNotificationService {
  // localNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();
  Future<void> initialiaze() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/splash');

   /*  IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    ); */

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, /* iOS: iosInitializationSettings */);

    await _localNotificationService.initialize(settings, 
        /* onSelectNotification: onSelectNotification */);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true);

    /* const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails(); */

        return const NotificationDetails(android: androidNotificationDetails, /* iOS: iosNotificationDetails */);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body

  }) async {
    final details = await _notificationDetails();
      await _localNotificationService.show(id, title, body, details);
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id: ${id}');
  }

  void onSelectNotification(String? payload) {
    print("payload $payload");
  }
} */
