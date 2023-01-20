import 'package:dio/dio.dart';
import 'package:starlife/page/Login/login.dart';

abstract class Services {
  // static Future<Person?> getById(int id) async {}

  static Future<Login?> login(String username, String password) async {
    try {
      var response = await Dio().post('https://reqres.in/api/login', data: {'username': 'user'});

      if (response.statusCode == 200) {
        return Login(token: response.data['response']['token'], success: response.data['success']);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
