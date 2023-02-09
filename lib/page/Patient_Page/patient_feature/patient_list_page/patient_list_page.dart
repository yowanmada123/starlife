import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_add_alert.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_list.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_doctor_schedule.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_doctor_list.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_topbar.dart';
import 'package:starlife/page/Patient_Page/patient_controller/patient_page_controller.dart';
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
  final p = Get.put(PatientPageController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(height: Get.height, width: Get.width, color: Colors.white),
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                const PatientList(),
                Container(
                    height: 50,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    color: Colors.white,
                    child: BaseButton(
                      height: 40,
                      ontap: () {
                        showAlert(context, controller);
                      },
                      text: "Tambah Pasien",
                      icon: Icons.add,
                      iconColor: Colors.white,
                      outlineRadius: 20,
                    )),
                const PatientDoctorSchedule(),
                const PatientDoctorList(),
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ),
        const PatientTopBar(buttonBack: false),
        CustomButtomButton(
            ontap: () {
                print(p.emailController.text);
                print(p.namaController.text);
                print(p.tanggalLahirController.text);
                print(p.usiaController.text);
                print(p.statusController.text);
                print(p.jenisKelaminController.text);
                print(p.agamaController.text);
                print(p.alergiObatController.text);
                print(p.alamatController.text);
                print(p.handphoneController.text);
                print(p.orangtuaController.text);
              Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
            },
            text: "Lihat Antrian")
      ]),
    );
  }
}
