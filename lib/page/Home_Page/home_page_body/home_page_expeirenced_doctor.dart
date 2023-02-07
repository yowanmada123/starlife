import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/schedule_detail_page/schedule_detail_page.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/page/Home_Page/service_page/all_service_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class HomePageExperiencedDoctor extends StatefulWidget {
  const HomePageExperiencedDoctor({super.key});

  @override
  State<HomePageExperiencedDoctor> createState() => _HomePageExperiencedDoctorState();
}

class _HomePageExperiencedDoctorState extends State<HomePageExperiencedDoctor> {
  List<String> doctorsName = [
    'dr. Ana Sulastri',
    'dr. Sugiarto S.',
    'dr. Hendry Sul.',
    'dr. Ana Sulastri',
    'dr. Sugiarto S.',
    'dr. Hendry Sul.',
  ];
  List<String> doctorsImage = [
    'assets/images/img_doctor.png',
    'assets/images/img_doctor1.png',
    'assets/images/img_doctor2.png',
    'assets/images/img_doctor3.png',
    'assets/images/img_doctor1.png',
    'assets/images/img_doctor2.png',
  ];
  final c = Get.put(GlobalController());

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
                    Get.to(ExperiencedDoctorListPage());
                  },
                  child: const Text("Lihat Semua!").p12m().primary()),
            ],
          ),
        ),
        SizedBox(
          height: c.sh * 16,
        ),
        Container(
          height: 285,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: c.sw*16),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            childAspectRatio: 3/3.9,
            children: List.generate(doctorsImage.length, (index) {
              return GestureDetector(
                onTap: (){
                  Get.to(const DetailJadwal());
                },
                child: Container(
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
                            height: c.sh * 90,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(doctorsImage[index]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      AutoSizeText(
                        doctorsName[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: OPrimaryColor),
                        maxLines: 1,
                      ),
                      Center(
                          child: const Text(
                        "Dokter Anak",
                        textAlign: TextAlign.center,
                      ).p10r().primary()),
                    ],
                  ),
                ),
              );
            }),
          )
        ),
        // Expanded(
        //   flex: 1,
        //   child: GridView.count(
        //       physics: NeverScrollableScrollPhysics(),
        //       padding: EdgeInsets.zero,
        //       crossAxisCount: 3,
        //       childAspectRatio: 
        //       (itemWidth / itemHeight),
        //       crossAxisSpacing: c.sh * 10,
        //       mainAxisSpacing: c.sw * 10,
        //       // controller: ScrollController(keepScrollOffset: false),
        //       shrinkWrap: true,
        //       children: List.generate(
        //           doctorsName.length,
        //           (index) => 
        //           GestureDetector(
        //                 onTap: () {
        //                   Get.to(const DetailJadwal());
        //                 },
        //                 child: Container(
        //                   // height: c.sh * 50,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(20),
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: Colors.grey.withOpacity(0.9),
        //                         spreadRadius: 0.1,
        //                         blurRadius: 1,
        //                       ),
        //                     ],
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(11),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: const BorderRadius.all(Radius.circular(10)),
        //                           child: Expanded(
        //                             flex: 1,
        //                             child: SizedBox(
        //                               width: Get.width,
        //                               height: c.sh * 80,
        //                               child: FittedBox(
        //                                 fit: BoxFit.cover,
        //                                 child: Image.asset(doctorsImage[index]),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                         const SizedBox(
        //                           height: 5,
        //                         ),
        //                         AutoSizeText(
        //                           doctorsName[index],
        //                           textAlign: TextAlign.center,
        //                           style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: OPrimaryColor),
        //                           maxLines: 1,
        //                         ),
        //                         Center(
        //                             child: const Text(
        //                           "Dokter Anak",
        //                           textAlign: TextAlign.center,
        //                         ).p10r().primary()),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               )
        //               )
        //               ),
        // ),
        SizedBox(
          height: c.sh * 20,
        ),
      ],
    );
  }
}
