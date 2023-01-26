import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../page/global_controller.dart';

class CustomFixedForm extends StatefulWidget {
  const CustomFixedForm({
    super.key,
    required this.title,
    required this.content, this.height,
  });
  final String content;
  final String title;
  final double? height;

  @override
  State<CustomFixedForm> createState() => _CustomFixedFormState();
}

class _CustomFixedFormState extends State<CustomFixedForm> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: Get.width,
          height: 30,
          child: RichText(
            text: TextSpan(
              text: widget.title,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: '*',
                  style: GoogleFonts.poppins(color: const Color(0xffF1416C), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: c.sw * 15),
          width: Get.width,
          height: c.sh * 46,
          decoration: BoxDecoration(color: const Color(0xffD0F4FF), borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xff28C6F5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.content).p12m().grey(),
            ],
          ),
        ),
        SizedBox(
          height: c.sh * 16,
        ),
      ],
    );
  }
}
