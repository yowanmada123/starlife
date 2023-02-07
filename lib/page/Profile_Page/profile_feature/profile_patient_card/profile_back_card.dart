import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileBackCard extends StatefulWidget {
  const ProfileBackCard({super.key});

  @override
  State<ProfileBackCard> createState() => _ProfileBackCardState();
}

class _ProfileBackCardState extends State<ProfileBackCard> {
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
                        child: Padding(
                          padding: EdgeInsets.all(c.sh*30.0),
                          child: Center(
                            child: Image.asset("assets/icon/ic_qr_code.JPG"),
                          ),
                        )
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
                  );;
  }
}