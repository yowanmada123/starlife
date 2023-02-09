import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/Auth_Page/Login/login_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';

Widget ProfileLogoutButton(GlobalController c, BuildContext context) {
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
          c.tabHomeIndex.value = 0;
          c.isLogin.value = false;
          Get.offAll(HelloConvexAppBar());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Logout Success'),
            backgroundColor: Colors.black87,
          ));
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
