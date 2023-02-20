import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'Login/login.dart';
import 'home/home.dart';

class Onboarding extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: OnBoard(
          pageController: _pageController,
          // Either Provide onSkip Callback or skipButton Widget to handle skip state

          onBoardData: onBoardData,
          titleStyles: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 25,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          // ignore: prefer_const_constructors
      
          descriptionStyles: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: Colors.deepOrangeAccent,
            activeColor: Colors.deepOrange,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          // Either Provide onSkip Callback or skipButton Widget to handle skip state

          skipButton: TextButton(
            onPressed: () {},
            child: const Text(""),
          ),
          // Either Provide onDone Callback or nextButton Widget to handle done state
          nextButton: OnBoardConsumer(
            builder: (context, ref, child) {
              final state = ref.watch(onBoardStateProvider);
              return InkWell(
                onTap: () => _onNextTap(context, state),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.redAccent, Colors.deepOrangeAccent],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Welcome Back!" : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(BuildContext context, OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => 
          StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Something went Wront!'));
                } else if (snapshot.hasData) {
                  return HomePage();
                } else {
                  return Login();
                }
              }
              )
              )
              );

      // print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Remember Daily tasks",
    description:
        "The app provide a platform where you don't need to remember your everyday tasks",
    imgUrl: "assets/gif.gif"
    
  ),
  const OnBoardModel(
    title: "Track Progress",
    description:
        "You can easily track your daily progress and perform your tasks efficiently",
    imgUrl: 'assets/gif2.gif',
  ),
  const OnBoardModel(
    title: "Get Notified Instantly",
    description:
        "You get notifications of your task and track your daily work on this platform",
    imgUrl: 'assets/gif3.gif',
  ),
];
