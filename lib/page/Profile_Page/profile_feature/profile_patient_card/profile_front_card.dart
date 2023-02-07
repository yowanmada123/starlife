import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileFrontCard extends StatefulWidget {
  const ProfileFrontCard({super.key});

  @override
  State<ProfileFrontCard> createState() => _ProfileFrontCardState();
}

class _ProfileFrontCardState extends State<ProfileFrontCard> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Container(
                    child: Stack(
                      children: [
                      Container(
                        height: c.sh * 194,
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
                            SizedBox(
                              height: c.sh * 23,
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
                            ).p8r(),
                            SizedBox(
                              height: c.sh * 13,
                            ),
                            Stack(children: [
                              Center(
                                child: Container(
                                  width: c.sw * 250,
                                  height: c.sh * 60,
                                  foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff5CC7AC),
                                        Color(0xff8DCCA2).withOpacity(0.5),
                                        Color(0xfffCBD395),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(children: [
                                const Text(
                                  "SARAH CELESTIA BELLA",
                                  textAlign: TextAlign.center,
                                ).p12m().white(),
                                SizedBox(
                                  height: c.sh * 4,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: c.sw * 50),
                                  child: Container(
                                    height: c.sh * 1,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.white,
                                    ))),
                                  ),
                                ),
                                SizedBox(
                                  height: c.sh * 4,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: c.sw * 55),
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
                                          ).p6m().white(),
                                          const Text(
                                            "RM21285-101223/50015",
                                            textAlign: TextAlign.center,
                                          ).p8m().white(),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Tanggal Lahir",
                                            textAlign: TextAlign.center,
                                          ).p6m().white(),
                                          const Text(
                                            "02/12/1985",
                                            textAlign: TextAlign.center,
                                          ).p8m().white(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
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
                                        ).p6m(),
                                        Container(
                                          width: c.sw * 160,
                                          child: const Text(
                                            "Ruko City Pride (Palacio) B23 Lt. 1Jl. Nginden Semolo 42 Surabaya",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(color: Color(0xff15577A)),
                                          ).p8m(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: c.sw * 5,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "No. Telp",
                                          style: TextStyle(color: Color(0xff15577A)),
                                        ).p6m(),
                                        const Text(
                                          "0895522091349",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Color(0xff15577A)),
                                        ).p8m(),
                                      ],
                                    ),
                                    SizedBox(
                                      width: c.sw * 5,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Terdaftar Sejak",
                                          style: TextStyle(color: Color(0xff15577A)),
                                        ).p6m(),
                                        const Text(
                                          "10/12/2022",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Color(0xff15577A)),
                                        ).p8m(),
                                      ],
                                    )
                                  ],
                                )
                              ]),
                            ])
                          ],
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/icon/ic_logo.png",
                            width: c.sw * 38,
                            height: c.sh * 38,
                          )),
                      Positioned(bottom: 0, right: 0, child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(10)), child: Image.asset("assets/images/bg_bottomRight.png"))),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                "assets/images/bg_topLeft.png",
                                width: c.sw * 70,
                                height: c.sh * 100,
                              )))
                    ]),
                  );
  }
}