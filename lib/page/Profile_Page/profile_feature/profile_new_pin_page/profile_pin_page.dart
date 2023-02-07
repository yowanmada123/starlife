import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_list_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_new_pin_page/profile_new_pin_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfilePinPage extends StatefulWidget {
  const ProfilePinPage({super.key});

  @override
  State<ProfilePinPage> createState() => _ProfilePinPageState();
}

class _ProfilePinPageState extends State<ProfilePinPage> {
  final c = Get.put(GlobalController());
  String _otp = '';
  String text = '';
  List<String> pin = [];
  List<String> pinfix = ['2', '2', '2', '2', '2', '2'];
  TextEditingController controller = TextEditingController();
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
      for (int i = 0; i < pin.length; i++) {
        if (pinfix[i] != pin[i]) {
          setState(() {
            print("pin salah");
            truePin = false;
          });
          print("PIN SALAH");
          pinTrue = 0;
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
          truePin = true;
          pin.clear();
          clearNumber();
          sixTimeTrue = true;
        });
      }
      if (sixTimeTrue == true) {
        pinTrue = 0;
        truePin = true;
        pin.clear();
        clearNumber();
        sixTimeTrue = false;
        Get.to(const ProfileNewPinPage());
      }
      print(pinTrue);
      print("PIN NOT TRUE");
    } else {
      print("PIN NOT IN DIGIT");
      print("Inputkan PIN sebanyak 6 digit");
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
            child: Icon(
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
                height: c.sh * 10,
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
              SizedBox(
                height: c.sh * 250,
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
                height: c.sh * 20,
              ),
              GestureDetector(
                  onTap: () {
                    filledShowDialog(
                        barier: true,
                        context: context,
                        title: "Masukkan Email Anda",
                        button: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Column(
                                  children:[
                                    Icon(Icons.done_rounded, color: Colors.green, size: 50,),
                                    SizedBox(height: c.sh*10,),
                                    Container(
                                        width: c.sw * 170,
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
                          Future.delayed(const Duration(milliseconds: 800), () {
                            Get.close(3);
                          });
                        },
                        controller: controller,
                        hint: "Masukkan Email Anda");
                  },
                  child: Text("Lupa pin ?").p12r().primary())
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
          height: c.sh * 86,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: c.sh * 20),
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
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
          child: Container(
            height: c.sh * 235,
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
                  height: c.sh * 15,
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
                  height: c.sh * 15,
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
                  height: c.sh * 15,
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
                  height: c.sh * 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
