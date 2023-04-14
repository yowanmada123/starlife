import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';

class RoundedInside extends StatefulWidget {
  const RoundedInside({super.key, required this.child, required this.height});
  final Widget child;
  final double height;

  @override
  State<RoundedInside> createState() => _RoundedInsideState();
}

class _RoundedInsideState extends State<RoundedInside> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.height),
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: widget.child,
    );
  }
}
