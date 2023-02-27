import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../service/ad_mob.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  BannerAd? _banner;
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

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
      duration: 4,
    );
    new Future.delayed(const Duration(seconds: 0), () {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
         adUnitId: AdMobService.bannerAdUnitId,
          listener: AdMobService.bannerListner,
           request: const AdRequest()
           ) ..load();
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
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 180,
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
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Enter Title',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0))),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: null,
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Enter Description',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0))),
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
        ),
        bottomNavigationBar: _banner == null
            ? Container()
            : Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 52,
                child: AdWidget(ad: _banner!),
              ),
              );
  }
}
