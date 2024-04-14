// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat_app/auth.dart';
import 'package:chat_app/chat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/splash.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'api/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DashBoardApp',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              return ChatScreen();
            }
            return const AuthScreen();
          })),
    );
  }
}
