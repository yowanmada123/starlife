import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

class ProfileImmunizationSchedule extends StatefulWidget {
  const ProfileImmunizationSchedule({super.key});

  @override
  State<ProfileImmunizationSchedule> createState() => _ProfileImmunizationScheduleState();
}

class _ProfileImmunizationScheduleState extends State<ProfileImmunizationSchedule> {
  final c = Get.put(GlobalController());
  final List<String> rangeItem = [
    'Hari ini',
    'Besok',
    '3 Hari Lagi',
    '5 Hari Lagi',
    'Seminggu Lagi',
  ];
  String? selectedValue;
  TextEditingController rangeController = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: ((context, index) {
              return index == 7
                  ? Column(
                      children: [
                        const ItemList(),
                        SizedBox(
                          height:    80,
                        ),
                      ],
                    )
                  : const ItemList();
            })),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: Get.width,
            height:    70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text("Jadwal Imunisasi: ").p14b().black()),
                  Expanded(
                    flex: 1,
                    child: Form(
                      key: _formKey,
                      child: DropdownButtonFormField2(
                        isDense: false,
                        decoration: InputDecoration(
                            //Add isDense true and zero Paddi

                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide(
                              //   color: Colors.yellow,
                              // ),
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey))
                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                            ),
                        isExpanded: true,
                        hint: Text(
                          "Pilih salah satu",
                          style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: OPrimaryColor,
                        ),
                        iconOnClick: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: OPrimaryColor,
                        ),
                        // dropdownElevation: 5,
                        iconSize: 15,
                        buttonHeight:    43,
                        // buttonWidth: c.sw*150,
                        buttonPadding: const EdgeInsets.only(right: 10),
                        dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey)),
                        items: rangeItem
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select range.';
                          }
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                          rangeController.value = selectedValue as TextEditingValue;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ]);
  }
}

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final c = Get.put(GlobalController());
  String dateTime = 'dd/mm/yyyy';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 175,
                    width: Get.width,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff2EC1AD),
                          Color(0xfff28C6F5),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height:    20,
                              width: c.sw * 120,
                              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xffFEBACB)), borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: const Text(
                                  "Belum Imunisasi",
                                  textAlign: TextAlign.center,
                                ).p10r().red(),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Imunisasi BCG",
                          textAlign: TextAlign.center,
                        ).p20b().white(),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Umur Anak",
                                      textAlign: TextAlign.center,
                                    ).p12r().white(),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      ": Baru lahir - 1 Bulan",
                                      textAlign: TextAlign.center,
                                    ).p12m().white(),
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(height: 2,),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tanggal Imunisasi",
                                      textAlign: TextAlign.center,
                                    ).p12r().white(),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      ": 10 Januari 2023",
                                      textAlign: TextAlign.center,
                                    ).p12m().white(),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: 2,),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "No. Rekam Medis",
                                      textAlign: TextAlign.center,
                                    ).p12r().white(),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      ": RM1020",
                                      textAlign: TextAlign.center,
                                    ).p12m().white(),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height:    8,
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height:    8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: BaseButton(
                                ontap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2099),
                                  ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                                    setState(() {
                                      // dateTime = date!.toDateHuman();
                                    });
                                  });
                                },
                                text: "Ubah Tanggal Imunisasi",
                                color: Colors.white,
                                outlineRadius: 6,
                                textColor: OPrimaryColor,
                                textSize: 10,
                                textWeight: FontWeight.w600,
                                height: 27,
                              )),
                              SizedBox(
                                width: c.sw * 10,
                              ),
                              Expanded(
                                  child: BaseButton(
                                ontap: () {
                                  Get.to(const PatientQueuePage(), transition: Transition.fadeIn);
                                },
                                text: "Ambil Antrian Imunisasi",
                                color: const Color(0xff2EC1AD),
                                outlineRadius: 6,
                                textColor: Colors.white,
                                textSize: 10,
                                textWeight: FontWeight.w600,
                                height: 27,
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ])
                // FormDataPasien(),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height:    12,
      )
    ]);
  }
}
