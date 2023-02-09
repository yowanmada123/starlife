import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_form_data.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_detail_topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class CheckRmDetailPage extends StatefulWidget {
  const CheckRmDetailPage({super.key, required this.name});
  final String name;
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
            child: SingleChildScrollView(
                child: Column(
              children: [
                FormDataRm(title: widget.name,)
              ],
            )),
          ),
          Container(
            color: Colors.transparent,
            height: c.sh * 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: c.sh * 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Text(widget.name).p16b().white(),
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