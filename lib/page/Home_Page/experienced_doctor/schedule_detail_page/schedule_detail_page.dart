import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_body/schedule_doctor_detail.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_body/schedule_topbar.dart';
import 'package:starlife/page/global_controller.dart';

import 'schedule_detail_body/schedule_doctor_biography.dart';
import 'schedule_detail_body/schedule_bottombar.dart';
import 'schedule_detail_body/schedule_doctor.dart';
import 'schedule_detail_body/schedule_practice_location.dart';
import 'schedule_detail_body/schedule_available.dart';

class ScheduleDetailPage extends StatefulWidget {
  const ScheduleDetailPage({super.key, required this.doctor});
  final Doctor doctor;
  @override
  State<ScheduleDetailPage> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
          ),
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
              children: [
                ScheduleDoctorExperience(),
                ScheduleDoctor(doctor: widget.doctor,),
                ScheduleAvailable(doctor: widget.doctor,),
                SchedulePracticeLocation(doctor: widget.doctor,),
                Container(
                  height: 12,
                  color: const Color.fromARGB(255, 250, 249, 249),
                ),
                const ScheduleDoctorBiography()
              ],
            )),
          ),
          ScheduleTopBar(doctor: widget.doctor,),
          if (c.token != null || c.token != '') ...[
            const ScheduleDoctorBottomBar(),
          ]
        ],
      ),
    );
  }
}
