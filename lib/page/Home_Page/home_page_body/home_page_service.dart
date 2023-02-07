import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/page/Home_Page/service_page/all_service_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class HomePageService extends StatelessWidget {
  HomePageService({super.key});
  final c = Get.put(GlobalController());
  List<String> categoryImage = [
    'assets/icon/ic_igd.png',
    'assets/icon/ic_gigi.png',
    'assets/icon/ic_spesialis.png',
    'assets/icon/ic_farmasi.png',
    'assets/icon/ic_gizi.png',
    'assets/icon/ic_imunisasi.png',
  ];
  List<String> category = [
    'IGD',
    'Dokter Gigi',
    'Spesialis',
    'Instalasi Farmasi',
    'Pelayanan Gizi',
    'Imunisasi',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pelayanan!").p16b().black(),
              GestureDetector(
                  onTap: () {
                    Get.to(AllServicePage());
                  },
                  child: Text("Lihat Semua!").p12m().primary()),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: c.sw * 16.0),
          child: SizedBox(
              height: c.sh * 130,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int itemIndex) => GestureDetector(
                    onTap: () {
                      Get.to(ExperiencedDoctorListPage(
                        title: category[itemIndex],
                      ));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: c.sw * 2,
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
                          height: c.sh * 100,
                          width: c.sw * 81,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(height: c.sh * 50, child: Center(child: Image.asset(categoryImage[itemIndex]))),
                              SizedBox(
                                height: c.sh * 5,
                              ),
                              Center(
                                  child: Text(
                                category[itemIndex],
                                textAlign: TextAlign.center,
                                style: const TextStyle(height: 1),
                              ).p12m().black()),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: c.sw * 11,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
