import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/periksa_pasien/bottombar.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/periksa_pasien/form_data_patient.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/periksa_pasien/topbar.dart';

class BelumAdaPasien extends StatefulWidget {
  const BelumAdaPasien({super.key});

  @override
  State<BelumAdaPasien> createState() => _BelumAdaPasienState();
}

class _BelumAdaPasienState extends State<BelumAdaPasien> {
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
                FormDataPatient(controller: namaController, title: "Nama Lengkap"),
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