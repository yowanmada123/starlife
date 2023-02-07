import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

class CheckRmTopBar extends StatefulWidget {
  const CheckRmTopBar({super.key});


  @override
  State<CheckRmTopBar> createState() => _CheckRmTopBarState();
}

class _CheckRmTopBarState extends State<CheckRmTopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Stack(children: [
      Container(
        color: OPrimaryColor,
        height: c.sh * 128,
        width: Get.width,
      ),
      Positioned(
        bottom: 0,
        child: Container(
          height: c.sh * 19,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
        ),
      )
    ]));
  }
}