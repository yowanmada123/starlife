import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    Dokter(id: "01", name: "dr. Sugiarto Syamsudin", layanan: "Poliklinik Geriatri (Layanan Orang tua Sehat)",  jam: "18:00 WIB - 20:00 WIB"),
    Dokter(id: "02",  name: "Muhammad Aulia Daffa", layanan: "Poliklinik Geriatri (Layanan Orang tua Sehat)",   jam: "18:00 WIB - 20:00 WIB"),
    Dokter(id: "03", name: "Darmawan Gunawangsa", layanan: "Poliklinik Geriatri (Layanan Orang tua Sehat)",  jam: "18:00 WIB - 20:00 WIB"),
  ];
  int selectedDoctorIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: docters.length,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) =>
              index == docters.length-1 ? 
              Column(
                children: [
                  ItemList(index),
                  SizedBox(
                    height: 80,
                  )
                ],
              ) :
                  ItemList(index),
          ),
                  // SizedBox(height: c.sh*20,)
        ],
      ),
    );
  }

  GestureDetector ItemList(int index) {
    return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDoctorIndex = index;
                    });
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
                            border: Border.all(color: Color.fromRGBO(225, 225, 225, 1)),
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
                                    width: c.sw*105,
                                    height: c.sw*105,
                                    "assets/images/img_avatar_2.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: c.sw * 13,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
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
                                            Image.asset("assets/icon/ic_icon_pagi.png", width: 14, height: 14,),
                                            // SizedBox(
                                            //   width: c.sw *10,
                                            // ),
                                            Text(docters[index].jam).p12m().primary()
                                          ],
                                        )
                                      ],
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  width: c.sw * 15,
                                ),
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(200), border: Border.all(color: selectedDoctorIndex == index ? OPrimaryColor : Color.fromARGB(255, 204, 203, 203)), color: selectedDoctorIndex == index ? OPrimaryColor : Colors.white),
                                    child: selectedDoctorIndex == index 
                                        ? Center(
                                            child: Icon(
                                            Icons.done_outlined,
                                            color: Colors.white,
                                            size: 15,
                                          ))
                                        : Container())
                              ],
                            ),
                          )),
                      SizedBox(
                        height: c.sh * 5,
                      )
                    ],
                  ),
                );
  }
}

class Dokter {
  final String id;
  final String name;
  final String layanan;
  final String jam;

  Dokter({
    required this.id,
    required this.name,
    required this.layanan,
    required this.jam, 
  });

  @override
  String toString() {
    return '{ ${this.name}, ${this.id} }';
  }
}
