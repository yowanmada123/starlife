import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_list_page.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileNewPinPage extends StatefulWidget {
  const ProfileNewPinPage({super.key});

  @override
  State<ProfileNewPinPage> createState() => _ProfileNewPinPageState();
}

class _ProfileNewPinPageState extends State<ProfileNewPinPage> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());
  String _otp = '';
  String text = '';
  List<String> pin = [];
  // List<String> pinfix = ['2', '2', '2', '2', '2', '2'];

  bool truePin = true;
  bool sixTimeTrue = false;
  int pinTrue = 0;
  addNumber() {
    setState(() {
      if (_otp.length < 6) {
        _otp += '0';
      }
    });
  }

  removeNumber() {
    setState(() {
      if (_otp.isNotEmpty) {
        _otp = _otp.substring(0, _otp.length - 1);
      }
    });
  }

  clearNumber() {
    _otp = '';
  }

  cekPin() {
    if (pin.length == 6) {
      p.changePIN();
      CustomDialog(context);
      Timer(Duration(seconds: 1), () {
        Get.close(3);
      });
    } else {
      setState(() {
        truePin = false;
      });
    }
  }

  Future<String?> CustomDialog(BuildContext context) {
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
            width: c.sw * 170,
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

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF4E94D8);
    const inActiveColor = Color(0xFFC8CDD1);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120, // Set
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            )),
        shadowColor: Colors.white,
        title: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Masukkan PIN").p16b().black(),
              SizedBox(
                height: 10,
              ),
              if (truePin == true) ...[
                const Text("Buat Baru PIN Anda").p12r().black(),
              ] else ...[
                const Text("Mohon Isi PIN Dengan Tepat").p14r().red(),
              ]
            ],
          ),
        ]),
        centerTitle: true,
      ),
      body: Stack(children: [
        GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TextButton(onPressed: clearText, child: Text("data")),
              SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // (NOTE: 2 * 6 - 1) This one to add spaces between the placeholder dots, note that the index would be used
                  // in form of (index ~/ 2) to get the original index back
                  for (int index = 0; index < 2 * 6 - 1; index++)
                    if (index.isEven)
                      // NOTE: Adding a dot placeholder
                      CircleAvatar(
                        radius: (truePin == true) ? 10 : 12,
                        // NOTE: This is the actual condition of setting the placeholder dot color
                        backgroundColor: index ~/ 2 < _otp.length
                            ? (truePin == true)
                                ? OPrimaryColor
                                : Colors.red
                            : inActiveColor,
                      )
                    else
                      // NOTE: Adding a space
                      const SizedBox(width: 24),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        CustomKeypad()
      ]),
    );
  }

  Widget CustomKeypad() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 86,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: 20),
          child: BaseButton(
            ontap: () {
              print(pin.length);
              cekPin();
            },
            color: OPrimaryColor,
            text: "Verifikasi",
            outlineRadius: 10,
            textSize: 14,
            textWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
          child: Container(
            height: 235,
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("1");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "1",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("2");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "2",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("3");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "3",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("4");
                              addNumber();
                            }
                            print(pin);
                            print(pin.length);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "4",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("5");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "5",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("6");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "6",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("7");
                              addNumber();
                            }
                            print(pin);
                            print(pin.length);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "7",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("8");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "8",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("9");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "9",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            // pin.add("1");
                            // print(pin);
                          },
                          // child: Center(
                          //     child: Icon(
                          //   Icons.done,
                          //   size: 30,
                          //   color: (pin.length == 6) ? Colors.green : Color.fromARGB(255, 205, 205, 205),
                          // )),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length < 6) {
                              pin.add("0");
                              addNumber();
                            }
                            print(pin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              "0",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (pin.length > 0) {
                              removeNumber();
                              pin.removeLast();
                              print(pin);
                            }
                          },
                          child: Center(
                              child: Icon(
                            Icons.backspace_rounded,
                            size: 30,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
