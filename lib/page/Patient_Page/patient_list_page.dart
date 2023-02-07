import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_add_alert.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_queue_page/patient_queue_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/jadwal_praktek.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/list_dokter.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/list_pasien.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_body/topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/ext_text.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  final c = Get.put(GlobalController());
  TextEditingController controller = TextEditingController(text: "");
  TextEditingController namaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: c.pasienNumber != 0
            ? Stack(children: [
                Container(height: Get.height, width: Get.width, color: Colors.white),
                Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        const ListPasien(),
                        Container(
                            height: 60,
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                        const JadwalPraktek(),
                        ListDokter(),
                        CustomButtomButton(
                            ontap: () {
                              Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
                            },
                            text: "Lihat Antrian"),
                        SizedBox(
                          height: c.sh * 50,
                        )
                      ],
                    ),
                  ),
                ),
                TopBar(buttonBack: false),
              ])
            : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icon/ic_emphty_pasien.svg"),
                      ],
                    ),
                    Text("Masih Belum ada pasien terdaftar disini").p12b(),
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
                ),
              ));
  }

}
