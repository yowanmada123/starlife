import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_list_page.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_new_pin_page/profile_new_pin_page.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfilePinPage extends StatefulWidget {
  const ProfilePinPage({
    super.key,
    // required this.patient
  });
  // final Patient patient;

  @override
  State<ProfilePinPage> createState() => _ProfilePinPageState();
}

class _ProfilePinPageState extends State<ProfilePinPage> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  String _otp = '';
  String text = '';
  List<String> pin = [];
  List<String> pinfix = [];
  // List<String> pinfix = ['2', '2', '2', '2', '2', '2'];
  TextEditingController controller = TextEditingController();
  var truePin = true.obs;
  bool sixTimeTrue = false;
  int pinTrue = 0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      p.loadingPersonal.value = false;
      await p.getDataPersonal();
      pinfix = p.person!.pincode.split('');
      print(p.person!.pincode);
    });
    // h.getDataNews();
    // loading.value = false;
  }

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

  clearPin() {
    pin.clear();
  }

  cekPin() {
    if (pin.length == 6) {
      for (int i = 0; i < pin.length; i++) {
        if (pinfix[i] != pin[i]) {
          setState(() {
            print("pin salah");
            truePin.value = false;
          });
          print("PIN SALAH");
          pinTrue = 0;
          clearNumber();
          clearPin();
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              truePin.value = true;
            });
          });
        } else {
          print("PIN CHECKED");
          setState(() {
            pinTrue++;
          });
        }
      }
      if (pinTrue == 6) {
        setState(() {
          print("pin benar");
          pinTrue++;
          truePin.value = true;
          pin.clear();
          clearNumber();
          sixTimeTrue = true;
        });
      }
      if (sixTimeTrue == true) {
        pinTrue = 0;
        truePin.value = true;
        Get.to(ProfileNewPinPage(
          myPin: pinfix,
        ));
        pin.clear();
        clearNumber();
        sixTimeTrue = false;
      }
    } else {
      setState(() {
        truePin.value = false;
        pin.clear();
        clearNumber();
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          truePin.value = true;
        });
      });
    }
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
              const SizedBox(
                height: 10,
              ),
              if (truePin == true) ...[
                const Text("Mohon Masukkan PIN Anda Saat Ini").p12r().black(),
              ] else ...[
                const Text("PIN tidak sesuai. Silahkan coba lagi").p14r().red(),
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
              const SizedBox(
                height: 200,
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    filledShowDialog(
                        barier: true,
                        context: context,
                        title: "Masukkan Email Anda",
                        button: () {
                          if (controller.text.isNotEmpty && c.isEmail(controller.text)) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Column(children: [
                                  const Icon(
                                    Icons.done_rounded,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      "Mohon Cek Email Anda untuk mengubah PIN",
                                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ]),
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                              ),
                            );
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              Get.close(3);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Please fill correct Email'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        controller: controller,
                        hint: "Masukkan Email Anda");
                  },
                  child: const Text("Lupa pin ?").p12r().primary())
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
              print(pin.length);
              cekPin();
            },
            color: OPrimaryColor,
            text: "Lanjut",
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
                        width: 15,
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
                        width: 15,
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
                        width: 15,
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
                        width: 15,
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
                        width: 15,
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
                        width: 15,
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
                        width: 15,
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
                        width: 15,
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
