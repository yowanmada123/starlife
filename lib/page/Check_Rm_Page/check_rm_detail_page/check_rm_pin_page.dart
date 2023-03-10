import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_list_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key, required this.name});
  final String name;

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final c = Get.put(GlobalController());
  String _otp = '';
  String text = '';
  bool visibleKeypad = false;
  List<String> pin = [];
  List<String> pinfix = ['2', '2', '2', '2', '2', '2'];
  TextEditingController controller = TextEditingController(text: "");
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
        Get.to(CheckRmListPage(
          name: widget.name,
        ));
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
                height: c.sh * 10,
              ),
              if (truePin == true) ...[
                const Text("Mohon Masukkan PIN Anda").p12r().black(),
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
          onTap: () {
            setState(() {
              visibleKeypad = !visibleKeypad;
            });
          },
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
                                  SizedBox(
                                    height: c.sh * 10,
                                  ),
                                  SizedBox(
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
        customKeypad()
      ]),
    );
  }

  Widget customKeypad() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: (pin.length == 6) ? true : false,
          child: Container(
            height: c.sh * 86,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: c.sh * 20),
            child: BaseButton(
              ontap: () {
                print(pin.length);
                cekPin();
              },
              color: OPrimaryColor,
              text: "Verifikasi",
              outlineRadius: 10,
              textSize: 14,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
          child: Visibility(
            visible: visibleKeypad,
            child: SizedBox(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                                  child: const Text(
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
                            child: const Center(
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
        ),
      ],
    );
  }
}
