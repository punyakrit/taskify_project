// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify_project/Screens/Login/signup.dart';
import 'Screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taskify',
      theme: ThemeData(
      
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
