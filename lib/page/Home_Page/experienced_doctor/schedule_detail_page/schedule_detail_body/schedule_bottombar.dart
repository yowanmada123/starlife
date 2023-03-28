import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_add_page/patient_add_page.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../../Patient_Page/patient_feature/patient_oneway_add_page/patient_oneway_add_page.dart';

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
            // Get.offAll(HelloConvexAppBar());
            // c.tabHomeIndex.value = 2;
            Get.to(const PatientListPage());
            // dialogBuilder(
            //   barier: true,
            //     context: context,
            //     buttonLeft: () {
            //       Get.back();
            //       dialogBuilder(
            //           context: context,
            //           title: "Apakah Calon Pasien Termasuk Pasien Periksa Sekali Jalan ?",
            //           buttonLeft: () {
            //             Get.back();
            //             Get.to(const PatientAddPage());
            //           },
            //           buttonRight: () {
            //             // Get.back();
            //             Get.to(const PatientOneWayAddPage());
            //           },
            //           leftTittle: "Bukan Termasuk",
            //           rightTitle: "Ya, Termasuk", barier: true);
            //     },
            //     buttonRight: () {
            //       Get.back();
            //       filledShowDialog(
            //         barier: true,
            //           context: context,
            //           title: "Masukkan No. Rekam Medis",
            //           button: () {
            //             Get.to(PatientCheckPage(rm: controller.text,));
            //           },
            //           controller: controller,
            //           hint: "Masukkan No. Rekam Medis Anda");
            //     },
            //     title: "Apakah Anda Sudah Memiliki Nomor Rekam Medis ?",
            //     leftTittle: 'Belum',
            //     rightTitle: "Sudah");
          },
          child: Container(
            color: Colors.white,
            height: 63,
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: 12),
              child: Container(
                height:    47,
                decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                child: Center(child: const Text("Buat Janji").p14m().white()),
              ),
            ),
          ),
        ));
  }
}
