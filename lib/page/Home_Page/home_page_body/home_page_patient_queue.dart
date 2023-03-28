import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:starlife/page/Home_Page/home_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

class HomePagePatientQueue extends StatefulWidget {
  const HomePagePatientQueue({super.key});

  @override
  State<HomePagePatientQueue> createState() => _HomePagePatientQueueState();
}

class _HomePagePatientQueueState extends State<HomePagePatientQueue> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await h.getDataPatientQueue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => (h.loadingPatientQueueData.value)
          ? Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: SizedBox(
                //     height:340,
                //     width: Get.width,
                //     child: PageView.builder(
                //       controller: controller,
                //       itemCount: c.pasienNumber,
                //       allowImplicitScrolling: true,
                //       pageSnapping: true,
                //       physics: const BouncingScrollPhysics(),
                //       itemBuilder: (BuildContext context, int index) {
                //         return Container(
                //           width: Get.width,
                //         decoration: BoxDecoration(
                //           borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                //           border: Border.all(color: Colors.grey.withOpacity(0.3))
                //         ),
                //                 margin: EdgeInsets.symmetric(horizontal: c.sw*8),
                //                 child: Column(
                //                   children: [
                //                     SizedBox(
                //                       height:    15,
                //                     ),
                //                     const Text("Nama Pasien").p14b().black(),
                //                     const Text(
                //                       "Muhaammad Aulia Daffa",
                //                       textAlign: TextAlign.center,
                //                     ).p18b().primary(),
                //                     SizedBox(
                //                       height:    12,
                //                     ),
                //                     const Text("Nama Pasien").p14b().black(),
                //                     const Text("DM016").p80eb().primary(),
                //                     Padding(
                //                       padding: EdgeInsets.symmetric(horizontal: c.sw*16),
                //                       child: Row(
                //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                         crossAxisAlignment: CrossAxisAlignment.center,
                //                         children: [
                //                           Column(
                //                             children: [
                //                               const Text("No. Rekam Medis").p10r().black(),
                //                               const Text("RM105").p18b().primary(),
                //                             ],
                //                           ),
                //                           Column(
                //                             children: [
                //                               const Text("Antrian Dilayani").p10r().black(),
                //                               const Text("DM016").p18b().secondary(),
                //                             ],
                //                           ),
                //                           Column(
                //                             children: [
                //                               const Text("Tanggal Pemeriksaan").p10r().black(),
                //                               const Text("24 / 11 / 2022").p18b().primary(),
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height:    10,
                //                     ),
                //                     Container(
                //                       width: Get.width,
                //                       height: 1,
                //                       margin: EdgeInsets.symmetric(horizontal: c.sw* 20),
                //                       decoration: BoxDecoration(
                //                         color: OPrimaryColor,

                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height:    10,
                //                     ),
                //                     const Text("Status Kedatangan Dokter : ").p10r().black(),
                //                     const Text("Sudah Datang").p18b().primary(),
                //                     SizedBox(
                //                       height:    20,
                //                     ),
                //                   ],
                //                 ),
                //               );
                //        },
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 290,
                    width: Get.width,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: h.listPatientQueue.length,
                      allowImplicitScrolling: true,
                      pageSnapping: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: Get.width,
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(15.0)), border: Border.all(color: Colors.grey.withOpacity(0.3))),
                          margin: EdgeInsets.symmetric(horizontal: c.sw * 8),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              const Text("Nama Pasien").p14b().black(),
                              AutoSizeText(
                                h.listPatientQueue[index].namaPasien,
                                maxFontSize: 18,
                                minFontSize: 10,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: OPrimaryColor),
                              ),
                              // Text(
                              //   // "Muhaammad Aulia Daffa",
                              //   h.listPatientQueue[index].namaPasien,
                              //   textAlign: TextAlign.center,
                              // ).p18b().primary(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Nomor Antrian Anda").p14b().black(),
                              AutoSizeText(
                                h.listPatientQueue[index].formatNomor,
                                maxFontSize: 90,
                                minFontSize: 50,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w800, color: OPrimaryColor),
                              ),
                              // Text(
                              //     // "DM016"
                              //     h.listPatientQueue[index].formatNomor).p80eb().primary(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("No. Rekam Medis").p10r().black(),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: AutoSizeText(
                                            // "RM105",
                                            h.listPatientQueue[index].rm,
                                            maxFontSize: 18,
                                            minFontSize: 10,
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: OPrimaryColor),
                                          ),
                                        ),
                                        // const Text("RM105"
                                        //         // h.listPatientQueue[index].rm
                                        //         )
                                        //     .p18b()
                                        //     .primary(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text("Antrian Dilayani").p10r().black(),
                                        AutoSizeText(
                                          // "RM105",
                                          h.listPatientQueue[index].antrianSedangDilayani,
                                          maxFontSize: 25,
                                          minFontSize: 10,
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: OSecondaryColor),
                                        ),
                                        // const Text("DM016"
                                        //         // h.listPatientQueue[index].antrianSedangDilayani
                                        //         )
                                        //     .p18b()
                                        //     .secondary(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text("Tanggal Pemeriksaan").p10r().black(),
                                        AutoSizeText(
                                          // "RM105",
                                          // DateTime(h.listPatientQueue[index].date) as String,
                                          DateTime.parse(h.listPatientQueue[index].date).toSlashDate(),
                                          // h.listPatientQueue[index].antrianSedangDilayani,
                                          maxFontSize: 25,
                                          minFontSize: 10,
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: OPrimaryColor),
                                        ),
                                        // const Text("24 / 11 / 2022"
                                        //         // DateTime.parse(h.listPatientQueue[index].date).toSlashDate()
                                        //         )
                                        //     .p18b()
                                        //     .primary(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.width,
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: c.sw * 20),
                                decoration: BoxDecoration(
                                  color: OPrimaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Status Kedatangan Dokter : ").p10r().black(),
                              Text(
                                  // "Sudah Datang"
                                  h.listPatientQueue[index].statusKedatanganDokter).p18b().primary(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: h.listPatientQueue.length,
                  effect: ExpandingDotsEffect(activeDotColor: OPrimaryColor, dotHeight: 8, spacing: 6),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )
          : Container()),
    );
  }
}
