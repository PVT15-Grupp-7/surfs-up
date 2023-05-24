import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  void init() {
    requestPermission();
    getToken();
    FirebaseMessaging.onMessage.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;
      if (notification != null && android != null) {
        print('Notification Title: ${notification.title}');
        print('Notification Body: ${notification.body}');
        print('Notification Data: ${event.data}');
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
      
      if (message != null ) {
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


  

}