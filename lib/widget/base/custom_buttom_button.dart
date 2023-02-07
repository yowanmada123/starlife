import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
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
            height: c.sh * 80,
            width: Get.width,
            color: Colors.white,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.black
            //   )
            // ),
            child: Padding(
              padding: const EdgeInsets.all(16),
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
