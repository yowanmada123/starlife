import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key, required this.name});
  final String name;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Stack(children: [
      Container(
        color: OPrimaryColor,
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
                    ButtonBack(times: 2),
                    SizedBox(
                      width: c.sw * 16,
                    ),
                    Text(widget.name).p16b().white(),
                  ],
                ),
              ],
            )),
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
