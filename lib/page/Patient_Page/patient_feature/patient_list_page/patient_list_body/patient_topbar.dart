import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

class PatientTopBar extends StatefulWidget {
  final bool buttonBack;
  const PatientTopBar({super.key, required this.buttonBack});

  @override
  State<PatientTopBar> createState() => _PatientTopBarState();
}

class _PatientTopBarState extends State<PatientTopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        child: Container(
          color: Colors.white,
          width: Get.width,
          height: 92,
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 48),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.buttonBack == true
                    ? Row(
                        children: [
                          const ButtonBack(),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      )
                    : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Daftar Pasien").p14b(),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text("Pilih Pasien").p12m(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
