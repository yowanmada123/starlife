import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../../widget/base/custom_fixed_form.dart';
import '../../../../widget/base/custom_form.dart';
import '../../../global_controller.dart';

class FormAddPatient extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool? passwordMode;

  const FormAddPatient({super.key, required this.controller, required this.title, this.passwordMode});

  @override
  State<FormAddPatient> createState() => _FormAddPatientState();
}

class _FormAddPatientState extends State<FormAddPatient> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  TextEditingController rmController = TextEditingController(text: "");
  TextEditingController namaController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController tanggalLahirController = TextEditingController(text: "");
  TextEditingController statusController = TextEditingController(text: "");
  TextEditingController jenisKelaminController = TextEditingController(text: "");
  TextEditingController agamaController = TextEditingController(text: "");
  TextEditingController alergiObatController = TextEditingController(text: "");
  TextEditingController goldarController = TextEditingController(text: "");
  TextEditingController alamatController = TextEditingController(text: "");
  TextEditingController kotaController = TextEditingController(text: "");
  TextEditingController kelurahanController = TextEditingController(text: "");
  TextEditingController rtController = TextEditingController(text: "");
  TextEditingController rwController = TextEditingController(text: "");
  TextEditingController kecamatanController = TextEditingController(text: "");
  TextEditingController teleponController = TextEditingController(text: "");
  TextEditingController handphoneController = TextEditingController(text: "");
  TextEditingController orangtuaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 115,
          ),
          CustomForm(
            controller: namaController,
            hintText: "Masukan Nama Lengkap",
            title: "Nama Lengkap",
            isMust: true,
          ),
          CustomForm(
                  controller: jenisKelaminController,
                  hintText: "Pilih Salah Satu",
                  title: "Jenis Kelamin",
            isMust: true,
                ),
          CustomForm(
            controller: alamatController,
            hintText: "Masukkan Alamat",
            title: "Alamat (Opsional)",
          ),
          CustomForm(
                  controller: tanggalLahirController,
                  hintText: "dd/mm//yyyy",
                  title: "Tanggal Lahir (Opsional)",
                ),
          CustomForm(
            controller: handphoneController,
            hintText: "Masukkan No. Handphone",
            title: "No. Handphone (Opsional)",)
          // ),
          // CustomForm(
          //   controller: emailController,
          //   hintText: "Masukan Email",
          //   title: "Email",
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: 
          //     ),
          //     SizedBox(
          //       width: c.sw * 24,
          //     ),
          //     Expanded(
          //       child: const CustomFixedForm(content: "42 Tahun", title: "Usia"),
          //     )
          //   ],
          // ),
          // CustomForm(
          //   controller: statusController,
          //   hintText: "cth: Suami / Istri / Anak ke-1 / Anak ke-2, dsb",
          //   title: "Status Pasien Dalam Keluarga",
          // ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: c.sw * 24,
          //     ),
          //     Expanded(
          //       child: CustomForm(
          //         controller: agamaController,
          //         hintText: "Pilih Salah Satu",
          //         title: "Agama",
          //       ),
          //     ),
          //   ],
          // ),
          // CustomForm(
          //   controller: alergiObatController,
          //   hintText: "cth: Alergi Paracetamol",
          //   title: "Alergi Obat",
          // ),
          // CustomForm(
          //   controller: goldarController,
          //   hintText: "B",
          //   title: "Golongan Darah",
          // ),
          
          // CustomForm(
          //   controller: kotaController,
          //   hintText: "Masukkan Kota",
          //   title: "Kota",
          // ),
          // CustomForm(
          //   controller: kelurahanController,
          //   hintText: "Masukkan Kelurahan",
          //   title: "Kelurahan",
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: CustomForm(
          //         controller: rwController,
          //         hintText: "Masukkan RW",
          //         title: "RW",
          //       ),
          //     ),
          //     SizedBox(
          //       width: c.sw * 24,
          //     ),
          //     Expanded(
          //       child: CustomForm(
          //         controller: rtController,
          //         hintText: "Masukkan RT",
          //         title: "RT",
          //       ),
          //     ),
          //   ],
          // ),
          // CustomForm(
          //   controller: kecamatanController,
          //   hintText: "Kecamatan",
          //   title: "Masukkan Kecamatan",
          // ),
          // CustomForm(
          //   controller: teleponController,
          //   hintText: "Masukkan No. Telepon",
          //   title: "No. Telepon (Rumah)",
          // ),
          
          // CustomForm(
          //   controller: orangtuaController,
          //   hintText: "Masukkan Nama Orang Tua",
          //   title: "Nama Orang Tua",
          // ),
        ],
      ),
    );
  }
}
