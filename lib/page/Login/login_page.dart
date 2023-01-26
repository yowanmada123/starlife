import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Login/login_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Home/navigationbar/navigationbar.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

import '../Register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final c = Get.put(GlobalController());
  final lc = Get.put(LoginController());
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: "");
  final _forgotPasswordMail = TextEditingController(text: "");
  bool _isObscure = true;

  // final bool isValid = EmailValidator.validate(email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
            ),
            Positioned(
              top: -300,
              left: -230,
              child: Container(
                width: c.sw * 844,
                height: c.sh * 844,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: OPrimaryColor),
              ),
            ),
            Positioned(
                top: -100,
                left: -110,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(400)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      width: c.sw * 676,
                      height: c.sw * 663,
                      'assets/icon/ic_logo_crop.png',
                      // color: Colors.white.withOpacity(0.15),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                )),
            Positioned(
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: c.sh * 60.0),
                            child: Image.asset(
                              width: c.sw * 143,
                              height: c.sh * 173,
                              'assets/icon/ic_logo.png',
                            ),
                          ),
                          SizedBox(
                            height: c.sh * 15,
                          ),
                          const Text("Selamat Datang !").p20b().white(),
                          const Text("Masuk untuk lanjut").p12r().white(),
                          SizedBox(
                            height: c.sh * 14,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: c.sw * 34.0),
                            child: Container(
                              width: c.sw * 322,
                              height: c.sh * 340,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 0.3,
                                    blurRadius: 5,
                                    offset: const Offset(0, 0.1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: c.sh * 15,
                                  ),
                                  const Text("Masuk Akun").p16b().black(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                                    child: TextField(
                                      style: const TextStyle(color: Colors.black, fontSize: 14),
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        labelStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: c.sh * 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                                    child: TextField(
                                      style: const TextStyle(color: Colors.black, fontSize: 14),
                                      controller: _passwordController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: const TextStyle(color: Colors.grey),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            },
                                            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: c.sh * 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                                    child: BaseButton(
                                      ontap: () {
                                        bool isEmail = c.isEmail(_emailController.text);
                                        if (!_emailController.text.isEmpty && !_passwordController.text.isEmpty) {
                                          if (isEmail) {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text('Login Success'),
                                              backgroundColor: Colors.black87,
                                            ));
                                            Get.offAll(HelloConvexAppBar());
                                            // lc.email = _emailController.text;
                                            // lc.password = _passwordController.text;
                                            // lc.login();
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text('Please fill correct Email'),
                                              backgroundColor: Colors.black87,
                                            ));
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            content: Text('Please Fill in the blank'),
                                            backgroundColor: Colors.black87,
                                          ));
                                        }
                                      },
                                      text: "Masuk",
                                      outlineRadius: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: c.sh * 20,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        filledShowDialog(
                                            context: context,
                                            title: 'Masukan Email',
                                            button: () {
                                              bool emailBenar = c.isEmail(_forgotPasswordMail.text);
                                              log(emailBenar.toString());
                                              if (emailBenar) {
                                                Get.back();
                                                showDialog<String>(
                                                  context: context,
                                                  builder: (BuildContext context) => AlertDialog(
                                                    title: Center(
                                                        child: Text(
                                                      'Email Terkirim',
                                                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
                                                    )),
                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                                    contentPadding: EdgeInsets.symmetric(horizontal: c.sw * 28.0, vertical: c.sh * 10),
                                                    content: Container(
                                                      height: c.sh * 60,
                                                      child: Text("Kami telah mengirim email ke sarahcb@gmail.com yang berisi tautan untuk mengatur ulang kata sandi anda.", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
                                                    ),
                                                    actions: <Widget>[
                                                      Center(
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: c.sw * 50),
                                                          child: BaseButton(
                                                            ontap: () {
                                                              Get.back();
                                                            },
                                                            text: "Oke",
                                                            outlineRadius: 10,
                                                            textSize: 14,
                                                            height: c.sh * 39,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: c.sh * 10,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                  content: Text('Please input correct Email'),
                                                  backgroundColor: Colors.black87,
                                                ));
                                              }
                                            },
                                            controller: _forgotPasswordMail,
                                            hint: "Inputkan email anda");
                                      },
                                      child: const Text("Lupa Password ?").p10m().primary()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: c.sh * 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: c.sw * 34.0),
                            child: Container(
                              width: c.sw * 322,
                              height: c.sh * 52,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 0.3,
                                    blurRadius: 5,
                                    offset: const Offset(0, 0.1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(const RegisterPage());
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Belum punya akun ?  ',
                                        style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Daftar Disini', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600, color: OPrimaryColor)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: c.sh * 75,
                          ),
                          const Text("© 2022 Starlife Clinic. All rights reserved.").p12r().grey(),
                          SizedBox(
                            height: c.sh * 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
