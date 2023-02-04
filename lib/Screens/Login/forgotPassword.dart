import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify_project/Screens/Login/forgotPassword.dart';
import 'package:taskify_project/Screens/Login/signup.dart';

import '../../main.dart';

class ForgotPass extends StatefulWidget {
  // final VoidCallback onClickedSignUp;

  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPass> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(height: 175),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Enter your Registered Email to reset your password",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5722)),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? '          Enter a valid email'
                        : null,
                controller: emailController,
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
          ]),
        ),
        SizedBox(height: 40),
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
            onPressed: forgot,
            child: Text(
              "Reset Password",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
      ]),
    );
  }

  Future forgot() async {
    // final isValid = formKey.currentState!.validate();
    // if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Navigator.of(context).pop();
      
    } on FirebaseAuthException catch (e) {
      var snackbar = Get.snackbar("Error", "Something went Wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orangeAccent.withOpacity(0.5));
      print(e);
    }
    Navigator.of(context).pop();
  }
}
