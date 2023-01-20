import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
              child: Container(
            color: OPrimaryColor,
            height: c.sh * 115,
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: (17),
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: (15), child: Image.asset("assets/images/img_person.png")),
                      ),
                      SizedBox(
                        width: c.sw * 12,
                      ),
                      Expanded(
                        child: Container(
                          // width: Get.width,
                          height: c.sh * 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 0.3,
                                blurRadius: 5,
                                offset: const Offset(0, 0.1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: c.sw * 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Cari Nama Dokter dan Pelayanan").p10r().grey(),
                                Container(
                                  width: c.sw * 22,
                                  height: c.sh * 22,
                                  decoration: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 12,
                      ),
                      const Icon(Icons.notifications, color: Colors.white,)
                      // Image.asset("assets/icon/ic_notification.png")
                    ],
                  ),
                ],
              ),
            ),
          ));
  }
}