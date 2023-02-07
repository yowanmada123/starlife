import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/custom_dropdown.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../widget/base/custom_fixed_form.dart';
import '../../../../widget/base/custom_form.dart';

class FormAddPatient extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool? passwordMode;

  const FormAddPatient({super.key, required this.controller, required this.title, this.passwordMode});

  @override
  State<FormAddPatient> createState() => _FormAddPatientState();
}

class _FormAddPatientState extends State<FormAddPatient> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  TextEditingController namaController = TextEditingController(text: "");
  TextEditingController tanggalLahirController = TextEditingController(text: "");
  TextEditingController jenisKelaminController = TextEditingController(text: "");
  TextEditingController alamatController = TextEditingController(text: "");
  TextEditingController handphoneController = TextEditingController(text: "");

  String _dateTime = 'dd/mm/yyyy';
  final List<String> genderItems = [
    'Male',
    'Female',
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
            controller: namaController,
            hintText: "Masukan Nama Lengkap",
            title: "Nama Lengkap",
            isMust: true,
          ),
          CustomDropDown(title: "Jenis Kelamin", items: genderItems,firstItem: 'Pilih Jenis Kelamin', controller: jenisKelaminController,),
          CustomForm(
            controller: alamatController,
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
                  lastDate: DateTime(2099),
                ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                  setState(() {
                    _dateTime = date!.toDateHuman();
                  });
                });
            },
          ),
          // CustomForm(
          //         controller: tanggalLahirController,
          //         hintText: "dd/mm//yyyy",
          //         title: "Tanggal Lahir (Opsional)",
          //       ),
          CustomForm(
            controller: handphoneController,
            hintText: "Masukkan No. Handphone",
            title: "No. Handphone (Opsional)",
          )
        ],
      ),
    );
  }
}
