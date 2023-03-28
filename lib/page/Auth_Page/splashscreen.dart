import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Home_Page/home_controller.dart';

import 'package:starlife/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;
  final c = Get.put(GlobalController());

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Get.to(const BlankScreen(), transition: Transition.circularReveal, duration: const Duration(seconds: 2));
    });
    // getToken();
    super.initState();
  }

  // getToken() async {
  //   c.token = (await c.getToken())!;
  //   print(c.token);
  // }

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
  final h = Get.put(HomeController());

  // @override
  // void initState() {
  //   super.initState();

  // }

  int time = 1;
  @override
  void initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      // print("=============/* =========");
      // print(c.getToken());
      // print("============= */=========");
      await h.getDataPatientQueue();
      // print("======================");
      // print(h.listPatientQueue[0].doctorId);
      // print("======================");
    });
    Future.delayed(Duration(seconds: time), () async {
      Get.offAll(HelloConvexAppBar());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HelloConvexAppBar();
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
