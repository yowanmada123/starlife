import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

class TopBar extends StatefulWidget {
  final bool buttonBack;
  const TopBar({super.key, required this.buttonBack});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        child: Container(
          color: Colors.white,
          width: Get.width,
          height: c.sw * 110,
          child: Padding(
            padding: EdgeInsets.only(left: c.sw * 16, top: c.sh * 53),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.buttonBack == true ?
                Row(
                  children: [
                    const ButtonBack(),
                    SizedBox(
                  width: c.sw * 16,
                ),
                  ],
                ) : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Daftar Pasien").p14b(),
                    SizedBox(
                      height: c.sh * 2,
                    ),
                    const Text("Pilih Pasien").p12m(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
