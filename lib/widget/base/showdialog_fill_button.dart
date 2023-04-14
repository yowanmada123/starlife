import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../utils/colors.dart';

filledShowDialog({required bool barier, required BuildContext context, required String title, required Function() button, required TextEditingController controller, required String hint}) {
  final c = Get.put(GlobalController());
  return showDialog<String>(
    context: context,
    barrierDismissible: barier,
    builder: (BuildContext context) => AlertDialog(
      title: Center(
          child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
      )),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      contentPadding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
      content: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, bottom: 10),
        decoration: BoxDecoration(color: const Color(0xffEEEEEE), borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: controller,
          // validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
          style: const TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(border: InputBorder.none, hintText: hint, hintStyle: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400)),
        ),
      ),
      actions: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: BaseButton(
              ontap: button,
              text: "Submit",
              outlineRadius: 10,
              textSize: 14,
              height: 39,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
