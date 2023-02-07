import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

class ArticleDetailBrochure extends StatelessWidget {
  const ArticleDetailBrochure({super.key});

  @override
  Widget build(BuildContext context) {
  final c = Get.put(GlobalController());

    return Column(
      children: [
        Container(
          height: 420,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            )
          ),
          child: Stack(
            children:[
              Container(
                width: Get.width,
              ),
                Positioned(
                top: 0,
                  child: Container(
                  width: Get.width,
                  height: 395,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset("assets/images/img_artikel1.png"),
                  ),
                  ),
                ),
                Positioned(
                top: 10,
                  child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 255, 255, 255),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    )
                  ),
                  width: Get.width,
                  height: 400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.0, left: c.sh*16),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ButtonBack(),
                    SizedBox(height: 235,),
                    Text("1 Minute Ago").p10r().white(),
                    Text("Kenali 6 Kebiasaan yang Membahayakan Gigi").p20b().white()
                  ],
                  ),
                )
            ]
          ),
        ),
        SizedBox(height: c.sh*20,),
      ],
    );
  }
}