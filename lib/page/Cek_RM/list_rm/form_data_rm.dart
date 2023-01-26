import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/custom_list_form.dart';
import 'package:starlife/widget/base/custom_list_map.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../../widget/base/custom_fixed_form.dart';
import '../../../../widget/base/custom_form.dart';

class FormDataRm extends StatefulWidget {
  // final TextEditingController controller;
  final String title;
  final bool? passwordMode;

  const FormDataRm({super.key, required this.title, this.passwordMode});

  @override
  State<FormDataRm> createState() => _FormDataRmState();
}

class _FormDataRmState extends State<FormDataRm> {
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
  final List<String> entrie = <String>[
    'Sakit Kepala',
    'Mual',
    'Muntah',
    'Nyeri otot, sendi, dan tulang',
    'Nyeri di bagian belakang mata',
  ];
  final List<Map<String, dynamic>> resep = [
    {
      'obat'  : '500mg Paracetamol',
      'aturan': 'Sehari 3 kali 1 tablet'
    },
    {
      'obat'  : '10mg Domperidone',
      'aturan': '3 - 4 kali sehari'
    },
    {
      'obat'  : '10mg Domperidone',
      'aturan': '3 - 4 kali sehari'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 135,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 120,
              height: 120,
              child: Image.asset(
                "assets/images/img_avatar_2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: c.sh * 12,
          ),
          const Text("dr. Hendri Sulaiman").p18b().primary(),
          const Text("Praktek Dokter Umum").p12r().primary(),
          SizedBox(
            height: c.sh * 16,
          ),
          const CustomFixedForm(content: "RM/545148-1151/015", title: "No. Rekam Medis"),
          CustomForm(
            controller: namaController,
            hintText: "Masukan Nama Lengkap",
            title: "Nama Lengkap",
            // isMust: true,
          ),
          CustomForm(
            controller: emailController,
            hintText: "42 Tahun",
            title: "Umur",
            // isMust: true,
          ),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  controller: jenisKelaminController,
                  hintText: "52 Kg",
                  title: "Berat Badan",
                  // isMust: true,
                ),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: CustomForm(
                  controller: agamaController,
                  hintText: "90/70 mmHg",
                  title: "Tekanan Darah",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  controller: jenisKelaminController,
                  hintText: "24 November 2022",
                  title: "Tanggal Periksa",
                  // isMust: true,
                ),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: CustomForm(
                  controller: agamaController,
                  hintText: "10:40 WIB",
                  title: "Jam Periksa",
                ),
              ),
            ],
          ),
          CustomListform(
            content: entrie,
            title: 'Keluhan',
          ),
          CustomForm(
            controller: statusController,
            hintText: "Demam Berdarah",
            title: "Diagnosis",
            // isMust: true,
          ),
          CustomForm(
            controller: statusController,
            hintText: "Suntik Vaksin CYD-TDV (dengvaxia)",
            title: "Tindakan",
            // isMust: true,
          ),
          CustomListOfMap(content: resep, title: "Resep Dokter",)
        ],
      ),
    );
  }
}
