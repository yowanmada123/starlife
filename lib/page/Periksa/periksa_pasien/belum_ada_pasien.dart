import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Periksa/periksa_pasien/body/bottombar.dart';
import 'package:starlife/page/Periksa/periksa_pasien/body/form_data_patient.dart';
import 'package:starlife/page/Periksa/periksa_pasien/body/topbar.dart';
import 'package:starlife/widget/base/button_back.dart';

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
        // CustomTopBar(),  
         Container(
          color: Colors.white,
           child: SingleChildScrollView(
            child: Column(
              children: [
                FormDataPatient(),
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