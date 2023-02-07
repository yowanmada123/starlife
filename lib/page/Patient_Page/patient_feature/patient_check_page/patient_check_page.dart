import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_body/patient_check_bottombar.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_body/patient_check_topbar.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_body/patient_check_data.dart';

class PatientCheckPage extends StatefulWidget {
  const PatientCheckPage({super.key});

  @override
  State<PatientCheckPage> createState() => _PatientCheckPageState();
}

class _PatientCheckPageState extends State<PatientCheckPage> {
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
                PatientCheckData(),
                const SizedBox(height: 50,)
              ],
            ),
        ),
         ),
        const PatientCheckTopBar(),
        PatientCheckBottomBar()
      ]),
    );
  }
}