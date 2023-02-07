import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ScheduleAvailable extends StatefulWidget {
  const ScheduleAvailable({super.key});

  @override
  State<ScheduleAvailable> createState() => _ScheduleAvailableState();
}

class _ScheduleAvailableState extends State<ScheduleAvailable> {
  final c = Get.put(GlobalController());
  bool _isPagiVisible = false;
  bool _isMalamVisible = true;

  void showPagiVisible() {
    setState(() {
      _isPagiVisible = !_isPagiVisible;
    });
  }
  void showMalamVisible() {
    setState(() {
      _isMalamVisible = !_isMalamVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: showPagiVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.sunny, color: OPrimaryColor,size: 25,),
                    SizedBox(width:c.sw*13),
                    const Text("Pagi").p14m().black(),
                  ],
                ),
                _isPagiVisible ?
                SvgPicture.asset("assets/icon/ic_arrow_down_rounded.svg") :
                SvgPicture.asset("assets/icon/ic_arrow_up_rounded.svg") 
              ],
            ),
          ),
        ),
        Visibility(
          visible: _isPagiVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                  decoration: BoxDecoration(
                    color: OPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text("8.00 - 10.00").p12m().white(),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: showMalamVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.nights_stay_rounded, color: OPrimaryColor,size: 25,),
                    SizedBox(width:c.sw*13),
                    const Text("Malam").p14m().black(),
                  ],
                ),
                _isMalamVisible ?
                SvgPicture.asset("assets/icon/ic_arrow_down_rounded.svg") :
                SvgPicture.asset("assets/icon/ic_arrow_up_rounded.svg") 
              ],
            ),
          ),
        ),
        Visibility(
          visible: _isMalamVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                  decoration: BoxDecoration(
                    color: OPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text("18.00 - 20.00").p12m().white(),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
