import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileItemList extends StatefulWidget {
  const ProfileItemList({super.key, required this.icon, required this.title, required this.ontap});
  final IconData icon;
  final String title;
  final Function() ontap;
  @override
  State<ProfileItemList> createState() => _ProfileItemListState();
}

class _ProfileItemListState extends State<ProfileItemList> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.ontap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: Get.width,
            height: 38,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: OPrimaryColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(widget.title).p12m().black(),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 12,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
