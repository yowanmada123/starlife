import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/home_page.dart';
import 'package:starlife/page/Login/login_page.dart';
import 'package:starlife/page/loading_page.dart';
import 'package:starlife/page/splashscreen.dart';
import 'page/Home_Page/navigationbar/navigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Starlife',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      home: SplashScreen(),
    );
  }
}