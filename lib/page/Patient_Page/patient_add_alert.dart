import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_oneway_add_page/patient_oneway_add_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_add_page/patient_add_page.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';

void showAlert(BuildContext context, TextEditingController controller) {
    dialogBuilder(
        context: context,
        buttonLeft: () {
          Get.back();
          dialogBuilder(
              context: context,
              title: "Apakah Calon Pasien Termasuk Pasien Periksa Sekali Jalan ?",
              buttonLeft: () {
                Get.back();
                Get.to(const PatientAddPage());
              },
              buttonRight: () {
                Get.back();
                Get.to(const PatientOneWayAddPage());
              },
              leftTittle: "Bukan Termasuk",
              rightTitle: "Ya, Termasuk",
              barier: true);
        },
        buttonRight: () {
          Get.back();
          filledShowDialog(
              barier: true,
              context: context,
              title: "Masukkan No. Rekam Medis",
              button: () {
                Get.to(const PatientCheckPage());
              },
              controller: controller,
              hint: "Masukkan No. Rekam Medis Anda");
        },
        title: "Apakah Anda Sudah Memiliki Nomor Rekam Medis ?",
        leftTittle: 'Belum',
        rightTitle: "Sudah",
        barier: true);
  }