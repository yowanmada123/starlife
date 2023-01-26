import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/tambah_pasien/bottombar.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/tambah_pasien/topbar.dart';
import 'package:starlife/widget/base/base_form.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/tambah_pasien/form_add_patient.dart';
import 'package:starlife/widget/ext_text.dart';

class TambahPasien extends StatefulWidget {
  const TambahPasien({super.key});

  @override
  State<TambahPasien> createState() => _TambahPasienState();
}

class _TambahPasienState extends State<TambahPasien> {
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
                FormAddPatient(controller: namaController, title: "Nama Lengkap"),
                const SizedBox(height: 50,)
              ],
            ),
        ),
         ),
        const TopBar(),
        const BottomBar()
      ]),
    );
  }
}
