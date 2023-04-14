import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ScheduleDoctorExperience extends StatelessWidget {
  ScheduleDoctorExperience({super.key});
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 318, color: Colors.white),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OPrimaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Nomor STR").p12r().white(),
                      const Text("2201522182382655").p12m().white(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OPrimaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Pengalaman Selama").p12r().white(),
                      const Text("7 tahun").p12m().white(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
