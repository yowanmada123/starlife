import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/page/Auth_Page/Login/login_page.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/dio/dio_client.dart';

import '../Login/login.dart';

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

  Future<Login?> login(BuildContext context) async {
    final formData = FormData.fromMap({'username': email, 'password': password});
    try {
      final response = await dio.post('${c.baseUrl}login', data: formData);
      print("=====================================");
      print(response.statusCode);
      print(response.data);
      print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        print(response.data["response"]);
        c.setToken(response.data['response']['data']['token']);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Login Success'),
          backgroundColor: Colors.black87,
        ));
        c.isLogin.value = true;
        Get.offAll(HelloConvexAppBar());
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

  Future<Register?> register(BuildContext context) async {
    final formData = FormData.fromMap({"nama": name, "email": email, "phone": phone, "pincode": pinrm, "password": password});
    try {
      final response = await dio.post('${c.baseUrl}register_starlife', data: formData);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        print(response.data["response"]);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Account Success Created'),
          backgroundColor: Colors.black87,
        ));
        Get.offAll(const LoginPage());
      } else {
        print(response.data["response"]);
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
