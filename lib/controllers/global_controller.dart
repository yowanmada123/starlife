import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starlife/page/Article_Page/article_healthy_page.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_page.dart';
import 'package:starlife/page/Home_Page/home_page.dart';
import 'package:starlife/page/Patient_Page/patient_list_main_page.dart';
import 'package:starlife/page/Profile_Page/profile_page.dart';

class GlobalController extends GetxController {
  final tabHomeIndex = 0.obs;
  final isLogin = false.obs;

  final box = GetStorage();
  final token = ''.obs;
  final baseUrl = "https://starkids.id/api/data/";
  final postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  int pasienNumber = 0;

  // Fungsi yang dijalankan untuk mengambil token dengan mengambil nilai kembalian dari fungsi getToken()
  initState() {
    token.value = getToken() ?? '';
  }

  // Fungsi yang dijalankan pertama kali untuk set token yang akan disimpan pada internal device.
  void setToken(String val) {
    box.write('token', val);
    token.value = val;
  }

  // Fungsi yang dijalankan untuk set flag login.
  setLogin() {
    box.write('isLogin', true);
    isLogin.value = true;
  }

  // Fungsi yang dijalankan mengambil status login untuk pengecekan pada laman dalam aplikasi.
  bool getLoginStatus() {
    bool isLogin = box.read('isLogin');
    return isLogin;
  }

  // Fungsi untuk mengambil token yang telah tersimpan pada device.
  String? getToken() {
    String? token = box.read('token');
    return token;
  }

  // Fungsi untuk menghapus key "token" pada interal device.
  removeToken() {
    box.remove('token');
    box.erase();
  }

  // Fungsi untuk mengecek format email
  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  // Fungsi untuk mengecek suatu string apakah hanya terdiri dari sebua number,
  bool isNumber(String number) {
    String p = r'^[0-9]+$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(number);
  }

  // Fungsi untuk mengecek format nomor dengan diawali dengan "+628"
  bool isPhone(String phone) {
    String q = r'^(\+62)8[1-9][0-9]{6,10}$';
    RegExp regExp = RegExp(q);
    return regExp.hasMatch(phone);
  }

  // Fungsi untuk mengkalkulasi sebuah umur dari sebuah tanggal
  String yourAge(DateTime birthday) {
    var duration = AgeCalculator.age(birthday, today: DateTime.now());
    return duration.years.toString();
  }

  // Fungsi untuk mengubah index pada navigation bar
  void onTabTapped(int index) async {
    tabHomeIndex.value = index;
  }

  // List halaman / fitur utama pada aplikasi
  final List<Widget> children = [
    const HomePage(),
    const CheckRmPage(),
    const PatientListMainPage(),
    const HealthyArticlePage(),
    const ProfilePage(),
  ];
}
