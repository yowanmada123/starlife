import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/page/Home_Page/home_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

class ScheduleDoctor extends StatefulWidget {
  const ScheduleDoctor({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<ScheduleDoctor> createState() => _ScheduleDoctorState();
}

class _ScheduleDoctorState extends State<ScheduleDoctor> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  List<DateTime> days = [];
  DateTime today = DateTime.now();
  var selectedIndex = 0.obs;
  bool _isPagiVisible = false;
  bool _isMalamVisible = true;
  String timeSchedule = '';
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

  selectedDay(int i) {
    switch (days[i].toEEEE()) {
      case "Senin":
        h.morningShcedule.value = widget.doctor.jadwalPagi.senin;
        h.nightSchedule.value = widget.doctor.jadwalMalam.senin;
        break;
      case "Selasa":
        // h.selectedSchedule.value = "09:00 - 20:00";
        h.morningShcedule.value = widget.doctor.jadwalPagi.selasa;
        h.nightSchedule.value = widget.doctor.jadwalMalam.selasa;
        break;
      case "Rabu":
        // h.selectedSchedule.value = "10:00 - 21:00";
        h.morningShcedule.value = widget.doctor.jadwalPagi.rabu;
        h.nightSchedule.value = widget.doctor.jadwalMalam.rabu;
        break;
      case "Kamis":
        // h.selectedSchedule.value = "10:00 - 22:00";
        h.morningShcedule.value = widget.doctor.jadwalPagi.kamis;
        h.nightSchedule.value = widget.doctor.jadwalMalam.kamis;
        break;
      case "Jumat":
        h.morningShcedule.value = widget.doctor.jadwalPagi.jumat;
        h.nightSchedule.value = widget.doctor.jadwalMalam.jumat;
        break;
      default:
        h.morningShcedule.value = widget.doctor.jadwalPagi.sabtu;
        h.nightSchedule.value = widget.doctor.jadwalMalam.sabtu;
    }
    print(days[i].toEEEE());
    print(h.morningShcedule);
  }

  init() {
    for (var i = 0; i < 7; i++) {
      if (i == 0) {
        days.add(today);
        selectedDay(i);
      } else {
        days.add(DateTime(today.year, today.month, today.day + i));
      }
    }
    for (var i = 0; i < 7; i++) {
      // print(days[i].toEEEE().toLowerCase());
      // selectedDay(i);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: c.sw * 16, right: c.sw * 16, bottom: c.sh * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Jadwal Dokter").p16b().black(),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: c.sw * 16.0,
                right: c.sw * 14,
              ),
              child: Icon(
                Icons.date_range_outlined,
                color: OPrimaryColor,
                size: 25,
              ),
            ),
            Container(
              height: c.sh * 36,
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                width: 1,
                color: Colors.black,
              ))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: SizedBox(
                    height: 52,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: days.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int itemIndex) => Row(
                          children: [
                            SizedBox(
                              width: c.sw * 2,
                            ),
                            Obx(() => GestureDetector(
                                  onTap: () {
                                    // print(widget.doctor.jadwaldokter.senin);
                                    selectedIndex.value = itemIndex;
                                    selectedDay(selectedIndex.value);
                                    // setState(() {
                                    // selectedIndex.value = itemIndex;
                                    // print(itemIndex);
                                    // print(days[itemIndex].toEEEE().toLowerCase());
                                    // h.selectedSchedule.value = days[itemIndex].toEEEE().toLowerCase();
                                    // });
                                    // print(days[itemIndex]);
                                    // print(h.selectedSchedule.value);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // ignore: unrelated_type_equality_checks
                                      color: selectedIndex == itemIndex ? OPrimaryColor : const Color(0xff9CA7BD),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.9),
                                          spreadRadius: 0.1,
                                          blurRadius: 1,
                                          offset: const Offset(0, 0.1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    height: c.sh * 52,
                                    width: c.sw * 50,
                                    child: Center(
                                        child: itemIndex == 0
                                            ? const Text("Hari ini").p12m().white()
                                            : Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: 30,
                                                      child: Text(
                                                        days[itemIndex].toEEEE() == 'Senin'
                                                            ? "Sen"
                                                            : days[itemIndex].toEEEE() == 'Sabtu'
                                                                ? 'Sab'
                                                                : days[itemIndex].toEEEE() == 'Selasa'
                                                                    ? 'Sel'
                                                                    : days[itemIndex].toEEEE(),
                                                        maxLines: 1,
                                                        style: const TextStyle(height: 1.5),
                                                        textAlign: TextAlign.center,
                                                      ).p12m().white()),
                                                  Text(
                                                    days[itemIndex].toTheDay(),
                                                    style: const TextStyle(height: 1.3),
                                                  ).p12m().white(),
                                                ],
                                              )),
                                  ),
                                )),
                            SizedBox(
                              width: c.sw * 14,
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: c.sh * 13,
        ),
        const Divider(),
      ],
    );
  }
}
