import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/controllers/auth_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/services/services.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
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
  final lc = Get.put(AuthController());
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: "");
  final _forgotPasswordMail = TextEditingController(text: "");
  bool _isObscure = true;
  final service = Services();

  // final bool isValid = EmailValidator.validate(email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          Positioned(
            top: -300,
            left: -165,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: OPrimaryColor),
            ),
          ),
          Positioned(
              top: -200,
              left: -140,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(400)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    width: 676,
                    height: 610,
                    'assets/icon/ic_logo_crop.png',
                    // color: Colors.white.withOpacity(0.15),
                    colorBlendMode: BlendMode.modulate,
                  ),
                  // Image.network(width:   676, height:   610, p.person!.picture, errorBuilder: (context, error, stackTrace) {
                  //   return Image.asset("assets/images/img_avatar.png");
                  // }),
                ),
              )),
          SizedBox(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              width: 143,
                              height: 173,
                              'assets/icon/ic_logo.png',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text("Selamat Datang !").p20b().white(),
                            const Text("Masuk untuk lanjut").p12r().white(),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 322,
                          height: 320,
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
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Masuk Akun").p16b().black(),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26),
                                child: TextField(
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    isDense: true,
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
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26),
                                child: TextField(
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  controller: _passwordController,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    isDense: true,
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
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26),
                                child: BaseButton(
                                  ontap: () {
                                    // lc.firstRegister();
                                    bool isEmail = c.isEmail(_emailController.text);
                                    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                                      if (isEmail) {
                                        lc.email = _emailController.text;
                                        lc.password = _passwordController.text;
                                        lc.login(context);
                                        // service.login();
                                        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        //   content: Text('Login Success'),
                                        //   backgroundColor: Colors.black87,
                                        // ));
                                        // c.isLogin.value = true;
                                        // Get.offAll(HelloConvexAppBar());

                                        //==============================================================================================================================================
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
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    filledShowDialog(
                                        barier: false,
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
                                                contentPadding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
                                                content: SizedBox(
                                                  height: 60,
                                                  child: Text("Kami telah mengirim email ke sarahcb@gmail.com yang berisi tautan untuk mengatur ulang kata sandi anda.", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
                                                ),
                                                actions: <Widget>[
                                                  Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 50),
                                                      child: BaseButton(
                                                        ontap: () {
                                                          Get.back();
                                                        },
                                                        text: "Oke",
                                                        outlineRadius: 10,
                                                        textSize: 14,
                                                        height: 39,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
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
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.0),
                    child: Container(
                      width: 322,
                      height: 52,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("© 2022 Starlife Clinic. All rights reserved.").p12r().grey(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
