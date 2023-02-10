import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var time = DateTime.now();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future addTaskToFirebase() async {
    final user = await auth.currentUser!;
    final userid = user.uid;
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(userid)
        .collection('mytasks')
        .doc(time.toString())
        .set({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time.toString(),
      'timestamp': time
    });
    
    // ignore: use_build_context_synchronously
    FancySnackbar.showSnackbar(
  context,
  snackBarType: FancySnackBarType.success,
  title: "YAY!",
  message: "Task Updated Successfully",
  duration: 3,
  onCloseEvent: () {   
     Navigator.pop(context);
},
);
               
              
          
    // var snackbar = Get.snackbar("YAY!", "Task Updated",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.orangeAccent.withOpacity(0.5));
    // ignore: unnecessary_new
    // new Future.delayed(const Duration(seconds: 1), () {
    //   Navigator.pop(context);
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
        backgroundColor: Colors.deepOrange.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Colors.deepOrangeAccent.withOpacity(0.1))
                ]),
            child: TextFormField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Enter Title',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Colors.deepOrangeAccent.withOpacity(0.1))
                ]),
            child: TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: 'Enter Description',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0))),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 230,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [Colors.redAccent, Colors.deepOrangeAccent],
              ),
            ),
            child: MaterialButton(
              minWidth: 230,
              height: 50,
              onPressed: () {
                addTaskToFirebase();
              },
              child: Text(
                "Add Task",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
