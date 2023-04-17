import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Auth_Page/splashscreen.dart';
void main() {
  runApp(const MyApp());
}
// Main Page atau halaman utama saat pertama build aplikasi
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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
      ],
      home: const SplashScreen(),
      //
    );
  }
}
