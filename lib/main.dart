// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    ),
      home: hom(),
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
    )
    );
  }
}
