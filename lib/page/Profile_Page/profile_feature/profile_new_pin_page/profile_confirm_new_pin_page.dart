import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_list_page.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileNewPinConfirmPage extends StatefulWidget {
  const ProfileNewPinConfirmPage({super.key, required this.newPin});
  final List<String> newPin;

  @override
  State<ProfileNewPinConfirmPage> createState() => _ProfileNewPinConfirmPageState();
}

class _ProfileNewPinConfirmPageState extends State<ProfileNewPinConfirmPage> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());
  String _otp = '';
  String text = '';
  List<String> confirmPin = [];
  // List<String> confirmPinfix = ['2', '2', '2', '2', '2', '2'];

  var truePin = true.obs;
  int samePin = 0;

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

  cekPin() async {
    if (confirmPin.length == 6) {
      for (int i = 0; i < confirmPin.length; i++) {
        if (widget.newPin[i] == confirmPin[i]) {
          samePin++;
        }
      }
      if (samePin == 6) {
        String passwordBaru = confirmPin.join();
        p.pinBaruController.text = passwordBaru;
        var respon = await p.changePIN();
        if (respon == "ok") {
          // ignore: use_build_context_synchronously
          CustomDialog(context);
          Timer(const Duration(seconds: 1), () {
            Get.close(4);
          });
        }
      } else {
        setState(() {
          samePin = 0;
          truePin.value = false;
          confirmPin.clear();
          clearNumber();
        });
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            truePin.value = true;
            // print(truePin);
          });
          // print("Executed after 1 minute 4 seconds");
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Konfirmasi PIN Baru Dengan Tepat'),
          backgroundColor: Colors.black87,
        ));
      }
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('PIN Yang Anda Isikan Kurang Tepat !!!'),
      //     backgroundColor: Colors.black87,
      //   ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Konfirmasi PIN Baru Dengan Tepat'),
        backgroundColor: Colors.black87,
      ));
      setState(() {
        samePin = 0;
        truePin.value = false;
        confirmPin.clear();
        clearNumber();
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          truePin.value = true;
          // print(truePin);
        });
        // print("Executed after 1 minute 4 seconds");
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
              const Text("Konfirmasi PIN Baru Anda").p16b().black(),
              SizedBox(
                height: 10,
              ),
              if (truePin == true) ...[
                const Text("Mohon Konfirmasi PIN Baru Anda").p12r().black(),
              ] else ...[
                const Text("Konfirmasi PIN Baru Dengan Tepat").p14r().red(),
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
                              : (truePin.value)
                                  ? inActiveColor
                                  : Colors.red)
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BaseButton(
            ontap: () {
              // print(confirmPin.length);
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 235,
            width: Get.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("1");
                            addNumber();
                          }
                          // print(confirmPin);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: const Text(
                            "1",
                          ).p16m().black()),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("2");
                            addNumber();
                          }
                          // print(confirmPin);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: const Text(
                            "2",
                          ).p16m().black()),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("3");
                            addNumber();
                          }
                          print(confirmPin);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: const Text(
                            "3",
                          ).p16m().black()),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                            if (confirmPin.length < 6) {
                              confirmPin.add("4");
                              addNumber();
                            }
                            print(confirmPin);
                            print(confirmPin.length);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: const Text(
                              "4",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (confirmPin.length < 6) {
                              confirmPin.add("5");
                              addNumber();
                            }
                            print(confirmPin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: const Text(
                              "5",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (confirmPin.length < 6) {
                              confirmPin.add("6");
                              addNumber();
                            }
                            print(confirmPin);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: const Text(
                              "6",
                            ).p16m().black()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("7");
                            addNumber();
                          }
                          // print(confirmPin);
                          // print(confirmPin.length);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: const Text(
                            "7",
                          ).p16m().black()),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("8");
                            addNumber();
                          }
                          // print(confirmPin);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: const Text(
                            "8",
                          ).p16m().black()),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("9");
                            addNumber();
                          }
                          print(confirmPin);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: const Text(
                            "9",
                          ).p16m().black()),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length < 6) {
                            confirmPin.add("0");
                            addNumber();
                          }
                          print(confirmPin);
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
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (confirmPin.length > 0) {
                            removeNumber();

                            confirmPin.removeLast();
                            print(confirmPin);
                          }
                        },
                        child: const Center(
                            child: Icon(
                          Icons.backspace_rounded,
                          size: 30,
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
