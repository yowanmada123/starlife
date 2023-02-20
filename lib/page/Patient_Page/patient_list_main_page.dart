import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_add_alert.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_list.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_doctor_schedule.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_doctor_list.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/ext_text.dart';

import 'patient_controller/patient_page_controller.dart';

class PatientListMainPage extends StatefulWidget {
  const PatientListMainPage({super.key});

  @override
  State<PatientListMainPage> createState() => _PatientListMainPageState();
}

class _PatientListMainPageState extends State<PatientListMainPage> {
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: c.pasienNumber != 0
            ? Stack(children: [
                Container(height: Get.height, width: Get.width, color: Colors.white),
                Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        const PatientList(),
                        Container(
                            height: 60,
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
                        // Obx(() => Visibility(
                        //     visible: p.selectedPasien.isEmpty ? false : true,
                        //     child: Column(
                        //       children: [
                          
                        //       ],
                        //     ),
                        //   )),
                        const PatientDoctorSchedule(),
                        const PatientDoctorList(),
                        CustomButtomButton(
                            ontap: () {
                              Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
                            },
                            text: "Lihat Antrian"),
                        SizedBox(
                          height: c.sh * 30,
                        )
                      ],
                    ),
                  ),
                ),
                const PatientTopBar(buttonBack: false),
              ])
            : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icon/ic_emphty_pasien.svg"),
                  ],
                ),
                const Text("Masih Belum ada pasien terdaftar disini").p12b(),
                SizedBox(
                  height: c.sh * 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                  child: BaseButton(
                    ontap: () {
                      showAlert(context, controller);
                    },
                    text: "Tambah Pasien",
                    textSize: 12,
                    textColor: Colors.white,
                    icon: Icons.add,
                    iconColor: Colors.white,
                    outlineRadius: 20,
                    height: c.sh * 40,
                  ),
                ),
              ],
            ));
  }

}
