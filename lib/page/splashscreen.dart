import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Login/login_page.dart';
import 'package:starlife/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Get.to(const BlankScreen(), transition: Transition.circularReveal, duration: Duration(seconds: 2));
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //   return const BlankScreen();
      // }));
      // Get.offAll(BlankScreen, transition: Transition.circularReveal);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(width: 206, height: 178, "assets/icon/ic_logo.png"),
      ),
    );
  }
}

class BlankScreen extends StatefulWidget {
  const BlankScreen({super.key});

  @override
  State<BlankScreen> createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  int time = 1;
  @override
  void initState() {
    Future.delayed(Duration(seconds: time), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
      // Get.to(const LoginPage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OPrimaryColor,
    );
  }
}
