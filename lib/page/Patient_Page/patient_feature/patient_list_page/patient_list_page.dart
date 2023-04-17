import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_add_alert.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_list.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_doctor_schedule.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/patient_topbar.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';

// Halaman List Pasien, List Dokter dan list Schedule
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
                // Tampilan List Pasien atau bagian dari halaman patient list main page
                const PatientList(),
                // Tampilan button Tambah Pasien atau bagian dari halaman patient list main page
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
                // Tampilan List Schedule Dokter atau bagian dari halaman patient list main page
                const PatientDoctorSchedule(),

                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
        // Tampilan TopBar atau bagian dari halaman patient list main page
        const PatientTopBar(buttonBack: false),
        // Tampilan button Lihat Antrian atau bagian dari halaman patient list main page
        CustomButtomButton(
            ontap: () async {
              if (p.selectedPatientRm.value != null && p.selectedPatientRm.value != '') {
                if (p.selectedDoctor.value != null && p.selectedDoctor.value != '') {
                  if (p.selectedSchedule.value != null && p.selectedDoctor.value != '') {
                    await p.cekDataAppointment(context, false);
                    if (p.loadingAppoinment.value) {
                      Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Choose Schedule First"),
                      backgroundColor: Colors.black87,
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Choose Doctor First"),
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
