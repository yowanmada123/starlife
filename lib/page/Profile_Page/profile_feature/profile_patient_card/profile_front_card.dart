import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileFrontCard extends StatefulWidget {
  const ProfileFrontCard({super.key});

  @override
  State<ProfileFrontCard> createState() => _ProfileFrontCardState();
}

class _ProfileFrontCardState extends State<ProfileFrontCard> {
  final p = Get.put(ProfileController());
  final c = Get.put(GlobalController());
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      p.getDataPersonal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        Obx(() => (p.loadingPersonal.value)
            ? Container(
                height: 194,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 227, 226, 226),
                      blurRadius: 3.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        8.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    const Text(
                      "Kartu Pasien Klinik Starlife",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff15577A)),
                    ).p14m(),
                    const Text(
                      "Kartu pasien ini diberikan kepada :",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff15577A)),
                    ).p10r(),
                    const SizedBox(
                      height: 13,
                    ),
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 60,
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xff5CC7AC),
                                  const Color(0xff8DCCA2).withOpacity(0.5),
                                  const Color(0xfffcbd395),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            p.person!.fname,
                            // "SARAH CELESTIA BELLA",
                            textAlign: TextAlign.center,
                          ).p12m().white(),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.white,
                              ))),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "No. RM",
                                      textAlign: TextAlign.center,
                                    ).p10r().white(),
                                    Text(
                                      p.person!.rm,
                                      textAlign: TextAlign.center,
                                    ).p10r().white(),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Tanggal Lahir",
                                      textAlign: TextAlign.center,
                                    ).p10r().white(),
                                    Text(
                                      p.birthday,
                                      textAlign: TextAlign.center,
                                    ).p10r().white(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                    Column(children: [
                      // const Text(
                      //   "SARAH CELESTIA BELLA",
                      //   textAlign: TextAlign.center,
                      // ).p12m().white(),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal:   50),
                      //   child: Container(
                      //     height: 1,
                      //     decoration: const BoxDecoration(
                      //         border: Border(
                      //             bottom: BorderSide(
                      //       color: Colors.white,
                      //     ))),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal:   55),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           const Text(
                      //             "No. RM",
                      //             textAlign: TextAlign.center,
                      //           ).p10r().white(),
                      //           const Text(
                      //             "RM21285-101223/50015",
                      //             textAlign: TextAlign.center,
                      //           ).p10r().white(),
                      //         ],
                      //       ),
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           const Text(
                      //             "Tanggal Lahir",
                      //             textAlign: TextAlign.center,
                      //           ).p10r().white(),
                      //           const Text(
                      //             "02/12/1985",
                      //             textAlign: TextAlign.center,
                      //           ).p10r().white(),
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Alamat",
                                style: TextStyle(color: Color(0xff15577A)),
                              ).p8r(),
                              SizedBox(
                                width: 140,
                                child: Text(
                                  p.person!.address,
                                  // "Ruko City Pride (Palacio) B23 Lt. 1Jl. Nginden Semolo 42 Surabaya",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Color(0xff15577A)),
                                ).p8r(),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "No. Telp",
                                style: TextStyle(color: Color(0xff15577A)),
                              ).p8r(),
                              Text(
                                p.person!.phone,
                                // "0895522091349",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Color(0xff15577A)),
                              ).p8r(),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Terdaftar Sejak",
                                style: TextStyle(color: Color(0xff15577A)),
                              ).p8r(),
                              Text(
                                p.createDate,
                                // "10/12/2022",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Color(0xff15577A)),
                              ).p8r(),
                            ],
                          )
                        ],
                      )
                    ])
                  ],
                ),
              )
            : CircularProgressIndicator()),
        Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/icon/ic_logo.png",
              width: 38,
              height: 38,
            )),
        Positioned(bottom: 0, right: 0, child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(10)), child: Image.asset("assets/images/bg_bottomRight.png"))),
        Positioned(
            top: 0,
            left: 0,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  "assets/images/bg_topLeft.png",
                  width: 70,
                  height: 100,
                )))
      ]),
    );
  }
}
