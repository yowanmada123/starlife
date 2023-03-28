import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/check_rm_controller.dart';
import 'package:starlife/models/model_medical_record.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/custom_list_form.dart';
import 'package:starlife/widget/base/custom_list_map.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../../widget/base/custom_fixed_form.dart';

class FormDataRm extends StatefulWidget {
  const FormDataRm({super.key, required this.medicalRecord});
  final MedicalRecord medicalRecord;
  @override
  State<FormDataRm> createState() => _FormDataRmState();
}

class _FormDataRmState extends State<FormDataRm> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  final cr = Get.put(CheckRmController());

  TextEditingController rmController = TextEditingController(text: "");
  TextEditingController namaController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController tanggalLahirController = TextEditingController(text: "");
  TextEditingController statusController = TextEditingController(text: "");
  TextEditingController jenisKelaminController = TextEditingController(text: "");
  TextEditingController agamaController = TextEditingController(text: "");
  TextEditingController alergiObatController = TextEditingController(text: "");
  TextEditingController goldarController = TextEditingController(text: "");
  TextEditingController alamatController = TextEditingController(text: "");
  TextEditingController kotaController = TextEditingController(text: "");
  TextEditingController kelurahanController = TextEditingController(text: "");
  TextEditingController rtController = TextEditingController(text: "");
  TextEditingController rwController = TextEditingController(text: "");
  TextEditingController kecamatanController = TextEditingController(text: "");
  TextEditingController teleponController = TextEditingController(text: "");
  TextEditingController handphoneController = TextEditingController(text: "");
  TextEditingController orangtuaController = TextEditingController(text: "");
  final List<String> entrie = <String>[
    'Sakit Kepala',
    'Mual',
    'Muntah',
    'Nyeri otot, sendi, dan tulang',
    'Nyeri di bagian belakang mata',
  ];
  final List<Map<String, dynamic>> resep = [
    {'obat': '500mg Paracetamol', 'aturan': 'Sehari 3 kali 1 tablet'},
    {'obat': '10mg Domperidone', 'aturan': '3 - 4 kali sehari'},
    {'obat': '10mg Domperidone', 'aturan': '3 - 4 kali sehari'},
  ];
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await cr.getDetailDataMedicalRecord(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() => (cr.loadingDetailMedicalRecord.value)
            ? Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // ClipRRect(
                  //         borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //         child: SizedBox(
                  //           width: 136,
                  //           height: 136,
                  //           child: FittedBox(
                  //             fit: BoxFit.cover,
                  //             child: Image.network(
                  //               widget.medicalRecord.picture,
                  //               errorBuilder: (context, error, stackTrace) {
                  //                 return Image.asset("assets/images/img_avatar.png");
                  //               }
                  //             )
                  //           ),
                  //         ),
                  //       ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        "assets/images/img_doctor2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(widget.medicalRecord.dokter
                          // "dr. Hendri Sulaiman"
                          )
                      .p18b()
                      .primary(),
                  Text("Praktek ${widget.medicalRecord.poli}").p12r().primary(),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFixedForm(
                      content: widget.medicalRecord.rm,
                      // "RM/545148-1151/015",
                      title: "No. Rekam Medis"),
                  CustomFixedForm(
                    content: widget.medicalRecord.nama,
                    // "Herlambang Ardianto",
                    title: "Nama Lengkap",
                    backgroundColor: Colors.white,
                    isMust: false,
                  ),
                  CustomFixedForm(
                      content:
                          // widget.medicalRecord.age
                          "42 Tahun",
                      title: "Usia",
                      backgroundColor: Colors.white),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFixedForm(
                          content:
                              // widget.medicalRecord.kg,
                              "52 Kg",
                          title: "Berat Badan",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 24,
                      ),
                      Expanded(
                        child: CustomFixedForm(
                          content: "${widget.medicalRecord.bloodPressure} widget.medicalRecord.",
                          // "90/70 mmHg",
                          title: "Tekanan Darah",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: CustomFixedForm(
                          content:
                              // widget.medicalRecord.
                              "24 November 2023",
                          title: "Tanggal Periksa",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 24,
                      ),
                      const Expanded(
                        child: CustomFixedForm(
                          content:
                              // widget.medicalRecord.
                              "10:40 WIB",
                          title: "Jam Periksa",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                    ],
                  ),
                  CustomListform(
                    content: entrie,
                    title:
                        // widget.medicalRecord.
                        'Keluhan',
                  ),
                  const CustomFixedForm(
                    content:
                        // widget.medicalRecord.
                        "Demam Berdarah",
                    title: "Diagnosis",
                    backgroundColor: Colors.white,
                    isMust: false,
                  ),
                  const CustomFixedForm(
                    content:
                        // widget.medicalRecord.
                        "Suntik Vaksin CYD-TDV (dengvaxia)",
                    title: "Tindakan",
                    backgroundColor: Colors.white,
                    isMust: false,
                  ),
                  CustomListOfMap(
                    content:
                        // widget.medicalRecord.
                        resep,
                    title: "Resep Dokter",
                  )
                ],
              )
            : const CircularProgressIndicator()));
  }
}
