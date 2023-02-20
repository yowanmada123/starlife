import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            height: c.sh * 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SizedBox(
              width: 120,
              height: 120,
              child: Image.asset(
                "assets/images/img_doctor2.png",
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
          const CustomFixedForm(content: "Herlambang Ardianto", title: "Nama Lengkap", backgroundColor: Colors.white,isMust: false,),
          CustomFixedForm(content: "42 Tahun", title: "Usia", backgroundColor: Colors.white),
          Row(
            children: [
              const Expanded(
                child:  CustomFixedForm(content: "52 Kg", title: "Berat Badan", backgroundColor: Colors.white,isMust: false,),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              const Expanded(
                child: CustomFixedForm(content: "90/70 mmHg", title: "Tekanan Darah", backgroundColor: Colors.white,isMust: false,),
              ),
            ],
          ),
          Row(
            children: [
               const Expanded(
                child: CustomFixedForm(content: "24 November 2023", title: "Tanggal Periksa", backgroundColor: Colors.white,isMust: false,),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              const Expanded(
                child: CustomFixedForm(content: "10:40 WIB", title: "Jam Periksa", backgroundColor: Colors.white,isMust: false,),
              ),
            ],
          ),
          CustomListform(
            content: entrie,
            title: 'Keluhan',
          ),
          const CustomFixedForm(content: "Demam Berdarah", title: "Diagnosis", backgroundColor: Colors.white,isMust: false,),
          const CustomFixedForm(content: "Suntik Vaksin CYD-TDV (dengvaxia)", title: "Tindakan", backgroundColor: Colors.white,isMust: false,),
          CustomListOfMap(content: resep, title: "Resep Dokter",)
        ],
      ),
    );
  }
}
