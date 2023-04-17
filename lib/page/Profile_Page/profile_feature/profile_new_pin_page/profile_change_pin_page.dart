import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/controllers/auth_controller.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

// Halaman untuk mengubah PIN daripada user.

class ProfileChangePinPage extends StatefulWidget {
  const ProfileChangePinPage({super.key});

  @override
  State<ProfileChangePinPage> createState() => _ProfileChangePinPageState();
}

class _ProfileChangePinPageState extends State<ProfileChangePinPage> {
  final c = Get.put(GlobalController());
  final lc = Get.put(AuthController());
  final p = Get.put(ProfileController());

  final _oldPinController = TextEditingController(text: '');
  final _newPinController = TextEditingController(text: "");
  final _confirmNewPinController = TextEditingController(text: "");
  final _forgotPasswordMail = TextEditingController(text: "");
  bool _isObscure = true;
  var oldPin = '';

  // Fungsi yang berguna untuk mengambil data personal pasien yang juga berisi PIn
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      p.loadingPersonal.value = false;
      await p.getDataPersonal();
      // pinfix = p.person!.pincode.split('');
      print(p.person!.pincode);
      oldPin = p.person!.pincode;
    });
    // h.getDataNews();
    // loading.value = false;
  }

  // final bool isValid = EmailValidator.validate(email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              color: Colors.white,
            ),
            Positioned(
              top: -300,
              left: -200,
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
                            padding: EdgeInsets.only(top: 60.0),
                            child: Image.asset(
                              width: 143,
                              height: 173,
                              'assets/icon/ic_logo.png',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Anda Ingin Mengubah PIN?").p16b().white(),
                          const Text("Ubah sekarang!").p12r().white(),
                          const SizedBox(
                            height: 14,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 34.0),
                            child: Container(
                              width: 322,
                              height: 340,
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
                                  const Text("Ubah PIN RM").p16b().black(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 26),
                                    child: TextField(
                                      maxLength: 6,
                                      style: const TextStyle(color: Colors.black, fontSize: 14),
                                      controller: _oldPinController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        counter: const Offstage(),
                                        isDense: true,
                                        labelText: 'Masukkan PIN Lama',
                                        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 26),
                                    child: TextField(
                                      maxLength: 6,
                                      style: const TextStyle(color: Colors.black, fontSize: 14),
                                      controller: _newPinController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        counter: const Offstage(),
                                        isDense: true,
                                        labelText: 'Masukkan PIN Baru',
                                        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 26),
                                    child: TextField(
                                      maxLength: 6,
                                      style: const TextStyle(color: Colors.black, fontSize: 14),
                                      controller: _confirmNewPinController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        counter: const Offstage(),
                                        isDense: true,
                                        labelText: 'Masukkan Ulang PIN Baru',
                                        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
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
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 26),
                                    child: BaseButton(
                                      ontap: () async {
                                        // Get.back();
                                        if (_oldPinController.text != oldPin) {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            content: Text("Mohon Periksa Kembali PIN Lama Anda"),
                                            backgroundColor: Colors.black87,
                                          ));
                                        }
                                        // print(_oldPinController.text);
                                        // print(oldPin);

                                        if (_oldPinController.text.isNotEmpty && _newPinController.text.isNotEmpty && _confirmNewPinController.text.isNotEmpty) {
                                          if (_oldPinController.text == oldPin) {
                                            if (_newPinController.text == _confirmNewPinController.text) {
                                              if (_confirmNewPinController.text.length == 6) {
                                                var isTrue = c.isNumber(_confirmNewPinController.text);
                                                if (isTrue) {
                                                  if (_oldPinController.text != _confirmNewPinController.text) {
                                                    // String passwordBaru = confirmPin.join();
                                                    p.pinBaruController.text = _confirmNewPinController.text;
                                                    p.pinLamaController.text = _oldPinController.text;
                                                    var respon = await p.changePIN();
                                                    if (respon == "ok") {
                                                      // ignore: use_build_context_synchronously
                                                      CustomDialog(context);
                                                      Timer(const Duration(seconds: 1), () {
                                                        Get.close(2);
                                                      });
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                      content: Text("PIN Baru Tidak Boleh Sama Dengan PIN Lama"),
                                                      backgroundColor: Colors.black87,
                                                    ));
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                    content: Text('Mohon Isi PIN Hanya Dengan Angka'),
                                                    backgroundColor: Colors.black87,
                                                  ));
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                  content: Text("PIN Harus Terdiri Dari 6 Digit"),
                                                  backgroundColor: Colors.black87,
                                                ));
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text("Mohon Isi Konfirmasi PIN Dengan Tepat"),
                                                backgroundColor: Colors.black87,
                                              ));
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text("Mohon Periksa Kembali PIN Lama Anda"),
                                              backgroundColor: Colors.black87,
                                            ));
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            content: Text("Please Fill In The Blank"),
                                            backgroundColor: Colors.black87,
                                          ));
                                        }

                                        // bool isEmail = c.isEmail(_emailController.text);
                                        // if (!_emailController.text.isEmpty && !_passwordController.text.isEmpty) {
                                        //   if (isEmail) {
                                        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        //       content: Text('Login Success'),
                                        //       backgroundColor: Colors.black87,
                                        //     ));
                                        //     Get.offAll(HelloConvexAppBar());
                                        //     // lc.email = _emailController.text;
                                        //     // lc.password = _passwordController.text;
                                        //     // lc.login();
                                        //   } else {
                                        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        //       content: Text('Please fill correct Email'),
                                        //       backgroundColor: Colors.black87,
                                        //     ));
                                        //   }
                                        // } else {
                                        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        //     content: Text('Please Fill in the blank'),
                                        //     backgroundColor: Colors.black87,
                                        //   ));
                                        // }
                                      },
                                      text: "Simpan",
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
                                                    content: Container(
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
                                      child: const Text("Lupa PIN ?").p10m().primary()),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 75,
                          ),
                          const Text("© 2022 Starlife Clinic. All rights reserved.").p12r().grey(),
                          const SizedBox(
                            height: 20,
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

Future<String?> CustomDialog(BuildContext context) {
  final c = Get.put(GlobalController());
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Column(children: [
        const Icon(
          Icons.done_rounded,
          color: Colors.green,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 170,
          child: Text(
            "Berhasil Mengubah Mengubah PIN",
            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        )
      ]),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
    ),
  );
}
