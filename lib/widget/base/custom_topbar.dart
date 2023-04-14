import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';

class CustomTopBar extends StatefulWidget {
  const CustomTopBar({
    super.key, required this.height,
  });
  final double height;

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Stack(children: [
      Container(
        // color: OPrimaryColor,
        height: widget.height,
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            OPrimaryColor,
            Colors.white,
            Colors.white,
          ],
        )),
      ),
      Positioned(
        bottom: -3,
        child: Container(
          height: 21,
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
