import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home/home_page.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/tambah_pasien/tambah_pasien.dart';

import 'page/loading_page.dart';
import 'page/Home/navigationbar/navigationbar.dart';

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

