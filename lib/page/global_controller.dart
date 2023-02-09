import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalController extends GetxController {
  final tabHomeIndex = 0.obs;
  final isLogin = false.obs;

  final box = GetStorage();
  double sw = Get.width / 390;
  double sh = Get.height / 844;
  String token = '';
  String url = "https://appsim.my.id/api/data/";
  int pasienNumber = 0;

  initState() {
    token = getToken() ?? '';
  }

  String? getToken() {
    String? token = box.read('token');
    return token;
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
}
