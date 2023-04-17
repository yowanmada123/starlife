import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/controllers/home_controller.dart';

import 'package:starlife/utils/colors.dart';

// Splashscreen yang berisi halaman animasi
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
      Get.offAll(const BlankScreen(), transition: Transition.circularReveal, duration: const Duration(seconds: 2));
    });
    // getToken();
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
  final h = Get.put(HomeController());

  int time = 1;
  @override
  void initState() {
    // Delay untuk mengambil data pasien di halaman homepage
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await h.getDataPatientQueue();
    });
    Future.delayed(Duration(seconds: time), () async {
      // Get.off(HelloConvexAppBar());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HelloConvexAppBar()));
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //   return HelloConvexAppBar();
      // }));
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
