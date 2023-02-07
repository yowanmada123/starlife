import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/jadwal_praktek.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/list_dokter.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/list_pasien.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
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
              Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
            },
            text: "Lihat Antrian")
      ]),
    );
  }
}
