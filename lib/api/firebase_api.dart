// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}


class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;


  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

Future<void> sendNotification(String token, String title, String body) async {
  final data = {
    "notification": {
      "body": body,
      "title": title,
    },
    "priority": "high",
    "data": {
      "clickaction": "FLUTTERNOTIFICATIONCLICK",
      "id": "1",
      "status": "done"
    },
    "to": token,
  };

  final response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAG8eFOuM:APA91bHNl2qhyBT-GIHe29dpUxU3TAnfnUsiao1T5re8nx11r1CyxtvQ3FLdZbWx4OMYj4P4LyU9mG-MXl9YB2L_CRAykVOgc5KRYShxUXG4F7fqcMVj1XjhP_fdR3YZ_B8AtxjYn58b',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print(response.statusCode);
    print('Failed to send notification');
  }
}


