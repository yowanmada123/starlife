import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class HomePagePatientQueue extends StatefulWidget {
  const HomePagePatientQueue({super.key});

  @override
  State<HomePagePatientQueue> createState() => _HomePagePatientQueueState();
}

class _HomePagePatientQueueState extends State<HomePagePatientQueue> {
  final c = Get.put(GlobalController());
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: c.sh*372,
            width: Get.width,
            child: PageView.builder(
              controller: controller,
              itemCount: c.pasienNumber,
              allowImplicitScrolling: true,
              pageSnapping: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) { 
                return Container(
                  width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))
                ),
                        margin: EdgeInsets.symmetric(horizontal: c.sw*8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: c.sh * 15,
                            ),
                            Text("Nama Pasien").p14b().black(),
                            Text(
                              "Muhaammad Aulia Daffa",
                              textAlign: TextAlign.center,
                            ).p18b().primary(),
                            SizedBox(
                              height: c.sh * 12,
                            ),
                            Text("Nama Pasien").p14b().black(),
                            Text("DM016").p80eb().primary(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: c.sw*16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text("No. Rekam Medis").p9r().black(),
                                      Text("RM105").p18b().primary(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Antrian Dilayani").p9r().black(),
                                      Text("DM016").p18b().secondary(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Tanggal Pemeriksaan").p9r().black(),
                                      Text("24 / 11 / 2022").p18b().primary(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: c.sh * 10,
                            ),
                            Container(
                              width: Get.width,
                              height: 1,
                              margin: EdgeInsets.symmetric(horizontal: c.sw* 20),
                              decoration: BoxDecoration(
                                color: OPrimaryColor,
                
                              ),
                            ),
                            SizedBox(
                              height: c.sh * 10,
                            ),
                            Text("Status Kedatangan Dokter : ").p9r().black(),
                            Text("Sudah Datang").p18b().primary(),
                            SizedBox(
                              height: c.sh * 20,
                            ),
                          ],
                        ),
                      );
               },
            ),
          ),
        ),
        SizedBox(height: c.sh*10,),
        SmoothPageIndicator(
          controller: controller, 
          count: c.pasienNumber,
          effect: ExpandingDotsEffect(
            activeDotColor: OPrimaryColor,
            dotHeight: 8,
            spacing: 6
            
          ),
          
        ),
        SizedBox(
          height: c.sh * 15,
        ),
      ],
    );
  }
}