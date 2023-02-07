import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/main.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/Periksa/tambah_pasien/patient_add.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

class CustomButtomButton extends StatefulWidget {
  const CustomButtomButton({super.key, required this.ontap, required this.text});
  final Function() ontap;
  final String text;

  @override
  State<CustomButtomButton> createState() => _CustomButtomButtonState();
}

class _CustomButtomButtonState extends State<CustomButtomButton> {
  final c = Get.put(GlobalController());
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: GestureDetector(
          onTap: widget.ontap,
          child: Container(
            color: Colors.white,
            height: c.sh * 63,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                color: Colors.white,
                height: c.sh * 47,
                width: Get.width,
                child: Container(
                  height: c.sh * 47,
                  decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(widget.text).p14m().white()),
                ),
              ),
            ),
          ),
        ));
  }
}
