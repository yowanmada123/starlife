import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Periksa/periksa_pasien/belum_ada_pasien.dart';
import 'package:starlife/page/Periksa/periksa_pasien_sekali_jalan/tambah_pasien_sekali_jalan.dart';
import 'package:starlife/page/Periksa/tambah_pasien/patient_add.dart';
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
                Get.to(const PatientAdd());
              },
              buttonRight: () {
                Get.back();
                Get.to(const TambahPasienSekaliJalan());
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
                Get.to(const BelumAdaPasien());
              },
              controller: controller,
              hint: "Masukkan No. Rekam Medis Anda");
        },
        title: "Apakah Anda Sudah Memiliki Nomor Rekam Medis ?",
        leftTittle: 'Belum',
        rightTitle: "Sudah",
        barier: true);
  }