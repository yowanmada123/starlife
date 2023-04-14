import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_poli.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_page.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ListDoctor extends StatefulWidget {
  final Poli? poli;

  const ListDoctor({super.key, this.poli});

  @override
  State<ListDoctor> createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());

  final h = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    if (widget.poli != null) {
      SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
        h.selectedDepartment.value = widget.poli!.dprtId;
        h.getListDoctorByPoli();
      });
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      // 10,
                      h.listDoctors.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          Get.to(ScheduleDetailPage(
                              doctor:
                                  // h.listDoctors[0],
                                  h.listDoctors[index]));
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
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
                                          child: Image.network(
                                            width: 105,
                                            height: 105,
                                            // h.listDoctors[0].picture,
                                            h.listDoctors[index].picture,
                                            fit: BoxFit.cover,
                                          )
                                          // Image.asset(
                                          //   width:   105,
                                          //   height:   105,
                                          //   h.listDoctors[index].picture,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Stack(children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                  // h.listDoctors[0].namadokter,
                                                  h.listDoctors[index].namadokter,
                                                  maxLines: 1,
                                                  style: GoogleFonts.poppins(fontSize: 14, color: OPrimaryColor, fontWeight: FontWeight.w700),
                                                  minFontSize: 5),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                  color: Color.fromARGB(255, 234, 234, 234),
                                                ))),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Text(
                                                    // h.listDoctors[0].poli
                                                    // ).p10r(),
                                                    h.listDoctors[index].poli).p10r(),
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
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(h.listDoctors[index].jadwalPagi.senin
                                                          // "08.00 -17.00"
                                                          )
                                                      .p12m()
                                                      .primary()
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icon/ic_icon_malam.png",
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                      // "19.00 -21.00"
                                                      h.listDoctors[index].jadwalMalam.minggu).p12m().primary()
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      )),
            ),
          ],
        ),
      ),
    ]);
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
