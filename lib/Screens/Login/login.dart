import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify_project/Screens/Login/signup.dart';

import '../../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> _texts = [
    "Hello",
    "Namaste",
    "Hola",
    "Bonjour",
    "Hallo",
    "Ciao",
    "Salve"
  ];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _updateText();
  }

  void _updateText() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _index = (_index + 1) % _texts.length;
    });
    _updateText();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(height: 95),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              _texts[_index],
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5722)),
            ),
            Text(
              'Sign into your Account',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(154, 255, 109, 64)),
            ),
            SizedBox(height: 50),
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
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Text(
                  'Forgot your Password?',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(96, 255, 109, 64)),
                ),
              ],
            ),
          ]),
        ),
        SizedBox(height: 70),
        Container(
          width: 230,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Colors.redAccent, Colors.deepOrangeAccent],
            ),
          ),
          child: MaterialButton(
            minWidth: 230,
            height: 60,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              "Login",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        SizedBox(height: w * 0.2),
        RichText(
            text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 255, 109, 64)),
                children: [
              TextSpan(
                  text: " Create",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 109, 64),
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => SignUp())),
            ]))
      ]),
    );
  }
}
