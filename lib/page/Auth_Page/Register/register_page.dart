import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/auth_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/base_form.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilan Halaman Register untuk user.
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final c = Get.put(GlobalController());
  final lc = Get.put(AuthController());
  final _namaController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _nomorController = TextEditingController(text: '');
  final _pinRmController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  final _konfirmasiPassword = TextEditingController(text: "");
  bool _isObscure = true;
  bool _isPasswordObscure = true;
  bool _isPinRmObscure = true;
  bool _isSyarat = false;

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
              width: 844,
              height: 844,
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
                    width: 676,
                    height: 663,
                    'assets/icon/ic_logo_crop.png',
                    // color: Colors.white.withOpacity(0.15),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              )),
          Positioned(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
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
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Daftar Akun").p20b().white(),
                  ],
                )
              ]),
            ],
          )),
          Positioned(
            left: -14,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(
                height: 130,
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                child: Container(
                  width: 322,
                  height: 540,
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
                        height: 15,
                      ),
                      SizedBox(
                          width: 222,
                          height: 48,
                          child: const Text(
                            "Isi Sesuai dengan Identitas Anda",
                            textAlign: TextAlign.center,
                          ).p16b().black()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: BaseForm(controller: _namaController, title: "Nama Lengkap"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: BaseForm(controller: _emailController, title: "Email"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: BaseForm(
                          controller: _nomorController,
                          title: "Nomor HP",
                          hintText: "ex : +62822315326445",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: TextField(
                          maxLength: 6,
                          style: const TextStyle(color: Colors.black, fontSize: 14),
                          controller: _pinRmController,
                          obscureText: _isPinRmObscure,
                          decoration: InputDecoration(
                            counter: const Offstage(),
                            labelText: 'Pin RM',
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
                                    _isPinRmObscure = !_isPinRmObscure;
                                  });
                                },
                                icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
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
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 26),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSyarat = !_isSyarat;
                                });
                                log(_isSyarat.toString());
                              },
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(color: _isSyarat ? OPrimaryColor : const Color(0xffEAEAEA)),
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
                          const SizedBox(
                            width: 9,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSyarat = !_isSyarat;
                                });
                                log(_isSyarat.toString());
                              },
                              child: const Text("Menyetujui syarat dan persetujuan").p10r().primary()),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: BaseButton(
                          ontap: () {
                            // button Register
                            bool isEmail = c.isEmail(_emailController.text);
                            bool isPhone = c.isPhone(_nomorController.text);
                            bool isNum = c.isNumber(_pinRmController.text);
                            if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _emailController.text.isNotEmpty && _nomorController.text.isNotEmpty && _passwordController.text.isNotEmpty && _konfirmasiPassword.text.isNotEmpty) {
                              if (isEmail) {
                                if (isPhone) {
                                  if (isNum) {
                                    if (_pinRmController.text.length == 6) {
                                      if (_passwordController.text == _konfirmasiPassword.text) {
                                        if (_isSyarat) {
                                          lc.name = _namaController.text;
                                          lc.email = _emailController.text;
                                          lc.phone = _nomorController.text;
                                          lc.pinrm = _pinRmController.text;
                                          lc.password = _passwordController.text;

                                          // Pemanggilan fungsi Register
                                          lc.register(context);
                                          // ============================
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            content: Text('Please agree with the terms and conditions'),
                                            backgroundColor: Colors.black87,
                                          ));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('Password & Konfirmasi Password is not same'),
                                          backgroundColor: Colors.black87,
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('The PIN must consist of 6 digits'),
                                        backgroundColor: Colors.black87,
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Please fill the PIN only with numeric'),
                                      backgroundColor: Colors.black87,
                                    ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Please fill in the cellphone number column with the prefix +628...'),
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
                          },
                          text: "Daftar",
                          outlineRadius: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("© 2022 Starlife Clinic. All rights reserved.").p12r().grey(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
