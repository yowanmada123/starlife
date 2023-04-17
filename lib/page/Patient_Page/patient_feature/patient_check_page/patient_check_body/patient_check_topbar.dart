import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilan topbar pada  halaman pengecekan pasien.
class PatientCheckTopBar extends StatefulWidget {
  const PatientCheckTopBar({super.key});

  @override
  State<PatientCheckTopBar> createState() => _PatientCheckTopBarState();
}

class _PatientCheckTopBarState extends State<PatientCheckTopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        child: Container(
          color: Colors.white,
          width: Get.width,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 53),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ButtonBack(),
                const SizedBox(
                  width: 16,
                ),
                const Text("Apakah benar ini Anda ?").p16b().primary()
              ],
            ),
          ),
        ));
  }
}
