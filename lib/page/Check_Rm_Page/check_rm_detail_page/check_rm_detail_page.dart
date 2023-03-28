import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/check_rm_controller.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_form_data.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_detail_topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/models/model_medical_record.dart';
import 'package:starlife/widget/ext_text.dart';

class CheckRmDetailPage extends StatefulWidget {
  const CheckRmDetailPage({super.key, required this.medicalRecord});
  final MedicalRecord medicalRecord;
  @override
  State<CheckRmDetailPage> createState() => _CheckRmDetailPageState();
}

class _CheckRmDetailPageState extends State<CheckRmDetailPage> {
  final c = Get.put(GlobalController());

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
          const CheckRmTopBar(),
          RoundedInside(
            height: 110,
            child: SingleChildScrollView(
                child: Column(
              children: [
                FormDataRm(
                  medicalRecord: widget.medicalRecord,
                )
              ],
            )),
          ),
          Container(
            color: Colors.transparent,
            height: 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Text(widget.medicalRecord.nama).p16b().white(),
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
