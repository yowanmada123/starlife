import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Login/login_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';

Widget LogoutButton(GlobalController c) {
  return Container(
      width: Get.width,
      height: c.sh * 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 227, 226, 226),
            blurRadius: 3.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              8.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: BaseButton(
        ontap: () {
          Get.off(LoginPage());
        },
        color: OPrimaryColor,
        text: "Keluar",
        textWeight: FontWeight.w600,
        textSize: 12,
        iconColor: Color(0xffD9532E),
        height: c.sh * 38,
        width: Get.width,
        icon: Icons.logout,
      ));
}
