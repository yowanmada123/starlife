import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home/homepage.dart';

import 'page/loading_page.dart';
import 'page/navigationbar/navigationbar.dart';

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
      home: LoadingScreen(),
    );
  }
}

