import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ListDokter extends StatefulWidget {
  final bool? passwordMode;

  const ListDokter({super.key, this.passwordMode});

  @override
  State<ListDokter> createState() => _ListDokterState();
}

class _ListDokterState extends State<ListDokter> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  List<Dokter> docters = [
    Dokter(id: "01", name: "dr. Sugiarto Syamsudin", layanan: "Dokter Anak", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor.png"),
    Dokter(id: "02", name: "Muhammad Aulia Daffa", layanan: "Dokter Mata", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor1.png"),
    Dokter(id: "03", name: "Darmawan Gunawangsa", layanan: "Dokter Umum", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor2.png"),
    Dokter(id: "04", name: "Hendri Sulaiman", layanan: "Dokter Umum", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor3.png"),
    Dokter(id: "05", name: "dr. Sugiarto Syamsudin", layanan: "Dokter Anak", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor.png"),
    Dokter(id: "06", name: "Muhammad Aulia Daffa", layanan: "Dokter Mata", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor1.png"),
    Dokter(id: "07", name: "Darmawan Gunawangsa", layanan: "Dokter Umum", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor2.png"),
    Dokter(id: "08", name: "Hendri Sulaiman", layanan: "Dokter Umum", jamPagi: "08:00 WIB - 12:00 WIB", jamMalam: "18:00 WIB - 20:00 WIB", image: "assets/images/img_doctor3.png"),
  ];
  int selectedDoctorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
         SingleChildScrollView(
          physics: const ScrollPhysics(),
           child: Column(
                   children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: docters.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          Get.to(const ScheduleDetailPage());
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: c.sh * 10,
                            ),
                            Container(
                                height: c.sh * 129,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: const Color.fromRGBO(225, 225, 225, 1)),
                                  boxShadow: const [
                                    BoxShadow(color: Color(0x54000000), spreadRadius: 0.1, blurRadius: 0.5, offset: Offset(0.0, 0.1)),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          width: c.sw * 105,
                                          height: c.sw * 105,
                                          docters[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: c.sw * 13,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Stack(children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(docters[index].name, maxLines: 1, style: GoogleFonts.poppins(fontSize: 14, color: OPrimaryColor, fontWeight: FontWeight.w700), minFontSize: 5),
                                              SizedBox(
                                                height: c.sh * 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                  color: Color.fromARGB(255, 234, 234, 234),
                                                ))),
                                              ),
                                              SizedBox(
                                                height: c.sh * 5,
                                              ),
                                              Container(
                                                child: Text(docters[index].layanan).p10r(),
                                              ),
                                              SizedBox(
                                                height: c.sh * 5,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icon/ic_icon_pagi.png",
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  Text(docters[index].jamPagi).p12m().primary()
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icon/ic_icon_malam.png",
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  Text(docters[index].jamMalam).p12m().primary()
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        width: c.sw * 15,
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: c.sh * 5,
                            )
                          ],
                        ),
                      )),
            ),
                    
                   ],
                 ),
         ),
      ]
    );
  }
}

class Dokter {
  final String id;
  final String name;
  final String layanan;
  final String jamPagi;
  final String jamMalam;
  final String image;

  Dokter({
    required this.id,
    required this.name,
    required this.layanan,
    required this.jamPagi,
    required this.jamMalam,
    required this.image,
  });

  @override
  String toString() {
    return '{ $name, $id }';
  }
}
