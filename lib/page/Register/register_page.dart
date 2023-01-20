import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Login/login_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/base_form.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final c = Get.put(GlobalController());
  final lc = Get.put(LoginController());
  final _namaController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _nomorController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: "");
  final _konfirmasiPassword = TextEditingController(text: "");
  bool _isObscure = true;
  bool _isPasswordObscure = true;
  bool _isSyarat = false;

  // final bool isValid = EmailValidator.validate(email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(left: c.sw * 32.0, top: 50),
                  child: GestureDetector(
                    onTap: (() => Get.back()),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white, // Button color
                        child: SizedBox(
                            width: 32,
                            height: 32,
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 7.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 17,
                                  color: Colors.black,
                                ),
                              )
                            ])),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: c.sh * 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Daftar Akun").p20b().white(),
                  ],
                ),
                SizedBox(
                  height: c.sh * 14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: c.sw * 34.0),
                  child: Container(
                    width: c.sw * 322,
                    height: c.sh * 544,
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
                        Container(
                            width: 222,
                            height: 48,
                            child: const Text(
                              "Isi Sesuai dengan Identitas Anda",
                              textAlign: TextAlign.center,
                            ).p16b().black()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                          child: BaseForm(controller: _namaController, title: "Nama Lengkap"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                          child: BaseForm(controller: _emailController, title: "Email"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                          child: BaseForm(controller: _nomorController, title: "Nomor HP"),
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
                          height: c.sh * 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                          child: TextField(
                            style: const TextStyle(color: Colors.black, fontSize: 14),
                            controller: _konfirmasiPassword,
                            obscureText: _isPasswordObscure,
                            decoration: InputDecoration(
                              labelText: 'Konfirmasi Password',
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
                                      _isPasswordObscure = !_isPasswordObscure;
                                    });
                                  },
                                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: c.sh * 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: c.sw * 26),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isSyarat = !_isSyarat;
                                  });
                                  log(_isSyarat.toString());
                                },
                                child: Container(
                                  height: c.sh * 15,
                                  width: c.sw * 15,
                                  decoration: BoxDecoration(color: _isSyarat ? OPrimaryColor : Color(0xffEAEAEA)),
                                  child: _isSyarat
                                      ? const Icon(
                                          Icons.check,
                                          size: 13,
                                          color: Colors.white,
                                        )
                                      : Container(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: c.sw * 9,
                            ),
                            const Text("Menyetujui syarat dan persetujuan").p10r().primary(),
                          ],
                        ),
                        SizedBox(
                          height: c.sh * 50,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: c.sw * 26),
                          child: BaseButton(
                            ontap: () {
                              bool isEmail = c.isEmail(_emailController.text);
                              bool isPhone = c.isPhone(_nomorController.text);
                              if(_isSyarat){
                                if (!_emailController.text.isEmpty && !_passwordController.text.isEmpty && !_emailController.text.isEmpty && !_nomorController.text.isEmpty && !_passwordController.text.isEmpty && !_konfirmasiPassword.text.isEmpty) {
                                if (isEmail) {
                                  if (isPhone) {
                                    if (_passwordController.text == _konfirmasiPassword.text) {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('AKUN SUKSES DIBUAT'),
                                        backgroundColor: Colors.black87,
                                      ));
                                      // lc.email = _emailController.text;
                                      // lc.password = _passwordController.text;
                                      // lc.login();
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Password & Konfirmasi Password is not same'),
                                        backgroundColor: Colors.black87,
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Please fill the phone just with Numeric'),
                                      backgroundColor: Colors.black87,
                                    ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Please input correct Email'),
                                    backgroundColor: Colors.black87,
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Please fill in the blank'),
                                  backgroundColor: Colors.black87,
                                ));
                              }
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Please agree with the terms and conditions'),
                                        backgroundColor: Colors.black87,
                                      ));
                              }
                            },
                            text: "Daftar",
                            outlineRadius: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: c.sh * 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("© 2022 Starlife Clinic. All rights reserved.").p12r().grey(),
                  ],
                ),
                SizedBox(
                  height: c.sh * 20,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
