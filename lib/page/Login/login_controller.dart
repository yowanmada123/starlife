import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starlife/page/Login/login_page.dart';
import 'package:starlife/page/global_controller.dart';

import 'login.dart';

class LoginController extends GetxController {
  var cGlobal = Get.put(GlobalController());

  String email = '';
  String password = '';
  String confirmPassword = '';
  var dio = Dio();

  Future<Login?> login() async {
    try {
      var response = await Dio().post('https://reqres.in/api/login', data: {'username': email, 'password': password});

      if (response.statusCode == 200) {
        return Login(token: response.data['response']['token'], success: response.data['success']);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Login?> register() async {
    try {
      // FormData formData = FormData.fromMap({
      //   "nama": nama, 
      //   "notelp": notelp, 
      //   "goldar": goldar, 
      //   "jeniskelamin": jeniskelamin, 
      //   "alamat": alamat, 
      //   "tgllahir": tgllahir, 
      //   "email": email, 
      //   "username": username, 
      //   "password": password, 
      //   "photo": await MultipartFile.fromFile(photo, filename: 'photo.jpg'
      //   )});
      final response = await dio.post("${cGlobal.url}/register",
          options: Options(
            validateStatus: (_) => true, 
            headers: {
            'Accept': 'application/json',
            // 'Authorization': 'Bearer ${sharedPreferences.getString("token")}'
          }),
          // data: formData
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // Future<void> login() async {
  //   try {
  //     var response = await dio.post('${cGlobal.url}login', data: {'username': 'email', 'password': 'password'});

  //     log(response.statusCode.toString());
  //     // final url = Uri.parse('${cGlobal.url}login');
  //     // Map<String, String> requestBody = <String, String>{'email': email, 'password': password};
  //     // var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  //     // var response = await request.send();
  //     // if (response.statusCode >= 200 && response.statusCode < 400) {
  //     //   log('Connection OK');
  //     //   final respStr = await response.stream.bytesToString();

  //     //   var body = jsonDecode(respStr);
  //     //   SharedPreferences pref = await SharedPreferences.getInstance();
  //     //   await pref.setString("login", body['data']['access_token']);
  //     //   await pref.setString("pass", password);

  //     //   // Get.to(HomePage());
  //     //   // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     //   //   builder: (context) => BottomNavigation(),
  //     //   // ));
  //     //   await pref.setString("password", password);
  //     // } else {
  //     //   log('Connection Failed');
  //     //   log("Email atau password tidak tepat");
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //     SnackBar(content: Text("Email atau password Kurang tepat")));
  //     // }
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  // Future<void> register() async {
  //   try {
  //     final url = Uri.parse('https://api.gunma.my.id/api/v1/register-user');
  //     Map<String, String> requestBody = <String, String>{
  //       // 'name': nameController.text,
  //       // 'email': emailController.text,
  //       // 'password': passwordController.text,
  //       // 'password_confirmation': confirmedPasswordController.text,
  //     };
  //     var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  //     var response = await request.send();

  //     if (response.statusCode >= 200 && response.statusCode < 400) {
  //       log('User Registed');
  //       final respStr = await response.stream.bytesToString();

  //       var body = jsonDecode(respStr);
  //       log(
  //         body,
  //       );
  //       Get.to(const LoginPage());
  //       // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       // builder: (context) => LoginScreen(),
  //       // )
  //       // );

  //     } else {
  //       // ScaffoldMessenger.of(context).showSnackBar(
  //       //     SnackBar(content: Text("Connection Failed")));
  //     }

  //     // Navigator.push(
  //     //       context, MaterialPageRoute(builder: (context) => HomePageScreen()));

  //     // print("This is the Status Code$respStr");
  //     // var encoded = json.decode(respStr);

  //     // print(encoded['status']);
  //     // print('This is the userId${encoded['data']['user_id']}');

  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  Future loginWithGoogle() async {
    // await GoogleSignInApi.login();
  }
  // final googleSignin = GoogleSignIn();

  // GoogleSignInAccount? _user;
  // GoogleSignInAccount get user => _user!;

  // Future googleSignIn() async {
  //   final googleUser = await googleSignin.signIn();
  //   if (googleSignin == null) return;
  //   _user = googleUser;

  //   final googleAuth = await googleUser!.authentication;

  //   final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //   await FirebaseAuth.instance.signInWithCredential(credential);

  //   // notifyListeners();
  // }
}
