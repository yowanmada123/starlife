import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_page.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/page/Home_Page/home_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class HomePageExperiencedDoctor extends StatefulWidget {
  const HomePageExperiencedDoctor({super.key});

  @override
  State<HomePageExperiencedDoctor> createState() => _HomePageExperiencedDoctorState();
}

class _HomePageExperiencedDoctorState extends State<HomePageExperiencedDoctor> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    h.getDataDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
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
        SizedBox(
          height: c.sh * 16,
        ),
        Container(
          height: 270,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: c.sw*16),
          child: Obx(() => 
          (h.loadingDoctorData.value) ?
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ItemDoctor(h.listDoctors[0])),
                  SizedBox(
                    width: c.sw*10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ItemDoctor(h.listDoctors[1])),
                  SizedBox(
                    width: c.sw *10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ItemDoctor(h.listDoctors[0])),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ItemDoctor(h.listDoctors[1])),
                  SizedBox(
                    width: c.sw*10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ItemDoctor(h.listDoctors[0])),
                  SizedBox(
                    width: c.sw *10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ItemDoctor(h.listDoctors[1])),
                ],
              ),
            ],
          ) : const SizedBox(
              width: 50,
              height: 50,
            child: CircularProgressIndicator())
          ) 
        ),
        SizedBox(
          height: c.sh * 20,
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget ItemDoctor(Doctor doctor) {
    return GestureDetector(
              onTap: (){
                Get.to(ScheduleDetailPage(doctor: doctor,));
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
                          height: c.sh * 80,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(doctor.picture)
                            // Image.asset(image),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:2.0),
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
                ),
              ),
            );
  }
}
