import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list_page.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/ext_text.dart';

class AllServicePage extends StatefulWidget {
  const AllServicePage({super.key});

  @override
  State<AllServicePage> createState() => _AllServicePageState();
}

class _AllServicePageState extends State<AllServicePage> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await h.getPoli();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 300) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          const CustomTopBar(height: 115),
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                // Pelayanan(),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Obx(() => (h.loadingPoliData.value)
                            ? GridView.count(
                                padding: EdgeInsets.zero,
                                crossAxisCount: 4,
                                childAspectRatio: (itemWidth / itemHeight),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                controller: ScrollController(keepScrollOffset: false),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: List.generate(
                                  h.listPoli.length,
                                  (index) => GestureDetector(
                                    onTap: () async {
                                      h.selectedPoli.value = await h.listPoli[index].dprtId;
                                      Get.to(ExperiencedDoctorListPage(
                                        poli: h.listPoli[index],
                                      ));
                                    },
                                    child: Container(
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
                                      // height:    100,
                                      width: 74,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 50,
                                              child: Center(
                                                  child: Center(
                                                      child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Image.network(h.listPoli[index].image, errorBuilder: (context, error, stackTrace) {
                                                  return Image.asset("assets/icon/ic_gigi.png");
                                                }),
                                              )))),
                                          // SizedBox(
                                          //   height:    ,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                            child: Center(
                                              child: AutoSizeText(
                                                h.listPoli[index].name,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black, height: 1.3),
                                                maxLines: 2,
                                                minFontSize: 9,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            : CircularProgressIndicator())),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: 16,
                        ),
                        const Text("Semua Pelayanan").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
