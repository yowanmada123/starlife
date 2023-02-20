import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_post.dart';
import 'package:starlife/page/Auth_Page/Login/login.dart';
import 'package:starlife/page/Auth_Page/auth_controller/auth_controller.dart';
import 'package:starlife/page/global_controller.dart';

class Services {
  // static Future<Person?> getById(int id) async {}
  final Dio dio = Dio();
  final c = Get.put(GlobalController());
  var lc = Get.put(AuthController());

  
}
