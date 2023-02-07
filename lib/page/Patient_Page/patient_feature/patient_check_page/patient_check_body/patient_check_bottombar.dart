import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';


class PatientCheckBottomBar extends StatefulWidget {
  const PatientCheckBottomBar({super.key});

  @override
  State<PatientCheckBottomBar> createState() => _PatientCheckBottomBarState();
}

class _PatientCheckBottomBarState extends State<PatientCheckBottomBar> {
  final c = Get.put(GlobalController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          color: Colors.white,
          // decoration: BoxDecoration(
          //     border: Border.all(
          //       color: Colors.black
          //     )
          //   ),
          height: c.sh * 80,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      filledShowDialog(
                        barier: false,
                          context: context,
                          title: "Masukkan No. Rekam Medis",
                          button: () {
                            // Get.to(const BelumAdaPasien());
                            Get.back();
                          },
                          controller: controller,
                          hint: "Masukkan No. Rekam Medis Anda");
                    },
                    child: Container(
                      height: c.sh * 47,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                      child: Center(child: const Text("Bukan").p14m().primary()),
                    ),
                  ),
                ),
                SizedBox(
                  width: c.sw * 12,
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                        Get.to(const PatientListPage());
                    },
                    child: Container(
                      height: c.sh * 47,
                      decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                      child: Center(child: const Text("Ya, Betul").p14m().white()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
