import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_body/schedule_doctor_detail.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_body/schedule_topbar.dart';
import 'package:starlife/page/global_controller.dart';

import 'schedule_detail_body/schedule_doctor_biography.dart';
import 'schedule_detail_body/schedule_bottombar.dart';
import 'schedule_detail_body/schedule_doctor.dart';
import 'schedule_detail_body/schedule_practice_location.dart';
import 'schedule_detail_body/schedule_available.dart';

class DetailJadwal extends StatefulWidget {
  const DetailJadwal({super.key});

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
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
                const ScheduleDoctor(),
                const ScheduleAvailable(),
                const SchedulePracticeLocation(),
                Container(
                  height: 12,
                  color: Color.fromARGB(255, 250, 249, 249),
                ),
                const ScheduleDoctorBiography()
              ],
            )),
          ),
          const ScheduleTopBar(),
          if(c.isLogin.value)...[
            const ScheduleDoctorBottomBar(),
          ]
          
        ],
      ),
    );
  }
}