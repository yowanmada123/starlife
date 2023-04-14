import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:starlife/controllers/check_rm_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/custom_list_form.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../widget/base/custom_fixed_form.dart';

class FormDataRm extends StatefulWidget {
  const FormDataRm({
    super.key,
  });
  // final DetailMedicalRecord record;
  @override
  State<FormDataRm> createState() => _FormDataRmState();
}

class _FormDataRmState extends State<FormDataRm> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  final cr = Get.put(CheckRmController());
  DateTime dateOfbirth = DateTime.now();
  DateTime appoinmentDate = DateTime.now();
  String date = '';
  String age = '';
  String formattedTime = '';
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      await cr.getDetailDataMedicalRecord(context);
      dateOfbirth = DateTime.parse(cr.detailMedicalRecord!.datapasien.dateOfBirth);
      appoinmentDate = DateTime.parse(cr.detailMedicalRecord!.tanggalTime);
      // appoinmentDate = DateTime.parse(cr.detailMedicalRecord!.appointmentData.createDate);
      formattedTime = DateFormat.Hm().format(appoinmentDate);
      date = appoinmentDate.toDateHuman();
      age = c.yourAge(DateTime.parse(cr.detailMedicalRecord!.datapasien.dateOfBirth));
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
                  Text(cr.detailMedicalRecord!.dokter
                          // widget.record.dokter
                          // "dr. Hendri Sulaiman"
                          )
                      .p18b()
                      .primary(),
                  Text("Praktek ${cr.detailMedicalRecord!.poli}").p12r().primary(),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFixedForm(
                      content: cr.detailMedicalRecord!.rm,
                      // "RM/545148-1151/015",
                      title: "No. Rekam Medis"),
                  CustomFixedForm(
                    content: cr.detailMedicalRecord!.nama,
                    // "Herlambang Ardianto",
                    title: "Nama Lengkap",
                    backgroundColor: Colors.white,
                    isMust: false,
                  ),
                  CustomFixedForm(
                      content:
                          // widget.medicalRecord.age
                          "$age Tahun",
                      title: "Usia",
                      backgroundColor: Colors.white),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomFixedForm(
                          content:
                              // widget.medicalRecord.kg,
                              "${cr.detailMedicalRecord!.weight} Kg",
                          title: "Berat Badan",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomFixedForm(
                          content: "${cr.detailMedicalRecord!.bloodPressure} mmHg",
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
                      Expanded(
                        flex: 1,
                        child: CustomFixedForm(
                          content:
                              // widget.medicalRecord.
                              date,
                          // cr.detailMedicalRecord!.tanggalTime,
                          // "24 November 2023",
                          title: "Tanggal Periksa",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomFixedForm(
                          content:
                              // widget.medicalRecord.
                              "$formattedTime WIB",
                          title: "Jam Periksa",
                          backgroundColor: Colors.white,
                          isMust: false,
                        ),
                      ),
                    ],
                  ),
                  CustomListform(
                    content: cr.detailMedicalRecord!.keluhan,
                    title:
                        // widget.medicalRecord.
                        'Keluhan',
                  ),
                  CustomListform(
                    content: cr.detailMedicalRecord!.diagnosis,
                    title:
                        // widget.medicalRecord.
                        'Diagnosis',
                  ),
                  // CustomListform(
                  //   content: cr.detailMedicalRecord!.tindakan,
                  //   title:
                  //       // widget.medicalRecord.
                  //       'Tindakan',
                  // ),
                  CustomFixedForm(
                    content: cr.detailMedicalRecord!.tindakan,
                    // "Suntik Vaksin CYD-TDV (dengvaxia)",
                    title: "Tindakan",
                    backgroundColor: Colors.white,
                    isMust: false,
                  ),
                  CustomListform(
                    content: cr.detailMedicalRecord!.obat,
                    title:
                        // widget.medicalRecord.
                        'Resep Dokter',
                  ),
                  // CustomListOfMap(
                  //   content:
                  //       // widget.medicalRecord.
                  //       resep,
                  //   title: "Resep Dokter",
                  // )
                ],
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
              )));
  }
}
