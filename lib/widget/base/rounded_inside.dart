import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';

class RoundedInside extends StatefulWidget {
  const RoundedInside({super.key, required this.child});
  final Widget child;

  @override
  State<RoundedInside> createState() => _RoundedInsideState();
}

class _RoundedInsideState extends State<RoundedInside> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: c.sh*109),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
      child: widget.child,
    );
  }
}