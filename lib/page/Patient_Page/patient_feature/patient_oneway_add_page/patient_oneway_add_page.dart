import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_oneway_add_page/patient_oneway_add_body/patient_oneway_form.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_oneway_add_page/patient_oneway_add_body/patient_oneway_topbar.dart';
import 'package:starlife/page/Patient_Page/patient_list_main_page.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';

class PatientOneWayAddPage extends StatefulWidget {
  const PatientOneWayAddPage({super.key});

  @override
  State<PatientOneWayAddPage> createState() => _PatientOneWayAddPageState();
}

class _PatientOneWayAddPageState extends State<PatientOneWayAddPage> {
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
              children: const[
                PatientOneWayForm(),
                SizedBox(height: 50,)
              ],
            ),
        ),
         ),
        const PatientOneWayTopBar(),
        CustomButtomButton(ontap: () {
            Get.to(const PatientListPage());
        }, text: "Simpan")
      ]),
    );
  }
}
