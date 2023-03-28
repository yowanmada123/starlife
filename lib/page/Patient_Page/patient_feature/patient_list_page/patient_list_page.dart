import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_add_alert.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_list.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_doctor_schedule.dart';
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
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      p.selectedPatientRm.value = "";
      p.selectedDoctor.value = "";
      p.selectedSchedule.value = "";
    });
  }

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
                    height: 55,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    color: Colors.white,
                    child: BaseButton(
                      height: 40,
                      ontap: () {
                        showAlert(context, controller, p);
                      },
                      text: "Tambah Pasien",
                      icon: Icons.add,
                      iconColor: Colors.white,
                      outlineRadius: 20,
                    )),
                const PatientDoctorSchedule(),
                // const PatientDoctorList(),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
        const PatientTopBar(buttonBack: false),
        CustomButtomButton(
            ontap: () async {
              if (p.selectedPatientRm.value != null && p.selectedPatientRm.value != '') {
                if (p.selectedDoctor.value != null && p.selectedDoctor.value != '') {
                  if (p.selectedSchedule.value != null && p.selectedDoctor.value != '') {
                    // print(p.selectedPatientRm.value);
                    // print(p.selectedDoctor.value);
                    // print(p.selectedDoctor.value);
                    print(p.selectedSchedule.value);
                    await p.cekDataAppointment(context, false);
                    if (p.loadingAppoinment.value) {
                      Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
                      // print(p.selectedPatientRm.value);
                      // print(p.selectedDoctor.value);
                      // print(p.selectedDoctor.value);
                      // print(p.selectedSchedule.value);
                      // p.selectedPatientRm.value = '';
                      // p.selectedDoctor.value = '';
                      // p.selectedSchedule.value = '';
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Choose Schedule First"),
                      backgroundColor: Colors.black87,
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Choose Patient First"),
                    backgroundColor: Colors.black87,
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please Choose Doctor First"),
                  backgroundColor: Colors.black87,
                ));
              }
            },
            text: "Lihat Antrian")
      ]),
    );
  }
}
