import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() {
    setupMessages();
    requestPermission();
    getToken();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: darwinInitializationSettings,
    );

    const AndroidNotificationChannel channel =
        AndroidNotificationChannel(
          'messages', 
          'Messages',
          description: 'Messages from the app',
          importance: Importance.max);

    createChannel(channel);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      final android = event.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ),
        );
      }
    });
  }

  void requestPermission() {
    messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void getToken() async {
    String? token = await messaging.getToken();
    print('Token: $token');
  }

  Future<void> setupMessages() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      handleNavigation(message);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handleNavigation);
  }

  void handleNavigation(RemoteMessage message) {
    if (message.data['type'] == 'surf') {
      // Navigate to SurfPage
    } else if (message.data['type'] == 'weather') {
      // Navigate to WeatherPage
    }
  }

  void setupMessage() {}


  void createChannel(AndroidNotificationChannel channel) async {
    final FlutterLocalNotificationsPlugin plugin = 
      FlutterLocalNotificationsPlugin();

    await plugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  }


  
}
