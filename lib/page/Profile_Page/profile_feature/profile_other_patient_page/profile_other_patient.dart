import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_edit/profile_patient_edit_data_page.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

import 'profile_data/profile_patient.dart';

class ProfileOtherPatient extends StatefulWidget {
  const ProfileOtherPatient({super.key});

  @override
  State<ProfileOtherPatient> createState() => _ProfileOtherPatientState();
}

class _ProfileOtherPatientState extends State<ProfileOtherPatient> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      p.getPatients();
      p.getDataPersonal();
    });
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
          SingleChildScrollView(
            child: Column(
              children: [
                Obx(() => (p.loadingPatientsData.value && p.loadingPersonal.value)
                    ? Container(
                        padding: EdgeInsets.only(top: 97),
                        width: Get.width,
                        height: Get.height,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: p.patients.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (index + 1 == p.patients.length)
                                  ? Column(
                                      children: [
                                        ItemList(patient: p.patients[index], rm: p.person!.rm),
                                        SizedBox(
                                          height: 100,
                                        ),
                                      ],
                                    )
                                  : ItemList(patient: p.patients[index], rm: p.person!.rm);
                            }),
                      )
                    : const CircularProgressIndicator())
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
                    SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: 16,
                        ),
                        const Text("Pasien Lain").p16b().white(),
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

class ItemList extends StatefulWidget {
  const ItemList({
    super.key,
    required this.patient,
    required this.rm,
  });

  final Patient patient;
  final String rm;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfilePatientDataPage(
          patient: widget.patient,
        ));
        // print(rm);
        // print(patient.rm);
        // print(patient.picture);
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 109.67,
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
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage(
                          image: NetworkImage(widget.patient.picture),
                          placeholder: const AssetImage("assets/images/img_avatar.png"),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/img_avatar.png',
                            );
                          },
                          // fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    // ClipRRect(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     child: Image.network(widget.patient.picture, errorBuilder: (context, error, stackTrace) {
                    //       return Image.asset("assets/images/img_avatar.png");
                    //     })),
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.patient.fname,
                              maxLines: 1,
                            ).p16m().primary(),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: const Color.fromARGB(255, 216, 216, 216),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('No. Rekam Medis').p8r().black(),
                                Text(widget.patient.rm).p9b().black(),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                // if(role == 'Anda')...[]else()...[]
                                color: (widget.patient.rm == widget.rm)
                                    ? Color(0xffEBD0FF)
                                    : (widget.patient.statusPasien == 'Suami' || widget.patient.statusPasien == 'Istri')
                                        ? Color(0xffFFD0A1)
                                        : Color(0xffC3FFEC),
                                // (patient.status == 'Suami' || patient.status == 'Istri')
                                //     ? const Color(0xffFFD0A1)
                                //     : (patient.status != 'Anda')
                                //         ? const Color(0xffC3FFEC)
                                //         : const Color(0xffEBD0FF),
                                // color: (patient.status == '1')
                                //     ? Color(0xffEBD0FF)
                                //     : (patient.status == 'Suami' || patient.status == 'Istri')
                                //         ? Color(0xffFFD0A1)
                                //         : Color(0xffC3FFEC),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                                  child: (widget.patient.rm == widget.rm)
                                      ? const Text(
                                          "Anda",
                                          style: TextStyle(color: Color(0xff9B26F0)),
                                        ).p10r()
                                      : (widget.patient.statusPasien == 'Suami' || widget.patient.statusPasien == 'Istri')
                                          ? Text(
                                              widget.patient.statusPasien,
                                              style: const TextStyle(color: Color(0xff8C4701)),
                                            ).p10r()
                                          : Text(
                                              widget.patient.statusPasien,
                                              style: const TextStyle(color: Color(0xff21C994)),
                                            ).p10r())),
                          // (patient.status == '1')
                          //     ? const Text(
                          //         "Anda",
                          //         style: TextStyle(color: Color(0xff9B26F0)),
                          //       ).p10r()
                          //     : (patient.status == '2')
                          //         ? const Text(
                          //             "Suami",
                          //             style: TextStyle(color: Color(0xff8C4701)),
                          //           ).p10r()
                          //         : (patient.status == '3') ?
                          //           const Text(
                          //             "Istri",
                          //             style: TextStyle(color: Color(0xff8C4701)),
                          //           ).p10r() :
                          //           const Text(
                          //             "Anak ke-2",
                          //             style: TextStyle(color: Color(0xff21C994)),
                          //           ).p10r())),
                        )
                      ]),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
