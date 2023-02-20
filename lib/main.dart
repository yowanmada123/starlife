import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Auth_Page/splashscreen.dart';
import 'package:starlife/page/dio/TryDio.dart';

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
      home: const SplashScreen(),
    );
  }
}