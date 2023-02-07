import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Periksa/antrian/ambil_antrian.dart';
import 'package:starlife/page/Periksa/daftar_pasien/body/jadwal_praktek.dart';
import 'package:starlife/page/Periksa/daftar_pasien/body/list_dokter.dart';
import 'package:starlife/page/Periksa/daftar_pasien/body/list_pasien.dart';
import 'package:starlife/page/Periksa/daftar_pasien/body/topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';

class DaftarPasien extends StatefulWidget {
  const DaftarPasien({super.key});

  @override
  State<DaftarPasien> createState() => _DaftarPasienState();
}

class _DaftarPasienState extends State<DaftarPasien> {
  final c = Get.put(GlobalController());
 
  TextEditingController namaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(height: Get.height, width: Get.width, color: Colors.white),
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                ListPasien(),
                Container(
                    height: 60,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    color: Colors.white,
                    child: BaseButton(
                      height: 40,
                      ontap: () {},
                      text: "Tambah Pasien",
                      icon: Icons.add,
                      iconColor: Colors.white,
                      outlineRadius: 20,
                    )),
                const JadwalPraktek(),
                ListDokter(),
              ],
            ),
          ),
        ),
        const TopBar(buttonBack: false),
        CustomButtomButton(
            ontap: () {
              Get.to(AmbilAntrianPage(), transition: Transition.rightToLeft);
            },
            text: "Lihat Antrian")
      ]),
    );
  }
}
