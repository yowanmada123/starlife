import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

// Halaman antrian pasien. 
class PatientQueuePage extends StatefulWidget {
  const PatientQueuePage({super.key});

  @override
  State<PatientQueuePage> createState() => _PatientQueuePageState();
}

class _PatientQueuePageState extends State<PatientQueuePage> {
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());
  var date = DateTime.now();

  // Fungsi yang berguna untuk cek data appointment dokter. 
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      p.loadingAppoinment.value = false;
      p.cekDataAppointment(context, false);
    });
  }

// p.checkDoctorAppointment(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
        ),
        Positioned(
          top: -270,
          left: -137,
          child: Container(
            width: 700,
            height: 700,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: OPrimaryColor),
          ),
        ),
        Positioned(
            top: -200,
            left: -140,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(400)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  width: 676,
                  height: 610,
                  'assets/icon/ic_logo_crop.png',
                  // color: Colors.white.withOpacity(0.15),
                  colorBlendMode: BlendMode.modulate,
                ),
                // Image.network(width:   676, height:   610, p.person!.picture, errorBuilder: (context, error, stackTrace) {
                //   return Image.asset("assets/images/img_avatar.png");
                // }),
              ),
            )),
        SizedBox(
          child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Obx(() => (p.loadingAppoinment.value)
                  ? Column(
                      children: [
                        Padding(
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
                                    const ButtonBack(times: 1),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const Text("Ambil Antrian").p16b().white(),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    child: SizedBox(
                                      width: 126,
                                      height: 126,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset("assets/icon/ic_doctor.png"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(p.appointment!.namaDokter).p18m().white(),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 550,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xffDEF6FD)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 23, right: 23, top: 23),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 13),
                                    height: 270,
                                    width: Get.width,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text("Antrian Sedang Dilayani").p14b().black(),
                                        AutoSizeText(
                                          p.appointment!.antrianSedangDilayani.toString(),
                                          style: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.w800, color: OPrimaryColor),
                                          minFontSize: 50,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text("Jumlah Antrian").p10r().black(),
                                                  Text(p.appointment!.jumlahAntrian.toString()).p18b().primary(),
                                                ],
                                              ),
                                              Container(
                                                height: 30,
                                                width: 0.5,
                                                decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text("Tanggal Pemeriksaan").p10r().black(),
                                                  Text(DateTime.parse(p.appointment!.date).toSlashDate()).p18b().primary(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          // margin: EdgeInsets.symmetric(horizontal:  24),
                                          width: Get.width,
                                          height: 0.5,
                                          decoration: BoxDecoration(color: OPrimaryColor),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Status Kedatangan Dokter").p10r().black(),
                                        Text(p.appointment!.statusKedatanganDokter).p18b().primary(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  width: Get.width,
                                  height: 1,
                                  decoration: BoxDecoration(color: OPrimaryColor),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 23),
                                  child: Container(
                                    height: 200,
                                    width: Get.width,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text("Nomor Antrian Anda").p14b().black(),
                                        AutoSizeText(
                                          p.appointment!.formatNomor,
                                          style: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.w800, color: OSecondaryColor),
                                          minFontSize: 50,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text("Praktek ${p.appointment!.namaPoli}").p10r().black(),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 28),
                                          child: BaseButton(
                                            ontap: () async {
                                              if (p.selectedPatientRm.value != '') {
                                                if (p.selectedDoctor.value != '') {
                                                  if (p.selectedSchedule.value != null && p.selectedDoctor.value != '') {
                                                    await p.cekDataAppointment(context, true);
                                                    if (p.loadingAppoinment.value) {
                                                      // ignore: use_build_context_synchronously
                                                      CustomDialog(context);

                                                      // Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
                                                    }
                                                    // Get.to(const PatientQueuePage(), transition: Transition.rightToLeft);
                                                  } else {
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                      content: Text("Please Choose Schedule First"),
                                                      backgroundColor: Colors.black87,
                                                    ));
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                    content: Text("Please Choose Patient First"),
                                                    backgroundColor: Colors.black87,
                                                  ));
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                  content: Text("Please Choose Doctor First"),
                                                  backgroundColor: Colors.black87,
                                                ));
                                              }
                                            },
                                            text: "Ambil Antrian",
                                            textColor: Colors.white,
                                            outlineRadius: 20,
                                            width: Get.width,
                                            height: 32,
                                            textSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  : const CircularProgressIndicator())),
        ),
      ]),
    );
  }

  // ignore: non_constant_identifier_names
  Future<String?> CustomDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
            child: SizedBox(
          width: 170,
          child: Text(
            "Berhasil Mengambil Nomor Antrian",
            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        )),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: BaseButton(
                ontap: () {
                  MendapatNomerAntrian(context);
                },
                text: "Lihat Detail Antrian",
                outlineRadius: 10,
                textSize: 14,
                height: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<Object?> MendapatNomerAntrian(BuildContext context) {
    final p = Get.put(PatientPageController());

    return showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: SizedBox(
                        width: 126,
                        height: 126,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset("assets/icon/ic_doctor.png"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(p.scheduledAppointment!.namaDokter).p18m().primary(),
                    Text("Praktek ${p.scheduledAppointment!.namaPoli}").p12r().primary(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text("No. Rekam Medis").p10r().black(),
                              Text(p.scheduledAppointment!.rm).p18b().primary(),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Tanggal Pemeriksaan").p10r().black(),
                              Text(DateTime.parse(p.scheduledAppointment!.date).toSlashDate()).p18b().primary(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Nama Pasien").p10r().black(),
                    Text(
                      p.scheduledAppointment!.namaPasien,
                      textAlign: TextAlign.center,
                    ).p20b().primary(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("No. Antrian Anda").p10r().black(),
                    Text(p.scheduledAppointment!.formatNomor).p52eb().secondary(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                          width: 334,
                          height: 38,
                          child: BaseButton(
                              ontap: () {
                                c.pasienNumber++;
                                c.tabHomeIndex.value = 0;
                                Get.offAll(HelloConvexAppBar());
                                // Get.close(2);
                              },
                              text: "Kembali Ke Beranda",
                              width: Get.width,
                              height: 38,
                              outlineRadius: 5,
                              textSize: 12,
                              textColor: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },

      animationType: DialogTransitionType.slideFromBottom,
      // curve: Curves.fastOutSlowIn,
      // duration: Duration(seconds: 1),
    );
  }
}
