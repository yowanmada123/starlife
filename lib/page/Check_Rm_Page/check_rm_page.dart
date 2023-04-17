import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_topbar.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_kid_growth.dart';
import 'package:starlife/controllers/check_rm_controller.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_pin_page.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_immunitation_history.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

// Halaman CheckRM 
class CheckRmPage extends StatefulWidget {
  const CheckRmPage({super.key});

  @override
  State<CheckRmPage> createState() => _CheckRmPageState();
}

class _CheckRmPageState extends State<CheckRmPage> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  // final dC = Get.put(DioController());
  final loading = true.obs;
  String? token;

  // Fungsi yang berguna untuk mengambil data pasien dan data personal.
  @override
  void initState() {
    super.initState();
    // print(p.person.rm);
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      token = await c.getToken();
      p.getPatients();
      p.getDataPersonal();
      // print("======================");
      // print(h.listPatientQueue[0].doctorId);
      // print("======================");
    });
  }

  @override
  Widget build(BuildContext context) {
    return (token == null)
        ? Scaffold(
            body: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.white,
                ),
                const TopBar(),
                RoundedInside(
                  height: 97,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Obx(
                        () => (p.loadingPatientsData.value && p.loadingPersonal.value)
                            ? SizedBox(
                                // padding: EdgeInsets.only(top:    124),
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
                                                const SizedBox(
                                                  height: 220,
                                                ),
                                              ],
                                            )
                                          : ItemList(patient: p.patients[index], rm: p.person!.rm);
                                    }),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                ],
                              ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          )
        : Container();
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.patient,
    required this.rm,
  });

  final Patient patient;
  final String rm;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GlobalController());
    final cr = Get.put(CheckRmController());
    return GestureDetector(
      onTap: () {
        cr.patientRm.value = patient.rm;
        // print(cr.patientRm.value);
        Get.to(PinPage(
          patient: patient,
        ));
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 125,
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
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage(
                          image: NetworkImage(patient.picture),
                          placeholder: const AssetImage("assets/images/img_avatar.png"),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/default_profile.png',
                            );
                          },
                          // fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //     child: Image.asset(
                    //       "assets/images/img_avatar_2.png",
                    //       height: 100,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    const SizedBox(
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
                              patient.fname,
                              maxLines: 1,
                            ).p16m().primary(),
                            const SizedBox(
                              height: 3,
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
                                Text(patient.rm).p9b().black(),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (patient.statusPasien == 'Suami' || patient.statusPasien == 'Istri' || patient.statusPasien == 'Ayah' || patient.statusPasien == 'Ibu' || patient.statusPasien == 'Bunda' || patient.statusPasien == 'Mami' || patient.statusPasien == 'Papi' || patient.statusPasien == 'Papa' || patient.statusPasien == 'Abi' || patient.statusPasien == 'Umi' || patient.rm == rm) ...[
                                    Container(
                                        decoration: BoxDecoration(
                                          // if(role == 'Anda')...[]else()...[]
                                          color: (patient.rm == rm)
                                              ? const Color(0xffEBD0FF)
                                              : (patient.statusPasien == 'Suami' || patient.statusPasien == 'Istri' || patient.statusPasien == 'Ayah' || patient.statusPasien == 'Ibu' || patient.statusPasien == 'Bunda' || patient.statusPasien == 'Mami' || patient.statusPasien == 'Papi' || patient.statusPasien == 'Papa' || patient.statusPasien == 'Abi' || patient.statusPasien == 'Umi')
                                                  ? const Color(0xffFFD0A1)
                                                  : const Color(0xffC3FFEC),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            child: (patient.rm == rm)
                                                ? const Text(
                                                    "Anda",
                                                    style: TextStyle(color: Color(0xff9B26F0)),
                                                  ).p10r()
                                                : (patient.statusPasien == 'Suami' || patient.statusPasien == 'Istri' || patient.statusPasien == 'Ayah' || patient.statusPasien == 'Ibu' || patient.statusPasien == 'Bunda' || patient.statusPasien == 'Mami' || patient.statusPasien == 'Papi' || patient.statusPasien == 'Papa' || patient.statusPasien == 'Abi' || patient.statusPasien == 'Umi')
                                                    ? Text(
                                                        patient.statusPasien,
                                                        style: const TextStyle(color: Color(0xff8C4701)),
                                                      ).p10r()
                                                    : Text(
                                                        patient.statusPasien,
                                                        style: const TextStyle(color: Color(0xff21C994)),
                                                      ).p10r())),
                                  ] else ...[
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                  // if(role == 'Anda')...[]else()...[]
                                                  color: (patient.rm == rm)
                                                      ? const Color(0xffEBD0FF)
                                                      : (patient.statusPasien == 'Suami' || patient.statusPasien == 'Istri' || patient.statusPasien == 'Ayah' || patient.statusPasien == 'Ibu' || patient.statusPasien == 'Bunda' || patient.statusPasien == 'Mami' || patient.statusPasien == 'Papi' || patient.statusPasien == 'Papa' || patient.statusPasien == 'Abi' || patient.statusPasien == 'Umi')
                                                          ? const Color(0xffFFD0A1)
                                                          : const Color(0xffC3FFEC),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                    child: (patient.rm == rm)
                                                        ? Text(
                                                            patient.statusPasien,
                                                            style: const TextStyle(color: Color(0xff9B26F0)),
                                                          ).p10r()
                                                        : (patient.statusPasien == 'Suami' || patient.statusPasien == 'Istri' || patient.statusPasien == 'Ayah' || patient.statusPasien == 'Ibu' || patient.statusPasien == 'Bunda' || patient.statusPasien == 'Mami' || patient.statusPasien == 'Papi' || patient.statusPasien == 'Papa' || patient.statusPasien == 'Abi' || patient.statusPasien == 'Umi')
                                                            ? Text(
                                                                patient.statusPasien,
                                                                style: const TextStyle(color: Color(0xff8C4701)),
                                                              ).p10r()
                                                            : Text(
                                                                patient.statusPasien,
                                                                style: const TextStyle(color: Color(0xff21C994)),
                                                              ).p10r())),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: BaseButton(
                                                ontap: () {
                                                  Get.to(CekPermkembanganPage(
                                                    name: patient.fname,
                                                  ));
                                                },
                                                text: "Cek Perkembangan",
                                                textColor: Colors.white,
                                                outlineRadius: 20,
                                                // width: 98,
                                                height: 20,
                                                textSize: 8,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: BaseButton(
                                                ontap: () {
                                                  Get.to(const CheckRmImmunizationHistoryPage());
                                                },
                                                text: "Riwayat Imunisasi",
                                                textColor: Colors.white,
                                                outlineRadius: 20,
                                                height: 20,
                                                textSize: 8,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 9,
          )
        ],
      ),
    );
  }
}
