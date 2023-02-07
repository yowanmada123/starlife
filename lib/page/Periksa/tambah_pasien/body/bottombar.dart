import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Periksa/daftar_pasien/daftar_pasien.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Periksa/tambah_pasien/patient_add.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../periksa_pasien_sekali_jalan/tambah_pasien_sekali_jalan.dart';

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
        child: GestureDetector(
          onTap: () {
            Get.to(const DaftarPasien());
          },
          child: Container(
            color: Colors.white,
            height: c.sh * 63,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                height: c.sh * 47,
                decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                child: Center(child: const Text("Simpan").p14m().white()),
              ),
            ),
          ),
        ));
  }
}
