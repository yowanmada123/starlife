import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Periksa/tambah_pasien/body/bottombar.dart';
import 'package:starlife/page/Periksa/tambah_pasien/body/patient_add_topbar.dart';
import 'package:starlife/widget/base/base_form.dart';
import 'package:starlife/page/Periksa/tambah_pasien/body/form_add_patient.dart';
import 'package:starlife/widget/ext_text.dart';

class PatientAdd extends StatefulWidget {
  const PatientAdd({super.key});

  @override
  State<PatientAdd> createState() => _PatientAddState();
}

class _PatientAddState extends State<PatientAdd> {
  TextEditingController namaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white
            ),
         Container(
          color: Colors.white,
           child: SingleChildScrollView(
            child: Column(
              children: [
                AddPatientForm(controller: namaController, title: "Nama Lengkap"),
                const SizedBox(height: 50,)
              ],
            ),
        ),
         ),
        const PatientAddTopBar(),
        const BottomBar()
      ]),
    );
  }
}
