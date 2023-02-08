import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_task.dart';

String path = 'package:cloud_firestore/src/collection_reference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var uid;
  @override
  void initState() {
     uid = getuid();
    super.initState();
  }

  String getuid() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return (uid);

    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
        toolbarHeight: 140,
        backgroundColor: Colors.deepOrange.withOpacity(0.8),
        elevation: 30,
        title: Row(children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(left: 7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset("assets/avatar.jpg"),
            ),
          ),
          SizedBox(width: 10),
          RichText(
              text: TextSpan(
                  text: "Hello,",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                 
              )
              ),
        ]),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(
                Icons.login,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('tasks')
                .doc(uid)
                .collection('mytasks')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 100,
                  child: Center(child: const CircularProgressIndicator()),
                );
              }

              final doc = snapshot.data!.docs;
              return ListView.builder(
                itemCount: doc.length,
                itemBuilder: (context, index) {
                  print("working");
                  return Container(
                    child: Column(children: [
                      Text(
                        doc[index]['title'],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ]),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
      ),
    );
  }
}
