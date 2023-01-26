import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class Brochure extends StatefulWidget {
  const Brochure({super.key});

  @override
  State<Brochure> createState() => _BrochureState();
}

class _BrochureState extends State<Brochure> {
  final c = Get.put(GlobalController());
  List<String> brochure = ['assets/images/brochure1.png', 'assets/images/brochure2.png', 'assets/images/brochure3.png'];
  var time = DateTime.now().hour;
  String now = "";

  init() {
    if (time < 12) {
      now = "assets/images/pagi.png";
      // return 'Morning';
    }
    if (time > 12 && time <= 15) {
      now = "assets/images/siang.png";
    }
    if (time > 13 && time <= 18) {
      now = "assets/images/sore.png";
    }
    if (time > 18) {
      now = "assets/images/malam.png";
    }
    print("==========================================");
    print(now);
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
        Container(
          height: c.sh * 290,
          width: Get.width,
          decoration: BoxDecoration(
            color: OPrimaryColor,
            borderRadius: const BorderRadius.only(
                // topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
                // topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: c.sh * 130,
              ),
              Row(
                children: [
                  SizedBox(
                    width: c.sw * 11,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Yuk!").p52eb().white(),
                      Text("Periksakan Kesehatan Anda!").p10r().white(),
                    ],
                  ),
                  // SvgPicture.asset("assets/icon/ic_doctor.svg"),
                  SvgPicture.asset(
                    "assets/icon/ic_doctor.svg",
                    width: c.sw * 198,
                    height: c.sh * 160,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: c.sh * 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
          child: Image.asset(now),
        ),
        SizedBox(
          height: c.sh * 12,
        ),
        SizedBox(
          height: 130,
          child: CarouselSlider.builder(
            itemCount: brochure.length,
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.89,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
              child: Column(
                children: [
                  SizedBox(
                    height: c.sh * 1,
                  ),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Color(0x54000000), spreadRadius: 1, blurRadius: 5, offset: Offset(0.0, 1.0)),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        brochure[itemIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: c.sh * 1,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: c.sh * 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: c.sh * 42,
            width: Get.width,
            decoration: BoxDecoration(color: Color(0xffFFEBDB), borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xffFFA35C))),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Ingin Melihat Jadwal Imunisasi ?  ',
                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'Lihat Disini', style: GoogleFonts.poppins(decoration: TextDecoration.underline, fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xffDF6100))),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: c.sh * 20,
        ),
      ],
    );
  }
}
