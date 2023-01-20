import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:dart_date/dart_date.dart';
import 'package:starlife/widget/extention/ext_date.dart';

class JadwalDokter extends StatefulWidget {
  const JadwalDokter({super.key});

  @override
  State<JadwalDokter> createState() => _JadwalDokterState();
}

class _JadwalDokterState extends State<JadwalDokter> {
  final c = Get.put(GlobalController());
  List<DateTime> days = [];
  DateTime today = DateTime.now();
  int selectedIndex = 1;
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

  init() {
    for (var i = 0; i < 7; i++) {
      if (i == 0) {
        days.add(today);
      } else {
        days.add(DateTime(today.year, today.month, today.day + i));
      }
    }
    for (var i = 0; i < 7; i++) {
      print(days[i]);
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
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
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
              padding: EdgeInsets.only(left: c.sw * 16.0, right: c.sw * 14),
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = itemIndex;
                                });
                                print(days[itemIndex]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedIndex == itemIndex ? OPrimaryColor : Color(0xff9CA7BD),
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
                                width: c.sw * 52,
                                child: Center(
                                    child: itemIndex == 0
                                        ? const Text("Hari ini").p12m().white()
                                        : Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: c.sw * 31,
                                                  child: Text(
                                                    days[itemIndex].toEEEE(),
                                                    maxLines: 1,
                                                    style: TextStyle(height: 1.5),
                                                    textAlign: TextAlign.center,
                                                  ).p12m().white()),
                                              Text(days[itemIndex].toTheDay(),
                                                    style: TextStyle(height: 1.3),).p12m().white(),
                                            ],
                                          )
                                   
                                    ),
                              ),
                            ),
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
