import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

class SudahImunisasi extends StatefulWidget {
  const SudahImunisasi({super.key});

  @override
  State<SudahImunisasi> createState() => _SudahImunisasiState();
}

class _SudahImunisasiState extends State<SudahImunisasi> {
  final c = Get.put(GlobalController());

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: ((context, index) {
            return const ItemList();
          })),
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
                    height: 145,
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
                              height: c.sh * 20,
                              width: c.sw * 120,
                              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xff20B09C)), borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: const Text(
                                  "Sudah Imunisasi",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xff2EC1AD)),
                                ).p10r(),
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
                        SizedBox(height: 2,),

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
                          height: c.sh * 8,
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: c.sh * 8,
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
        height: c.sh * 20,
      )
    ]);
  }
}
