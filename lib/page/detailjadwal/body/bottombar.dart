import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/main.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/periksa/tambah_pasien.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/base_showdialog.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            dialogBuilder(
                context: context,
                buttonLeft: () {
                  Get.back();
                  dialogBuilder(
                      context: context,
                      title: "Apakah Calon Pasien Termasuk Pasien Periksa Sekali Jalan ?",
                      buttonLeft: () {
                        Get.back();
                        Get.to(const TambahPasien());
                      },
                      buttonRight: () {},
                      leftTittle: "Bukan Termasuk",
                      rightTitle: "Ya, Termasuk");
                },
                buttonRight: () {},
                title: "Apakah Anda Sudah Memiliki Nomor Rekam Medis ?",
                leftTittle: 'Belum',
                rightTitle: "Sudah");
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
                child: Center(child: const Text("Buat Janji").p14m().white()),
              ),
            ),
          ),
        ));
  }
}
