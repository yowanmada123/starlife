import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_list_page.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

// Halaman Input PIN untuk mengakses Rekam Medis. 
class PinPage extends StatefulWidget {
  const PinPage({
    super.key,
    required this.patient,
    // required this.name
  });
  // final String name;
  final Patient patient;

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  // Fungsi yang berguna untuk spliting pincode  menjadi array.
  @override
  void initState() {
    super.initState();
    pinfix = widget.patient.pincode.split('');
  }

  final c = Get.put(GlobalController());
  String _otp = '';
  String text = '';
  bool visibleKeypad = false;
  List<String> pin = [];
  // List<String> pinfix = ['2', '2', '2', '2', '2', '2'];
  List<String> pinfix = [];
  TextEditingController controller = TextEditingController(text: "");
  var truePin = true.obs;
  bool sixTimeTrue = false;
  int pinTrue = 0;

  // Fungsi yang berguna untuk menambahkan panjang daripada pin ketika di angka dipilih
  addNumber() {
    setState(() {
      if (_otp.length < 6) {
        _otp += '0';
      }
    });
  }

  // Fungsi yang berguna untuk mengurangi panjang daripada pin ketika button backspace di pilih
  removeNumber() {
    setState(() {
      if (_otp.isNotEmpty) {
        _otp = _otp.substring(0, _otp.length - 1);
      }
    });
  }

  // Fungsi yang berguna untuk menghapus isi daripada PIN
  clearNumber() {
    _otp = '';
  }

  // Fungsi yang berguna untuk  clear PIN yang telah diiputkan
  clearPin() {
    pin.clear();
  }

  // Fungsi yang berguna untuk Check dan validasi apakah PIN yagn diinputkan benar.
  cekPin() {
    if (pin.length == 6) {
      for (int i = 0; i < pin.length; i++) {
        if (pinfix[i] != pin[i]) {
          setState(() {
            // print("pin salah");
            truePin.value = false;
          });
          // print("PIN SALAH");
          pinTrue = 0;
          clearNumber();
          clearPin();
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              truePin.value = true;
              // print(truePin);
            });
            // print("Executed after 1 minute 4 seconds");
          });
          // truePin = true;
        } else {
          // print("PIN CHECKED");
          setState(() {
            pinTrue++;
            // clearNumber();
          });
        }
      }
      if (pinTrue == 6) {
        setState(() {
          // print("pin benar");
          pinTrue++;
          truePin.value = true;
          pin.clear();
          clearNumber();
          sixTimeTrue = true;
        });
      }
      if (sixTimeTrue == true) {
        pinTrue = 0;
        Get.off(CheckRmListPage(
          name: widget.patient.fname,
        ));
      }
      // print(pinTrue);
      // print("PIN NOT TRUE");
    } else {
      // clearNumber();
      // print("PIN NOT IN DIGIT");
      // print("Inputkan PIN sebanyak 6 digit");
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
              const SizedBox(
                height: 10,
              ),
              Obx(() => (truePin.value) ? const Text("Mohon Masukkan PIN Anda").p12r().black() : const Text("PIN tidak sesuai. Silahkan coba lagi").p14r().red())
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
              const SizedBox(
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
                      Obx(() => CircleAvatar(
                          radius: (truePin.value) ? 10 : 12,
                          // NOTE: This is the actual condition of setting the placeholder dot color
                          backgroundColor: index ~/ 2 < _otp.length
                              ? (truePin.value)
                                  ? OPrimaryColor
                                  : Colors.red
                              : (truePin.value)
                                  ? inActiveColor
                                  : Colors.red))
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
            height: 86,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: BaseButton(
              ontap: () {
                // print(pin.length);
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Visibility(
            visible: visibleKeypad,
            child: SizedBox(
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
                              // print(pin);
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
                              if (pin.length < 6) {
                                pin.add("2");
                                addNumber();
                              }
                              // print(pin);
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
                              if (pin.length < 6) {
                                pin.add("3");
                                addNumber();
                              }
                              // print(pin);
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
                              if (pin.length < 6) {
                                pin.add("4");
                                addNumber();
                              }
                              // print(pin);
                              // print(pin.length);
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
                              if (pin.length < 6) {
                                pin.add("5");
                                addNumber();
                              }
                              // print(pin);
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
                              if (pin.length < 6) {
                                pin.add("6");
                                addNumber();
                              }
                              // print(pin);
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
                              // print(pin);
                              // print(pin.length);
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
                              if (pin.length < 6) {
                                pin.add("8");
                                addNumber();
                              }
                              // print(pin);
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
                              if (pin.length < 6) {
                                pin.add("9");
                                addNumber();
                              }
                              // print(pin);
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
                              // print(pin);
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
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (pin.isNotEmpty) {
                                removeNumber();
                                pin.removeLast();
                                // print(pin);
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
                  const SizedBox(
                    height: 15,
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
