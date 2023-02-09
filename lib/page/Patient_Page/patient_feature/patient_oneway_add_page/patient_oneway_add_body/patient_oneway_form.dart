import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_controller/patient_page_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/custom_dropdown.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../../widget/base/custom_fixed_form.dart';
import '../../../../../widget/base/custom_form.dart';

class PatientOneWayForm extends StatefulWidget {
  final bool? passwordMode;

  const PatientOneWayForm({super.key, this.passwordMode});

  @override
  State<PatientOneWayForm> createState() => _PatientOneWayFormState();
}

class _PatientOneWayFormState extends State<PatientOneWayForm> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());
  TextEditingController namaController = TextEditingController(text: "");
  TextEditingController tanggalLahirController = TextEditingController(text: "");
  TextEditingController jenisKelaminController = TextEditingController(text: "");
  TextEditingController alamatController = TextEditingController(text: "");
  TextEditingController handphoneController = TextEditingController(text: "");

  String _dateTime = 'dd/mm/yyyy';
  final List<String> genderItems = [
    'Laki-Laki',
    'Perempuaun',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 115,
          ),
          CustomForm(
            controller: p.namaController,
            hintText: "Masukan Nama Lengkap",
            title: "Nama Lengkap",
            isMust: true,
          ),
          CustomDropDown(
            title: "Jenis Kelamin",
            items: genderItems,
            firstItem: 'Pilih Jenis Kelamin',
            controller: jenisKelaminController,
            isMust: true,
          ),
          CustomForm(
            controller: p.alamatController,
            hintText: "Masukkan Alamat",
            title: "Alamat (Opsional)",
          ),
          CustomFixedForm(
            title: "Tanggal Lahir (Optional)",
            cornerIcon: Icons.calendar_month_outlined,
            content: _dateTime,
            backgroundColor: Colors.white,
            ontap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((date) {
                //tambahkan setState dan panggil variabel _dateTime.
                setState(() {
                  _dateTime = date!.toDateHuman();
                  p.tanggalLahirController.text = date.toDateHuman();
                  print(p.tanggalLahirController.text);
                });
              });
            },
          ),
          CustomForm(
            controller: p.handphoneController,
            hintText: "Masukkan No. Handphone",
            title: "No. Handphone (Opsional)",
          )
        ],
      ),
    );
  }
}
