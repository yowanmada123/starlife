import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class SchedulePracticeLocation extends StatefulWidget {
  const SchedulePracticeLocation({super.key, required this.doctor});
  final Doctor doctor;
  
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
              Icon(Icons.location_on, color: OPrimaryColor,size: 25,),
              SizedBox(width:c.sw*13),
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Lokasi Praktek").p14m().black(),
                      const SizedBox(height: 5,),
                      Container(
                        child: Text(widget.doctor.address).p10r().black()),
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
