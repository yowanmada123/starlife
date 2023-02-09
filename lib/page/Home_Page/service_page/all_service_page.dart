import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/ext_text.dart';

class AllServicePage extends StatefulWidget {
  const AllServicePage({super.key});

  @override
  State<AllServicePage> createState() => _AllServicePageState();
}

class _AllServicePageState extends State<AllServicePage> {
  final c = Get.put(GlobalController());
  List<String> categoryImage = [
    'assets/icon/ic_igd.png',
    'assets/icon/ic_gigi.png',
    'assets/icon/ic_spesialis.png',
    'assets/icon/ic_farmasi.png',
    'assets/icon/ic_gizi.png',
    'assets/icon/ic_imunisasi.png',
  ];
  List<String> category = [
    'IGD',
    'Dokter Gigi',
    'Spesialis',
    'Instalasi Farmasi',
    'Pelayanan Gizi',
    'Imunisasi',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - c.sh * 300) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          const CustomTopBar(),
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: c.sh * 130,
                ),
                // Pelayanan(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: c.sw * 16.0),
                      child: GridView.count(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 4,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: c.sh * 10,
                          mainAxisSpacing: c.sw * 10,
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            category.length,
                            (index) => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(ExperiencedDoctorListPage(title: category[index],));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.9),
                                          spreadRadius: 0.1,
                                          blurRadius: 1,
                                          offset: const Offset(0, 0.1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    // height: c.sh * 100,
                                    width: c.sw * 80,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: c.sh * 50, child: Center(child: Image.asset(categoryImage[index]))),
                                        SizedBox(
                                          height: c.sh * 5,
                                        ),
                                        Center(
                                          child: AutoSizeText(
                                            category[index],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                                            maxLines: 2,
                                            minFontSize: 9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: c.sh * 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: c.sh * 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        const Text("Semua Pelayanan").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
