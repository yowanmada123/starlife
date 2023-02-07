import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_add_page/patient_add_page.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../patient_oneway_add_page/patient_oneway_add_page.dart';

class PatientAddBottomBar extends StatefulWidget {
  const PatientAddBottomBar({super.key});

  @override
  State<PatientAddBottomBar> createState() => _PatientAddBottomBarState();
}

class _PatientAddBottomBarState extends State<PatientAddBottomBar> {
  final c = Get.put(GlobalController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            Get.to(const PatientListPage());
          },
          child: Container(
            color: Colors.white,
            height: c.sh * 63,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                height: c.sh * 47,
                decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                child: Center(child: const Text("Simpan").p14m().white()),
              ),
            ),
          ),
        ));
  }
}
