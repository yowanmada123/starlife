import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Auth_Page/splashscreen.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/controllers/profile_controller.dart';
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
  final p = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      p.loadingPersonal.value = false;
      p.getDataPersonal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      color: OPrimaryColor,
      height: 100,
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Obx(() => (p.loadingPersonal.value)
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () async{
                            // setState(() async{
                            //   // print(c.tabHomeIndex.value);
                            // });
                              // await c.tabHomeIndex.value = 4;
                              c.onTabTapped(4);
                              // Get.offAll(HelloConvexAppBar());
                              // Get.offAll(BlankScreen());
                              // Get.to(HelloConvexAppBar());
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(1000)),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              color: Colors.white,
                              width: 35,
                              height: 35,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.network(p.person!.picture, errorBuilder: (context, error, stackTrace) {
                                      return Image.asset("assets/images/img_avatar.png");
                                    })),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: c.sw * 12,
                      ),
                      Expanded(
                        child: Container(
                          // width: Get.width,
                          height:    39,
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
                                  height:    22,
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
                  )
                : Container(
                    // width: Get.width,
                    height:    39,
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
                            height:    22,
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
                  ))
          ],
        ),
      ),
    ));
  }

  void onTabTapped(int index) {
    c.tabHomeIndex.value = index;
  }
}
