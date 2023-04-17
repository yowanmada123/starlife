import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_body/patient_check_bottombar.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_body/patient_check_topbar.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_body/patient_check_data.dart';

// Halaman Pengecekan Pasien berdasarkan nomer RM
class PatientCheckPage extends StatefulWidget {
  const PatientCheckPage({super.key, required this.rm});
  final String rm;

  @override
  State<PatientCheckPage> createState() => _PatientCheckPageState();
}

class _PatientCheckPageState extends State<PatientCheckPage> {
  final p = Get.put(PatientPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(height: Get.height, width: Get.width, color: Colors.white),
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PatientCheckData(
                  rm: widget.rm,
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        // Container(
        //   color: Colors.white,
        //   child: SingleChildScrollView(
        //     child: Obx(() =>
        //     (widget.loadingDataPersonal.value) ?
        //     Column(
        //       children: const [
        //         PatientCheckData(),
        //         SizedBox(
        //           height: 50,
        //         )
        //       ],
        //     ) :
        //     Container()
        //     ),
        //   ),
        // ),
        const PatientCheckTopBar(),
        PatientCheckBottomBar(
          rm: widget.rm,
        )
      ]),
    );
  }
}
