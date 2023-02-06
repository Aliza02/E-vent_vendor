import 'package:event_vendor/screens/onboard.dart';
import 'package:event_vendor/screens/signin.dart';
import 'package:event_vendor/screens/signup.dart';
import 'package:event_vendor/screens/home.dart';
import 'package:event_vendor/screens/test.dart';
import 'package:event_vendor/screens/test2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/onboard': (context) => onboard(),
        '/signin': (context) => signin(),
        '/': (context) => signup(),
        '/home': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
