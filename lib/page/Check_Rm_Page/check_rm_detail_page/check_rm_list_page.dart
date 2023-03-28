import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_medical_record.dart';
import 'package:starlife/controllers/check_rm_controller.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_detail_page.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_detail_topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

class CheckRmListPage extends StatefulWidget {
  const CheckRmListPage({super.key, required this.name});
  final String name;
  @override
  State<CheckRmListPage> createState() => _CheckRmListPageState();
}

class _CheckRmListPageState extends State<CheckRmListPage> {
  final List<String> entrie = <String>['Santo', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa'];
  List<String> doctorsImage = [
    'assets/images/img_doctor.png',
    'assets/images/img_doctor1.png',
    'assets/images/img_doctor2.png',
    'assets/images/img_doctor3.png',
    'assets/images/img_doctor1.png',
    'assets/images/img_doctor2.png',
    'assets/images/img_doctor2.png',
  ];
  final c = Get.put(GlobalController());
  final cr = Get.put(CheckRmController());
  @override
  void initState() {
    super.initState();
    // print("AAAAAAAAAAAAAAAAAAa");
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await cr.getDataMedicalRecords(context);
    });
    // SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
    //   await cr.getDataMedicalRecords;
    // });
    // print("BBBBBBBBBBBBBBBBBBBB");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          const CustomTopBar(height: 115),
          RoundedInside(
            height: 98,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => (cr.loadingDataMedicalRecord.value)
                    ? SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: cr.medicalRecords.length,
                            // entrie.length,
                            itemBuilder: (BuildContext context, int index) {
                              return index == cr.medicalRecords.length - 1
                                  ? Column(
                                      children: [
                                        ItemList(
                                          medicalRecord: cr.medicalRecords[index],
                                        ),
                                        const SizedBox(
                                          height: 120,
                                        )
                                      ],
                                    )
                                  : ItemList(
                                      medicalRecord: cr.medicalRecords[index],
                                    );
                            }),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Belum Ada Rekam Medis",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      )),
                const SizedBox(
                  height: 500,
                )
              ],
            )),
          ),
          Container(
            color: Colors.transparent,
            height: 110,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        const ButtonBack(times: 2),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Rekam Medis").p12b().white(),
                            Text(widget.name).p16b().white(),
                          ],
                        ),
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

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.medicalRecord});
  // final MedicalRecord medicalRecord;
  final MedicalRecord medicalRecord;
  // final String name;
  // final String image;
  @override
  Widget build(BuildContext context) {
    final cr = Get.put(CheckRmController());
    final c = Get.put(GlobalController());
    return GestureDetector(
      onTap: () {
        cr.idMedicalRecord.value = medicalRecord.id;
        Get.to(CheckRmDetailPage(medicalRecord: medicalRecord));
      },
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
              height: 105,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Color(0x54000000), spreadRadius: 0.1, blurRadius: 2, offset: Offset(0.0, 0.1)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "assets/images/img_doctor.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: c.sw * 13,
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(children: [
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  medicalRecord.dokter,
                                  maxLines: 1,
                                ).p16m().primary(),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey[200],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(medicalRecord.poli).p10r().black(),
                              ],
                            ),
                          ],
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icon/ic_date.svg"),
                                  SizedBox(
                                    width: c.sw * 4,
                                  ),
                                  Text(DateTime.parse(medicalRecord.tanggalTime).toDateHuman()).p10m().primary(),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled_rounded,
                                    size: 12,
                                    color: OPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: c.sw * 4,
                                  ),
                                  Text(DateTime.parse(medicalRecord.tanggalTime).toTimeDate()).p10m().primary(),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ]),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
