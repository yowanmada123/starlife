import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class Pelayanan extends StatelessWidget {
  Pelayanan({super.key});
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
                      Text("Lihat Semua!").p10m().primary(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                      height: 130,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int itemIndex) => 
                          Row(
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
                                    Container(height: 50, child: Center(child: Image.asset(categoryImage[itemIndex]))),
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
                      )),
                ),
      ],
    );
  }
}