import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Periksa/daftar_pasien/daftar_pasien.dart';
import 'package:starlife/page/Periksa/periksa_pasien_sekali_jalan/body/form_add_patient_sekali_jalan.dart';
import 'package:starlife/page/Periksa/periksa_pasien_sekali_jalan/body/topbar.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';

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
        CustomButtomButton(ontap: () {
            Get.to(const DaftarPasien());
        }, text: "Simpan")
      ]),
    );
  }
}
