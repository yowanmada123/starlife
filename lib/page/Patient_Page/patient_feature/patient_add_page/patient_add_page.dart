import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_add_page/patient_add_body/patient_add_topbar.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_add_page/patient_add_body/patient_add_form.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';

class PatientAddPage extends StatefulWidget {
  const PatientAddPage({super.key});

  @override
  State<PatientAddPage> createState() => _PatientAddPageState();
}

class _PatientAddPageState extends State<PatientAddPage> {
  final p = Get.put(PatientPageController());

  // TextEditingController namaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(height: Get.height, width: Get.width, color: Colors.white),
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                PatientAddForm(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        const PatientAddTopBar(),
        CustomButtomButton(
            ontap: () {
              // print(p.agamaController.text);
              // print(p.jenisKelaminController.text);
              p.patientAdd(context);
              // Get.to(const PatientListPage());
              // Get.to(const PatientListPage());
            },
            text: "Simpan"),
        // const PatientAddBottomBar()
      ]),
    );
  }
}
