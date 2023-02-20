import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/Profile_Page/profile_controller/profile_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_data/profile_patient_data_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileOtherPatient extends StatefulWidget {
  const ProfileOtherPatient({super.key});

  @override
  State<ProfileOtherPatient> createState() => _ProfileOtherPatientState();
}

class _ProfileOtherPatientState extends State<ProfileOtherPatient> {
  final List<String> entrie = <String>['Sarah Celestia Bella', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa'];
  final List<String> role = <String>['Anda', 'Suami', 'Anak ke-1', 'Anak ke-2', 'Anak ke-3', 'Anak ke-4', 'Anak ke-5'];
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    p.getPatients();
    // print(p.patients.);
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
          const CustomTopBar(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: c.sh * 110),
                  width: Get.width,
                  height: Get.height,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: p.patients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return (index + 1 == p.patients.length)
                            ? Column(
                                children: [
                                  ItemList(
                                    patient: p.patients[index],
                                  ),
                                  SizedBox(
                                    height: c.sh * 100,
                                  ),
                                ],
                              )
                            : ItemList(
                                patient: p.patients[index]
                              );
                      }),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: c.sh * 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: c.sh * 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
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

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.patient, });
  final Patient patient;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(GlobalController());
    return GestureDetector(
      onTap: () {
        Get.to(ProfilePatientDataPage( patient: patient,));
      },
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 10,
          ),
          Container(
              height: c.sh * 109.67,
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
                        "assets/images/img_avatar_2.png",
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patient.fname,
                              maxLines: 1,
                            ).p16m().primary(),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('No. Rekam Medis').p10r().black(),
                                Text(patient.rm).p10b().black(),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                // if(role == 'Anda')...[]else()...[]
                                color: (patient.status == '1')
                                    ? Color(0xffEBD0FF)
                                    : (patient.status == '2' || patient.status == '3')
                                        ? Color(0xffFFD0A1)
                                        : Color(0xffC3FFEC),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                                  child: (patient.status == '1')
                                      ? const Text(
                                          "Anda",
                                          style: TextStyle(color: Color(0xff9B26F0)),
                                        ).p10r()
                                      : (patient.status == '2')
                                          ? const Text(
                                              "Suami",
                                              style: TextStyle(color: Color(0xff8C4701)),
                                            ).p10r()
                                          : (patient.status == '3') ? 
                                            const Text(
                                              "Istri",
                                              style: TextStyle(color: Color(0xff8C4701)),
                                            ).p10r() : 
                                            const Text(
                                              "Anak ke-2",
                                              style: TextStyle(color: Color(0xff21C994)),
                                            ).p10r())),
                        )
                      ]),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: c.sh * 10,
          )
        ],
      ),
    );
  }
}
