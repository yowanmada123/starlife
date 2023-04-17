import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

// Tampilan List Schedule Dokter atau bagian dari halaman patient list main page
class PatientDoctorSchedule extends StatefulWidget {
  const PatientDoctorSchedule({super.key});

  @override
  State<PatientDoctorSchedule> createState() => _PatientDoctorScheduleState();
}

class _PatientDoctorScheduleState extends State<PatientDoctorSchedule> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
  final p = Get.put(PatientPageController());
  DateTime today = DateTime.now();
  List<DateTime> days = [];
  var screenHeight = Get.height / 763;
  int selectedIndex = 0;
  int selectedCategory = 0;
  int selectedDoctorIndex = -1;
  var category = [
    'IGD',
    'Dokter Mata',
    'Dokter Anak',
    'Dokter Gigi',
    'Dokter Kandungan',
    'Dokter Bedah',
  ];

  // Fungsi untuk menambahkan dan menampilkan 7 hari kedepan mulai dari sekarang
  init() {
    for (var i = 0; i < 7; i++) {
      if (i == 0) {
        days.add(today);
      } else {
        days.add(DateTime(today.year, today.month, today.day + i));
      }
    }
  }

  // Fungsi untuk mengambil data semua dokter untuk diawal
  @override
  void initState() {
    super.initState();
    init();
    h.selectedDate.value = DateTime.now().toString();
    p.selectedSchedule.value = DateTime.now().toString();
    h.selectedDepartment.value = "310";
    h.getDataDoctors();
  }

  // Fungsi untuk mengambil data skedul dokter sesuai dengan jadwal dan poli yang dipilih
  getData() async {
    h.loadingDoctorData.value = false;
    h.getDataScheduleDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Jadwal Praktek").p16b().black(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.0,
          ),
          child: SizedBox(
              height: 54,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int itemIndex) => Row(
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // Berfungsi untuk memilih tanggal tujuan
                          h.selectedDate.value = days[itemIndex].toyyyyMMdd();
                          await getData();
                          setState(() {
                            selectedIndex = itemIndex;
                          });
                          p.selectedSchedule.value = days[itemIndex].toyyyyMMdd();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == itemIndex ? OPrimaryColor : const Color(0xff9CA7BD),
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
                          height: 52,
                          width: 52,
                          child: Center(
                              child: itemIndex == 0
                                  ? const Text(
                                      "Hari ini",
                                      maxLines: 2,
                                    ).p12m().white()
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: 31,
                                            child: Text(
                                              days[itemIndex].toEEEE() == 'Senin'
                                                  ? "Sen"
                                                  : days[itemIndex].toEEEE() == 'Sabtu'
                                                      ? 'Sab'
                                                      : days[itemIndex].toEEEE() == 'Minggu'
                                                          ? 'Min'
                                                          : days[itemIndex].toEEEE() == 'Selasa'
                                                              ? 'Sel'
                                                              : days[itemIndex].toEEEE() == 'Kamis'
                                                                  ? 'Kam'
                                                                  : days[itemIndex].toEEEE() == 'Rabu'
                                                                      ? 'Rab'
                                                                      : days[itemIndex].toEEEE(),
                                              maxLines: 1,
                                              style: const TextStyle(height: 1.5),
                                              textAlign: TextAlign.center,
                                            ).p12m().white()),
                                        Text(
                                          days[itemIndex].toTheDay(),
                                          style: const TextStyle(height: 1.3),
                                        ).p12m().white(),
                                      ],
                                    )),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      )
                    ],
                  ),
                ),
              )),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
              height: 23,
              child: ListView.builder(
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int itemIndex) => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Berfungsi untuk memilih poli daripada dokter yang dipilih
                        h.selectedDepartment.value = "310";
                        // print(h.selectedDepartment.value);

                        getData();
                        setState(() {
                          selectedCategory = itemIndex;
                          // h.selectedDepartment.value = "310";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(color: selectedCategory == itemIndex ? OPrimaryColor : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                        // width:   81,
                        child: Center(
                            child: Text(
                          category[itemIndex],
                          style: TextStyle(
                            color: selectedCategory == itemIndex ? Colors.white : OPrimaryColor,
                          ),
                        ).p12r()),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Obx(() => (h.loadingDoctorData.value)
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: h.listDoctors.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) => index == h.listDoctors.length - 1
                          ? Column(
                              children: [
                                ItemList(h.listDoctors[index], index),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            )
                          : ItemList(h.listDoctors[index], index),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Tidak ada jadwal dokter"),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )),
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget ItemList(Doctor doctor, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDoctorIndex = index;
          p.selectedDoctor.value = doctor.userId;
          // print(p.selectedDoctor.value);
        });
        // print(doctor.fname);
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 129,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        width: 105,
                        height: 105,
                        "assets/images/img_avatar_2.png",
                        fit: BoxFit.cover,
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
                            AutoSizeText(doctor.fname, maxLines: 1, style: GoogleFonts.poppins(fontSize: 14, color: OPrimaryColor, fontWeight: FontWeight.w700), minFontSize: 5),
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
                            Container(
                              child: Text(doctor.poli).p10r(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icon/ic_icon_pagi.png",
                                  width: 14,
                                  height: 14,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(doctor.jadwalPagi.jumat).p12m().primary()
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(200), border: Border.all(color: selectedDoctorIndex == index ? OPrimaryColor : const Color.fromARGB(255, 204, 203, 203)), color: selectedDoctorIndex == index ? OPrimaryColor : Colors.white),
                        child: selectedDoctorIndex == index
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
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
