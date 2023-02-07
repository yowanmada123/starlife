import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class SchedulePracticeLocation extends StatefulWidget {
  const SchedulePracticeLocation({super.key});

  @override
  State<SchedulePracticeLocation> createState() => _SchedulePracticeLocationState();
}

class _SchedulePracticeLocationState extends State<SchedulePracticeLocation> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/icon/ic_icon_lokasi.png"),
              SizedBox(width:c.sw*13),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Lokasi Praktek").p14m().black(),
                      Container(
                        child: const Text("Jl. Nginden Semolo No.42, Nginden Jangkungan, Kec. Sukolilo, Kota SBY, Jawa Timur 60118").p10r().black()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: c.sh*12,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              child: Image.asset("assets/images/img_map.png"),
            ),
          ),
          SizedBox(
            height: c.sh*16,
          ),
          
        ],
      ),
    );
  }
}
