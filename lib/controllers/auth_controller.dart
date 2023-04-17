import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/page/Auth_Page/Login/login_page.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/controllers/global_controller.dart';

import '../page/Auth_Page/Login/login.dart';

class AuthController extends GetxController {
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  String name = '';
  String email = '';
  String phone = '';
  String pinrm = '';
  String password = '';
  String confirmPassword = '';

  @override
  void onClose() {
    email = '';
    password = '';
    phone = '';
    pinrm = '';
    password = '';
    confirmPassword = '';
  }
 // Fungsi Login User Untuk masuk ke aplikasi dengan user yang sudah terdaftar.
  Future<Login?> login(BuildContext context) async {
    final formData = FormData.fromMap({'username': email, 'password': password});
    try {
      final response = await dio.post('${c.baseUrl}login', data: formData);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        c.setToken(response.data['response']['data']['token']);
        c.setLogin();
        c.token.value = c.getToken()!;
        email = "";
        password = "";
        Get.offAll(const HelloConvexAppBar());
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  // Fungsi Register User Untuk mendaftarkan user baru.
  Future<Register?> register(BuildContext context) async {
    final formData = FormData.fromMap({"nama": name, "email": email, "phone": phone, "pincode": pinrm, "password": password});
    try {
      final response = await dio.post('${c.baseUrl}register_starlife', data: formData);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        // print(response.data["response"]);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Account Success Created'),
          backgroundColor: Colors.black87,
        ));
        Get.offAll(const LoginPage());
      } else {
        // print(response.data["response"]);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
