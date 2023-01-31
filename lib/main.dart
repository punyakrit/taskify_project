// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskify',
      theme: ThemeData(
      primaryColor: Color(0xff85586F),
      ),
      home: SplashScreen(),
    );
  }
}

class hom extends StatelessWidget {
  const hom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'demo screen',
        style: TextStyle(
          fontSize: 44,
        ),
      ),
    ));
  }
}
