import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_page.dart';
import 'package:starlife/page/Home_Page/home_controller.dart';
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

  final h = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    h.getDataDoctors();
    // loading.value = false;
  }

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
                  itemCount: h.listDoctors.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          Get.to(ScheduleDetailPage(doctor:h.listDoctors[index]));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: c.sh * 10,
                            ),
                            Container(
                                height: 125,
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
                                        child: 
                                        Image.network(width: c.sw * 105,
                                          height: c.sw * 105,
                                          h.listDoctors[index].picture,
                                          fit: BoxFit.cover,)
                                        // Image.asset(
                                        //   width: c.sw * 105,
                                        //   height: c.sw * 105,
                                        //   h.listDoctors[index].picture,
                                        //   fit: BoxFit.cover,
                                        // ),
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
                                              AutoSizeText(h.listDoctors[index].namadokter, maxLines: 1, style: GoogleFonts.poppins(fontSize: 14, color: OPrimaryColor, fontWeight: FontWeight.w700), minFontSize: 5),
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
                                                child: Text(h.listDoctors[index].poli).p10r(),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icon/ic_icon_pagi.png",
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  const SizedBox(width: 8,),
                                                  Text("08.00 -17.00").p12m().primary()
                                                ],
                                              ),
                                              const SizedBox(height: 3,),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icon/ic_icon_malam.png",
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  const SizedBox(width: 8,),
                                                  Text("19.00 -21.00").p12m().primary()
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
