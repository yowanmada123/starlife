import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

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
      height: c.sh * 304,
      width: Get.width,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: c.sh * 53),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: ()=> Get.back(),
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
          padding: EdgeInsets.only(top: c.sh * 53),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: c.sw * 176,
                      height: c.sw * 176,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(widget.doctor.picture) 
                        // Image.asset("assets/icon/ic_doctor.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: c.sh * 12,
                  ),
                  Text(widget.doctor.namadokter).p18m().white(),
                  Text(widget.doctor.poli).p10r().white(),
                  SizedBox(
                    height: c.sh * 10,
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
