import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_immunization_page/profile_immunization_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class HomePageBrochure extends StatefulWidget {
  const HomePageBrochure({super.key});

  @override
  State<HomePageBrochure> createState() => _HomePageBrochureState();
}

class _HomePageBrochureState extends State<HomePageBrochure> {
  final c = Get.put(GlobalController());
  List<String> brochure = ['assets/images/brochure1.png', 'assets/images/brochure2.png', 'assets/images/brochure3.png'];
  var time = DateTime.now().hour;
  String now = "";

  init() {
    if (time < 12) {
      now = "assets/images/pagi.png";
    }
    if (time >= 12 && time <= 15) {
      now = "assets/images/siang.png";
    }
    if (time > 15 && time <= 18) {
      now = "assets/images/sore.png";
    }
    if (time > 18) {
      now = "assets/images/malam.png";
    }
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
    return GestureDetector(
      child: Column(
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
                    GestureDetector(
                      onTap: () {
                        print(time);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Yuk!").p52eb().white(),
                          const Text("Periksakan Kesehatan Anda!").p10r().white(),
                        ],
                      ),
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
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => SizedBox(
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
              decoration: BoxDecoration(color: const Color(0xffFFEBDB), borderRadius: BorderRadius.circular(15), border: Border.all(color: const Color(0xffFFA35C))),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const ProfileImmunizationPage());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Ingin Melihat Jadwal Imunisasi ?  ',
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: 'Lihat Disini', style: GoogleFonts.poppins(decoration: TextDecoration.underline, fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xffDF6100))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: c.sh * 15,
          ),
        ],
      ),
    );
  }
}
