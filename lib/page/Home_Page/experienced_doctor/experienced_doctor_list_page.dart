import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_poli.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class ExperiencedDoctorListPage extends StatefulWidget {
  const ExperiencedDoctorListPage({super.key, this.poli});
  final Poli? poli;

  @override
  State<ExperiencedDoctorListPage> createState() => _ExperiencedDoctorListPageState();
}

class _ExperiencedDoctorListPageState extends State<ExperiencedDoctorListPage> {
  final c = Get.put(GlobalController());
  @override
  // void initState() {
  //   super.initState();
  //   SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
  //     // await h.getPoli();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          const CustomTopBar(height: 115),
          RoundedInside(
            height: 98,
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  ListDoctor(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        const SizedBox(
                          width: 16,
                        ),
                        (widget.poli == null) ? Text("Semua Dokter").p16b().white() : Text(widget.poli!.name).p16b().white()
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
