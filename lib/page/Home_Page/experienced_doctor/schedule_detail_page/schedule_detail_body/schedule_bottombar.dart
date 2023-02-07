import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/main.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Periksa/periksa_pasien/belum_ada_pasien.dart';
import 'package:starlife/page/Periksa/tambah_pasien/patient_add.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../../Periksa/periksa_pasien_sekali_jalan/tambah_pasien_sekali_jalan.dart';

class ScheduleDoctorBottomBar extends StatefulWidget {
  const ScheduleDoctorBottomBar({super.key});

  @override
  State<ScheduleDoctorBottomBar> createState() => _ScheduleDoctorBottomBarState();
}

class _ScheduleDoctorBottomBarState extends State<ScheduleDoctorBottomBar> {
  final c = Get.put(GlobalController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            dialogBuilder(
              barier: true,
                context: context,
                buttonLeft: () {
                  Get.back();
                  dialogBuilder(
                      context: context,
                      title: "Apakah Calon Pasien Termasuk Pasien Periksa Sekali Jalan ?",
                      buttonLeft: () {
                        Get.back();
                        Get.to(const PatientAdd());
                      },
                      buttonRight: () {
                        // Get.back();
                        Get.to(const TambahPasienSekaliJalan());
                      },
                      leftTittle: "Bukan Termasuk",
                      rightTitle: "Ya, Termasuk", barier: true);
                },
                buttonRight: () {
                  Get.back();
                  filledShowDialog(
                    barier: false,
                      context: context,
                      title: "Masukkan No. Rekam Medis",
                      button: () {
                        Get.to(const BelumAdaPasien());
                      },
                      controller: controller,
                      hint: "Masukkan No. Rekam Medis Anda");
                },
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
