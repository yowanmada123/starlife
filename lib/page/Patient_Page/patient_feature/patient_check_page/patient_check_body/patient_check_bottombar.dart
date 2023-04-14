import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/ext_text.dart';

class PatientCheckBottomBar extends StatefulWidget {
  const PatientCheckBottomBar({super.key, required this.rm});
  final String rm;

  @override
  State<PatientCheckBottomBar> createState() => _PatientCheckBottomBarState();
}

class _PatientCheckBottomBarState extends State<PatientCheckBottomBar> {
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());
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
          height: 80,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      // Get.back();
                      filledShowDialog(
                          barier: true,
                          context: context,
                          title: "Masukkan No. Rekam Medis",
                          button: () {
                            // print(controller.text);
                            if (controller.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Please fill RM field"),
                                backgroundColor: Colors.black87,
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(controller.text),
                                backgroundColor: Colors.black87,
                              ));
                              p.getPatientByRm(context, controller.text);
                              // Get.back();
                              // c.tabHomeIndex.value = 2;
                              // Get.off(HelloConvexAppBar());
                            }
                            // if (controller.text.isNotEmpty) {
                            //   Get.back();
                            //   // print(p.rmController.text);
                            //   p.getPatientByRm(context, controller.text);
                            //   // if(p.loadingDataPersonal.value){
                            //   //     Get.off(PatientCheckPage(rm: p.rmController.text,));
                            //   // }
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            //     content: Text("Please fill RM field"),
                            //     backgroundColor: Colors.black87,
                            //   ));
                            // }
                          },
                          controller: controller,
                          hint: "Masukkan No. Rekam Medis Anda");
                    },
                    child: Container(
                      height: 47,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                      child: Center(child: const Text("Bukan").p14m().primary()),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      // print(p.rmController.text);
                      p.loadingAddNewPersonal.value = false;
                      p.addNewPatientByRm(context, widget.rm);

                      // if(p.loadingAddNewPersonal.value){
                      //   Get.to(const PatientListPage());
                      // }
                      // setState(() {
                      //   c.tabHomeIndex.value = 2;
                      // });
                      // Get.off(HelloConvexAppBar());
                      // Get.back();
                      // if (p.rmController.text.isNotEmpty) {
                      // }
                      // else{
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text("Please fill RM field"),
                      //     backgroundColor: Colors.black87,
                      //   ));
                      // }
                      // Get.back();
                      // Get.to(const PatientListPage());
                    },
                    child: Container(
                      height: 47,
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
