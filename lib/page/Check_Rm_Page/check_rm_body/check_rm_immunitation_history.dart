import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/ext_text.dart';

class CheckRmImmunizationHistoryPage extends StatefulWidget {
  const CheckRmImmunizationHistoryPage({super.key});

  @override
  State<CheckRmImmunizationHistoryPage> createState() => _CheckRmImmunizationHistoryPageState();
}

class _CheckRmImmunizationHistoryPageState extends State<CheckRmImmunizationHistoryPage> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          const CustomTopBar(height: 115
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 97,
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                    child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: ((context, index) {
                          return index == 7
                              ? Column(
                                  children: [
                                    const ItemList(),
                                    SizedBox(height: 120,)
                                  ],
                                )
                              : const ItemList();
                        })),
                  ),
                )
              ],
            ),
          ),Container(
            color: Colors.transparent,
            height:    128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:    53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        const Text("Riwayat Imunisasi Anak").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
          
        ],
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final c = Get.put(GlobalController());
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
                    height: 140,
                    width: Get.width,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff2EC1AD),
                          // ignore: use_full_hex_values_for_flutter_colors
                          Color(0xfff28c6f5),
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
                              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xff20B09C)), borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Sudah Imunisasi",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xff2EC1AD)),
                                  ).p10r(),
                                ],
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
                          height:    6,
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height:    6,
                        ),
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
        height:    20,
      )
    ]);
  }
}
