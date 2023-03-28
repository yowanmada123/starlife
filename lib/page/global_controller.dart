import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starlife/page/Article_Page/article_healthy_page.dart';
import 'package:starlife/page/Auth_Page/Login/login_page.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_page.dart';
import 'package:starlife/page/Home_Page/home_page.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/Patient_Page/patient_list_main_page.dart';
import 'package:starlife/page/Profile_Page/profile_page.dart';

class GlobalController extends GetxController {
  final tabHomeIndex = 0.obs;
  final isLogin = false.obs;

  final box = GetStorage();
  double sw = Get.width / 390;
  double sh = Get.height / 844;
  String token = '';
  final baseUrl = "https://starkids.id/api/data/";
  final postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  int pasienNumber = 0;

  initState() {
    token = getToken() ?? '';
  }

  void setToken(String val) {
    final box = GetStorage();
    box.write('token', val);
    token = val;
  }

  void setLogin() {
    final box = GetStorage();
    box.write('isLogin', true);
  }

  bool getLoginStatus() {
    final box = GetStorage();
    bool isLogin = box.read('isLogin');
    return isLogin;
  }

  String? getToken() {
    final box = GetStorage();
    String? token = box.read('token');
    return token;
  }

  void removeToken() {
    final box = GetStorage();
    box.remove('token');
  }

  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  bool isNumber(String number) {
    String p = r'^[0-9]+$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(number);
  }

  bool isPhone(String phone) {
    String q = r'^(\+62)8[1-9][0-9]{6,10}$';
    RegExp regExp = RegExp(q);
    return regExp.hasMatch(phone);
  }

  String yourAge(DateTime birthday) {
    var duration = AgeCalculator.age(birthday, today: DateTime.now());
    return duration.years.toString();
  }

  void onTabTapped(int index) async {
    String? token = await getToken();
    // if (index == 1 || index == 2 || index == 4) {
    //   if (c.isLogin.value == false) {
    //     c.tabHomeIndex.value = 0;
    //     Get.offAll(HelloConvexAppBar());
    //     Get.to(const LoginPage());
    //   } else {
    //     c.tabHomeIndex.value = index;
    //   }
    // } else {
    //   c.tabHomeIndex.value = index;
    // }

    if (index == 1 || index == 2 || index == 4) {
      if (token == null) {
        tabHomeIndex.value = 0;
        Get.offAll(HelloConvexAppBar());
        Get.to(const LoginPage());
      } else {
        isLogin.value = true;
        tabHomeIndex.value = index;
      }
    } else {
      tabHomeIndex.value = index;
    }
  }

  final List<Widget> children = [
    const HomePage(),
    const CheckRmPage(),
    const PatientListMainPage(),
    const HealthyArticlePage(),
    const ProfilePage(),
  ];
}
