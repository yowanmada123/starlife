import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/page/Home_Page/service_page/all_service_page.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilan service dokter atau bagian pada halaman HomePage

class HomePageService extends StatefulWidget {
  const HomePageService({super.key});

  @override
  State<HomePageService> createState() => _HomePageServiceState();
}

class _HomePageServiceState extends State<HomePageService> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  
  // Fungsi untuk mengambil daftar atau list poli.
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await h.getPoli();
    });
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
              const Text("Pelayanan!").p16b().black(),
              GestureDetector(
                  onTap: () {
                    Get.to(const AllServicePage());
                  },
                  child: const Text("Lihat Semua!").p12m().primary()),
            ],
          ),
        ),
        Obx(() => (h.loadingPoliData.value)
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                    height: 130,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: h.listPoli.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int itemIndex) => GestureDetector(
                          onTap: () async {
                            h.selectedPoli.value = await h.listPoli[itemIndex].dprtId;
                            Get.to(ExperiencedDoctorListPage(
                              poli: h.listPoli[itemIndex],
                            ));
                          },
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
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
                                height: 100,
                                width: 81,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // SizedBox(
                                    //   width: 50,
                                    //   height: Get.width,
                                    //   child: ClipRRect(
                                    //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    //     child: FadeInImage(
                                    //       image: NetworkImage(h.listPoli[itemIndex].image),
                                    //       placeholder: const AssetImage("assets/images/img_avatar.png"),
                                    //       fit: BoxFit.cover,
                                    //       imageErrorBuilder: (context, error, stackTrace) {
                                    //         return Image.asset(
                                    //           'assets/images/default_profile.png',
                                    //         );
                                    //       },
                                    //       // fit: BoxFit.fitWidth,
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                        height: 50,
                                        width: Get.width,
                                        child: Center(
                                            child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: FadeInImage(
                                            image: NetworkImage(h.listPoli[itemIndex].image),
                                            placeholder: const AssetImage("assets/images/img_avatar.png"),
                                            fit: BoxFit.cover,
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/default_profile.png',
                                              );
                                            },
                                            // fit: BoxFit.fitWidth,
                                          ),
                                          // Image.network(h.listPoli[itemIndex].image, errorBuilder: (context, error, stackTrace) {
                                          //   return Image.asset("assets/icon/ic_gigi.png");
                                          // }),
                                        ))),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                        child: Text(
                                      h.listPoli[itemIndex].name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(height: 1),
                                    ).p12m().black()),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 11,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              )
            : const CircularProgressIndicator())
      ],
    );
  }
}
// class HomePageService extends StatelessWidget {
//   HomePageService({super.key});
//   final c = Get.put(GlobalController());
//   List<String> categoryImage = [
//     'assets/icon/ic_igd.png',
//     'assets/icon/ic_gigi.png',
//     'assets/icon/ic_spesialis.png',
//     'assets/icon/ic_farmasi.png',
//     'assets/icon/ic_gizi.png',
//     'assets/icon/ic_imunisasi.png',
//   ];
//   List<String> category = [
//     'IGD',
//     'Dokter Gigi',
//     'Spesialis',
//     'Instalasi Farmasi',
//     'Pelayanan Gizi',
//     'Imunisasi',
//   ];
  
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text("Pelayanan!").p16b().black(),
//               GestureDetector(
//                   onTap: () {
//                     Get.to(const AllServicePage());
//                   },
//                   child: const Text("Lihat Semua!").p12m().primary()),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 16.0),
//           child: SizedBox(
//               height: 130,
//               child: MediaQuery.removePadding(
//                 context: context,
//                 removeTop: true,
//                 removeBottom: true,
//                 child: ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: category.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int itemIndex) => GestureDetector(
//                     onTap: () {
//                       Get.to(ExperiencedDoctorListPage(
//                         title: category[itemIndex],
//                       ));
//                     },
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 2,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.9),
//                                 spreadRadius: 0.1,
//                                 blurRadius: 1,
//                                 offset: const Offset(0, 0.1), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           height: 100,
//                           width: 81,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(height: 50, child: Center(child: Image.asset(categoryImage[itemIndex]))),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Center(
//                                   child: Text(
//                                 category[itemIndex],
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(height: 1),
//                               ).p12m().black()),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 11,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )),
//         ),
//       ],
//     );
//   }
// }
