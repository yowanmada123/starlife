import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/periksa_pasien_sekali_jalan/bottombar.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/periksa_pasien_sekali_jalan/form_add_patient.dart';
import 'package:starlife/page/Detail_Jadwal/periksa/periksa_pasien_sekali_jalan/topbar.dart';

class TambahPasienSekaliJalan extends StatefulWidget {
  const TambahPasienSekaliJalan({super.key});

  @override
  State<TambahPasienSekaliJalan> createState() => _TambahPasienSekaliJalanState();
}

class _TambahPasienSekaliJalanState extends State<TambahPasienSekaliJalan> {
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
