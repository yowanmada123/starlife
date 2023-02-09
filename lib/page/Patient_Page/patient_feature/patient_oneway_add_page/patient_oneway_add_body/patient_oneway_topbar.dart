import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

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
          height: c.sw*100,
          child: Padding(
            padding: EdgeInsets.only(left: c.sw * 16, top: c.sh*53),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ButtonBack(),
                SizedBox(width: c.sw*16,),
                const Text("Tambah Pasien Periksa Sekali Jalan").p14b()
              ],
            ),
          ),
        ) 
    );
  }
}
