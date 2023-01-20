import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/splashscreen.dart';

import 'global_controller.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final cGlobal = Get.put(GlobalController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  init() async {
    //todo load from box;
    await cGlobal.initState();
    if (cGlobal.token.isNotEmpty) {
      log(cGlobal.token);
      // Get.offAll(WelcomingPage());
      // Get.offAll(HomeNavbarButton());
    } else {
      // Get.offAll(const WelcomingPage());
      // Get.offAll(const AllScreen());
      Get.offAll(const SplashScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
