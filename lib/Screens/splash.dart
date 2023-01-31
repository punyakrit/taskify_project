import 'package:flutter/material.dart';
import 'package:taskify_project/main.dart';
import './onBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_new
    new Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Onboarding()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
