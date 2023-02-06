import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(children: [
        
            Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(left: 7),
        
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/avatar.jpg"),
              ),
            ),
            SizedBox(width: 10),
            RichText(
            text: TextSpan(
                text: "Hi, ",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
              TextSpan(
                
                text: " Create Account",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ]
            )
            ),
          ]
          
          ),
          actions: [
          
          // Icon(
          // Icons.login,
          // color: Colors.black,
          // size: 40,
          // )
          ],
        ),





        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "home screen",
            style: TextStyle(
              fontSize: 44,
            ),
          ),
          ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('Sign out'))
        ]));
  }
}
