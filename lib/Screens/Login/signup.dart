import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    List images = ["go.png"];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(height: 35),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.18,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/avatar.jpg"),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 45),
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
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepOrange,
                    ),
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
            SizedBox(height: 20),
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.deepOrange,
                    ),
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
            SizedBox(height: 20),
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
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.deepOrange,
                    ),
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
          ]),
        ),
        SizedBox(height: 45),
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => hom()));
            },
            child: Text(
              "SignUp",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        SizedBox(height: 10,),
        RichText(
            text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account?",
                style: TextStyle(fontSize: 17, color: Colors.deepOrange))),
        SizedBox(height: w * 0.08),
        RichText(
            text: TextSpan(
          text: "SignUp using on the following method",
          style:
              TextStyle(fontSize: 16, color: Color.fromARGB(165, 255, 109, 64)),
        )),
        Wrap(
          children: List<Widget>.generate(1, (index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/" + images[index]),
                backgroundColor: Colors.white,
              ),
            );
          }),
        )
      ]),
    );
  }
}