import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilantopbar halaman atau bagian dari halaman detail shcedule dokter

class ScheduleTopBar extends StatefulWidget {
  const ScheduleTopBar({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<ScheduleTopBar> createState() => _ScheduleTopBarState();
}

class _ScheduleTopBarState extends State<ScheduleTopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      color: OPrimaryColor,
      height: 304,
      width: Get.width,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 53),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: ClipOval(
                  child: Material(
                    color: Colors.white,
                    child: SizedBox(
                        width: 32,
                        height: 32,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 7.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 17,
                              color: Colors.black,
                            ),
                          )
                        ])),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 53),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: 176,
                      height: 176,
                      child: FittedBox(fit: BoxFit.cover, child: Image.network(widget.doctor.picture)
                          // Image.asset("assets/icon/ic_doctor.png"),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(widget.doctor.namadokter).p18m().white(),
                  Text(widget.doctor.poli).p10r().white(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
