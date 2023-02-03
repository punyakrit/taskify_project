import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(
        "home screen",
        style: TextStyle(
          fontSize: 44,
        ),
      ),
      
      ElevatedButton(
      onPressed: ()=> FirebaseAuth.instance.signOut(),
       child: 
       Text('Sign out'))
      ]
      
    )
    );
  }
}
