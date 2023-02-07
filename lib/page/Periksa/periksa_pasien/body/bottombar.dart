import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/main.dart';
import 'package:starlife/page/Periksa/daftar_pasien/daftar_pasien.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Periksa/tambah_pasien/patient_add.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../Home_Page/navigationbar/navigationbar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final c = Get.put(GlobalController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          color: Colors.white,
          height: c.sh * 63,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      filledShowDialog(
                        barier: false,
                          context: context,
                          title: "Masukkan No. Rekam Medis",
                          button: () {
                            // Get.to(const BelumAdaPasien());
                            Get.back();
                          },
                          controller: controller,
                          hint: "Masukkan No. Rekam Medis Anda");
                    },
                    child: Container(
                      height: c.sh * 47,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                      child: Center(child: const Text("Bukan").p14m().primary()),
                    ),
                  ),
                ),
                SizedBox(
                  width: c.sw * 12,
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                        Get.to(const DaftarPasien());
                    },
                    child: Container(
                      height: c.sh * 47,
                      decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                      child: Center(child: const Text("Ya, Betul").p14m().white()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}