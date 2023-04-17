import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_page.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';


// Tampilan dokter berpengalaman atau bagian pada halaman HomePage
class HomePageExperiencedDoctor extends StatefulWidget {
  const HomePageExperiencedDoctor({super.key});

  @override
  State<HomePageExperiencedDoctor> createState() => _HomePageExperiencedDoctorState();
}

class _HomePageExperiencedDoctorState extends State<HomePageExperiencedDoctor> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  late Timer timer;

  // Fungsi untuk mengambil data semua dokter 
  @override
  void initState() {
    h.getDataDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dokter Berpengalaman").p16b().black(),
              GestureDetector(
                  onTap: () {
                    Get.to(const ExperiencedDoctorListPage());
                  },
                  child: const Text("Lihat Semua!").p12m().primary()),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => (h.loadingDoctorData.value)
              ? (h.listDoctors.length < 6)
                  ? (h.listDoctors.length == 4)
                      ? Container(
                          height: 270,
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[0], false)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[1], false)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[2], false)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[3], false)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(flex: 2, child: Container())
                                ],
                              ),
                            ],
                          ))
                      : (h.listDoctors.length == 5)
                          ? Container(
                              height: 270,
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(flex: 1, child: ItemDoctor(h.listDoctors[0], false)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(flex: 1, child: ItemDoctor(h.listDoctors[1], false)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(flex: 1, child: ItemDoctor(h.listDoctors[2], false)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(flex: 1, child: ItemDoctor(h.listDoctors[3], false)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(flex: 1, child: ItemDoctor(h.listDoctors[4], false)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(flex: 1, child: Container())
                                    ],
                                  ),
                                ],
                              ))
                          : Container(
                              height: 135,
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[1], false)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[0], false)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(flex: 1, child: ItemDoctor(h.listDoctors[1], true)),
                                ],
                              ),
                            )
                  : Container(
                      height: 270,
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(flex: 1, child: ItemDoctor(h.listDoctors[0], false)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(flex: 1, child: ItemDoctor(h.listDoctors[1], false)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(flex: 1, child: ItemDoctor(h.listDoctors[2], false)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(flex: 1, child: ItemDoctor(h.listDoctors[3], false)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(flex: 1, child: ItemDoctor(h.listDoctors[4], false)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(flex: 1, child: ItemDoctor(h.listDoctors[5], false)),
                            ],
                          ),
                        ],
                      ))
              : SizedBox(width: 50, height: 50, child: Container()),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget ItemDoctor(Doctor doctor, bool isDoc) {
    return GestureDetector(
      onTap: () {
        if (isDoc) {
          Get.to(const ExperiencedDoctorListPage());
        } else {
          Get.to(ScheduleDetailPage(
            doctor: doctor,
          ));
        }
        // (isDoc)
        //     ? Get.to(const ExperiencedDoctorListPage())
        //     : Get.to(ScheduleDetailPage(
        //         doctor: doctor,
        //       ));
      },
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 0.1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: SizedBox(
                  width: Get.width,
                  height: 70,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: FadeInImage(
                      image: NetworkImage(doctor.picture),
                      placeholder: const AssetImage("assets/images/img_avatar.png"),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/default_profile.png',
                        );
                      },
                      // fit: BoxFit.fitWidth,
                    ),
                    // Image.asset(image),
                  ),
                ),
              ),
            ),
            if (!isDoc) ...[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: AutoSizeText(
                      doctor.namadokter,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: OPrimaryColor),
                      maxLines: 1,
                    ),
                  ),
                  Center(
                      child: Text(
                    doctor.poli,
                    textAlign: TextAlign.center,
                  ).p10r().primary()),
                ],
              )
            ] else ...[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: AutoSizeText(
                        "Semua Dokter",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: OPrimaryColor),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
