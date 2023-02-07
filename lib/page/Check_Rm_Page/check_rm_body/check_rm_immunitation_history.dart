import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_account_information_page/profile_data_form.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/ext_text.dart';

class RiwayatImunisasiAnakPage extends StatefulWidget {
  const RiwayatImunisasiAnakPage({super.key});

  @override
  State<RiwayatImunisasiAnakPage> createState() => _RiwayatImunisasiAnakPageState();
}

class _RiwayatImunisasiAnakPageState extends State<RiwayatImunisasiAnakPage> {
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
          CustomTopBar(
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: c.sh * 109,
                ),
                Container(
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
                                    SizedBox(height: c.sh*120,)
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
            height: c.sh * 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: c.sh * 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Text("Riwayat Imunisasi Anak").p16b().white(),
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
                    height: c.sh * 160,
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
                              child: Text(
                                "Sudah Imunisasi",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xff2EC1AD)),
                              ).p12r(),
                            )
                          ],
                        ),
                        Text(
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
                                    Text(
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
                                    Text(
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
                                    Text(
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
                                    Text(
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
                                    Text(
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
                                    Text(
                                      ": RM1020",
                                      textAlign: TextAlign.center,
                                    ).p12m().white(),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: c.sh * 6,
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: c.sh * 6,
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
