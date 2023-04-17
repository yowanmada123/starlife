import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilan List Pasien atau bagian dari halaman patient list main page

class PatientList extends StatefulWidget {
  final bool? passwordMode;

  const PatientList({super.key, this.passwordMode});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  // var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());
  final pr = Get.put(ProfileController());
  int selectedPatientIndex = -1;

  // Fungsi yang berguna untuk mengambil data personal dan data pasien
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      pr.loadingPatientsData.value = false;
      pr.loadingPersonal.value = false;
      pr.getPatients();
      pr.getDataPersonal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          // Obx(() => (p.loadingAddNewPersonal.value || pr.loadingPatientsData.value)
          Obx(() => (p.loadingAddNewPersonal.value)
              ? SizedBox(
                  width: Get.width,
                  height: (pr.patients.length == 1)
                      ? 120
                      : (pr.patients.length == 2)
                          ? 250
                          : 370,
                  child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pr.patients.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) => (index + 1 == pr.patients.length)
                          ? Column(
                              children: [
                                ItemList(index),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          : ItemList(index)),
                )
              : const CircularProgressIndicator())
        ],
      ),
    );
  }

  // Widget yang menampilkan item pasien
  Widget ItemList(int index) {
    return GestureDetector(
      onTap: () {
        // Berfungsi untuk memilih pasien yang bertujuan untuk menyimpan nomer rm dan mengubah index yang dipilih.
        setState(() {
          selectedPatientIndex = index;
          p.selectedPatient.value = true;
          p.selectedPatientRm.value = pr.patients[index].rm;
          // print(p.selectedPatient.value);
          print(p.selectedPatientRm.value);
        });
      },
      child: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          Container(
              height: 107,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color.fromRGBO(225, 225, 225, 1)),
                boxShadow: const [
                  BoxShadow(color: Color(0x54000000), spreadRadius: 0.1, blurRadius: 0.5, offset: Offset(0.0, 0.1)),
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
                          image: NetworkImage(pr.patients[index].picture),
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
                            AutoSizeText(pr.patients[index].fname, maxLines: 1, style: GoogleFonts.poppins(fontSize: 14, color: OPrimaryColor, fontWeight: FontWeight.w700), minFontSize: 5),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Color.fromARGB(255, 234, 234, 234),
                              ))),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'No. Rekam Medis',
                                  style: GoogleFonts.poppins(),
                                  minFontSize: 2,
                                  maxFontSize: 7,
                                  maxLines: 1,
                                ),
                                AutoSizeText(pr.patients[index].rm, style: GoogleFonts.poppins(fontWeight: FontWeight.w700), minFontSize: 2, maxFontSize: 8, maxLines: 1)
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                // if(role == 'Anda')...[]else()...[]
                                color: (pr.patients[index].rm == pr.person!.rm)
                                    ? const Color(0xffEBD0FF)
                                    : (pr.patients[index].statusPasien == 'Suami' || pr.patients[index].statusPasien == 'Istri')
                                        ? const Color(0xffFFD0A1)
                                        : const Color(0xffC3FFEC),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                                  child: (pr.patients[index].rm == pr.person!.rm)
                                      ? const Text(
                                          "Anda",
                                          style: TextStyle(color: Color(0xff9B26F0)),
                                        ).p10r()
                                      : (pr.patients[index].statusPasien == 'Suami' || pr.patients[index].statusPasien == 'Istri')
                                          ? Text(
                                              pr.patients[index].statusPasien,
                                              style: const TextStyle(color: Color(0xff8C4701)),
                                            ).p10r()
                                          : Text(
                                              pr.patients[index].statusPasien,
                                              style: const TextStyle(color: Color(0xff21C994)),
                                            ).p10r())),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: selectedPatientIndex == index ? OPrimaryColor : Colors.grey), color: selectedPatientIndex == index ? OPrimaryColor : Colors.white),
                        child: selectedPatientIndex == index
                            ? const Center(
                                child: Icon(
                                Icons.done_outlined,
                                color: Colors.white,
                                size: 15,
                              ))
                            : Container())
                  ],
                ),
              )),
          // SizedBox(
          //   height: 4,
          // )
        ],
      ),
    );
  }
}
