import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../page/global_controller.dart';

class CustomPhoneForm extends StatefulWidget {
  const CustomPhoneForm({super.key, required this.controller, required this.hintText, required this.title, this.fillColor, this.isMust, this.editable});
  final TextEditingController controller;
  final String hintText;
  final String title;
  final bool? editable;
  final bool? fillColor;
  final bool? isMust;

  @override
  State<CustomPhoneForm> createState() => _CustomPhoneFormState();
}

class _CustomPhoneFormState extends State<CustomPhoneForm> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: Get.width,
          height:    30,
          child: RichText(
            text: TextSpan(
              text: widget.title,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: (widget.isMust == true) ? '*' : '',
                  style: GoogleFonts.poppins(color: const Color(0xffF1416C), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Container(
          height:    46,
          alignment: Alignment.center,
          child: TextField(
            enabled: (widget.editable == null) ? true : widget.editable,
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.center,
            style: GoogleFonts.poppins(color: const Color(0xff868686), fontSize: 12, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintStyle: GoogleFonts.poppins(color: const Color(0xff868686), fontSize: 12, fontWeight: FontWeight.w600),
              hintText: widget.hintText,
              labelText: "ex: +6282256448562",
              filled: true,
              fillColor: (widget.fillColor == null) ? Colors.white : const Color(0xffD0F4FF),
              contentPadding: EdgeInsets.only(bottom: 0, left: c.sw * 15),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Color(0xff28C6F5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Color(0xff28C6F5)), //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height:    16,
        )
      ],
    );
  }
}
