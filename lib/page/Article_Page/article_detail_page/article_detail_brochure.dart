import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_news.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/ext_text.dart';

class ArticleDetailBrochure extends StatelessWidget {
  const ArticleDetailBrochure({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GlobalController());
    return Column(
      children: [
        Container(
          height: 420,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
          child: Stack(children: [
            Container(
              width: Get.width,
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: Get.width,
                height: 395,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset("assets/images/img_artikel1.png"),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: 395,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 255, 255, 255),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    )),
                width: Get.width,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: c.sh * 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ButtonBack(),
                  const SizedBox(
                    height: 235,
                  ),
                  const Text("1 Minute Ago").p10r().white(),
                  AutoSizeText(
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: Colors.white),
                    news.judul,
                    minFontSize: 18,
                    maxFontSize: 20,
                  )
                  // Text(news.judul).p20b().white()
                ],
              ),
            )
          ]),
        ),
        SizedBox(
          height: c.sh * 20,
        ),
      ],
    );
  }
}
