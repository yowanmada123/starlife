import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_notification_page/profile_notification_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class HomePageTopBar extends StatefulWidget {
  const HomePageTopBar({super.key});

  @override
  State<HomePageTopBar> createState() => _HomePageTopBarState();
}

class _HomePageTopBarState extends State<HomePageTopBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      color: OPrimaryColor,
      height: c.sh * 112,
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            if (c.isLogin.value == false) ...[
              Container(
                // width: Get.width,
                height: c.sh * 39,
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
            ] else ...[
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      c.tabHomeIndex.value = 4;
                      Get.offAll(HelloConvexAppBar());
                    },
                    child: CircleAvatar(
                      radius: (19),
                      backgroundColor: Colors.white,
                      child: CircleAvatar(radius: (19), child: Image.asset("assets/images/img_person1.png")),
                    ),
                  ),
                  SizedBox(
                    width: c.sw * 12,
                  ),
                  Expanded(
                    child: Container(
                      // width: Get.width,
                      height: c.sh * 39,
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
                  GestureDetector(
                    onTap: () {
                      Get.to(const ProfileNotificationPage());
                    },
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                  // Image.asset("assets/icon/ic_notification.png")
                ],
              ),
            ]
          ],
        ),
      ),
    ));
  }

  void onTabTapped(int index) {
    c.tabHomeIndex.value = index;
  }
}
