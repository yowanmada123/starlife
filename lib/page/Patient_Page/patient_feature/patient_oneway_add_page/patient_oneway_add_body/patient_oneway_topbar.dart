import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilan TopBar untuk halaman penambahan pasien sekali jalan
class PatientOneWayTopBar extends StatefulWidget {
  const PatientOneWayTopBar({super.key});

  @override
  State<PatientOneWayTopBar> createState() => _PatientOneWayTopBarState();
}

class _PatientOneWayTopBarState extends State<PatientOneWayTopBar> {
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
            padding: EdgeInsets.only(left: 16, top: 45),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ButtonBack(),
                SizedBox(
                  width: 16,
                ),
                const Text("Tambah Pasien Periksa Sekali Jalan").p14b()
              ],
            ),
          ),
        ));
  }
}
