import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ScheduleAvailable extends StatefulWidget {
  const ScheduleAvailable({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<ScheduleAvailable> createState() => _ScheduleAvailableState();
}

class _ScheduleAvailableState extends State<ScheduleAvailable> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  bool _isPagiVisible = false;
  bool _isMalamVisible = false;
  String jadwal = "";
  // String selectedSchedule = "";
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
                    Icon(
                      Icons.sunny,
                      color: OPrimaryColor,
                      size: 25,
                    ),
                    SizedBox(width: 13),
                    const Text("Pagi").p14m().black(),
                  ],
                ),
                _isPagiVisible ? SvgPicture.asset("assets/icon/ic_arrow_up_rounded.svg") : SvgPicture.asset("assets/icon/ic_arrow_down_rounded.svg")
              ],
            ),
          ),
        ),
        Visibility(
          visible: _isPagiVisible,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() => Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                          child: Text(h.morningShcedule.toString()).p12m().white(),
                        )),
                  ],
                ),
              ),
            ],
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
                    Icon(
                      Icons.nights_stay_rounded,
                      color: OPrimaryColor,
                      size: 25,
                    ),
                    SizedBox(width: 13),
                    const Text("Malam").p14m().black(),
                  ],
                ),
                _isMalamVisible ? SvgPicture.asset("assets/icon/ic_arrow_up_rounded.svg") : SvgPicture.asset("assets/icon/ic_arrow_down_rounded.svg")
              ],
            ),
          ),
        ),
        Visibility(
          visible: _isMalamVisible,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(10)),
                      child: Text(h.nightSchedule.toString()).p12m().white(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
