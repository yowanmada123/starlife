import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/detailjadwal/detail_jadwal.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class DokterPengalaman extends StatefulWidget {
  const DokterPengalaman({super.key});

  @override
  State<DokterPengalaman> createState() => _DokterPengalamanState();
}

class _DokterPengalamanState extends State<DokterPengalaman> {
  List<String> widgetList = [
    'dr. Ana Sulastri',
    'dr. Sugiarto S.',
    'dr. Hendry Sul.',
    'dr. Ana Sulastri',
    'dr. Sugiarto S.',
    'dr. Hendry Sul.',
  ];
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    // const DokterPengalaman({super.key});
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dokter Pengalaman").p16b().black(),
              const Text("Lihat Semua!").p10m().primary(),
            ],
          ),
        ),
        SizedBox(
          height: c.sh * 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(
                  widgetList.length,
                  (index) => GestureDetector(
                        onTap: () {
                          Get.to(const DetailJadwal());
                        },
                        child: Container(
                          height: c.sh * 147,
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
                          child: Padding(
                            padding: const EdgeInsets.all(11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset("assets/icon/ic_doctor.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: AutoSizeText(
                                    widgetList[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: OPrimaryColor),
                                    maxLines: 1,
                                  ),
                                ),
                                Center(
                                    child: const Text(
                                  "Dokter Anak",
                                  textAlign: TextAlign.center,
                                ).p10r().primary()),
                              ],
                            ),
                          ),
                        ),
                      ))),
        ),
        SizedBox(
          height: c.sh * 20,
        ),
      ],
    );
  }
}
