import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Patient_Page/patient_controller/patient_page_controller.dart';
import 'package:starlife/widget/base/custom_dropdown.dart';
import 'package:starlife/widget/base/custom_phone_form.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../../widget/base/custom_fixed_form.dart';
import '../../../../../widget/base/custom_form.dart';
import '../../../../global_controller.dart';

class PatientAddForm extends StatefulWidget {
  final bool? passwordMode;

  const PatientAddForm({super.key, this.passwordMode});

  @override
  State<PatientAddForm> createState() => _PatientAddFormState();
}

class _PatientAddFormState extends State<PatientAddForm> {
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());

  DateTime birthday = DateTime.now();
  late DateDuration duration;

  final List<String> genderItems = [
    'Laki - laki',
    'Perempuan',
  ];

  final List<String> goldarItem = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  final List<String> religions = [
    'Islam',
    'Kristen',
    'Hindu',
    'Budha',
    'Konghucu',
  ];
  String date = "dd/mm/yy";
  String ageToString = "-";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height:    115,
          ),
          const CustomFixedForm(content: "RM/545148-1151/015", title: "No. Rekam Medis"),
          CustomForm(
            controller: p.namaController,
            hintText: "Masukan Nama Lengkap",
            title: "Nama Lengkap",
            isMust: true,
          ),
          CustomForm(
            controller: p.emailController,
            hintText: "Masukan Email",
            title: "Email",
            isMust: true,
          ),
          Row(
            children: [
              Expanded(
                child: CustomFixedForm(
                  title: "Tanggal Lahir",
                  isMust: true,
                  cornerIcon: Icons.calendar_month_outlined,
                  content: date,
                  backgroundColor: Colors.white,
                  ontap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    ).then((data) {
                      //tambahkan setState dan panggil variabel _dateTime.
                      setState(() {
                        date = data!.toSlashDate();
                        p.tanggalLahirController.text = data.toyyyyMMdd();
                        print(p.tanggalLahirController.text);
                        birthday = data;
                        // duration = c.yourAge(birthday);
                        //  AgeCalculator.age(birthday, today: DateTime.now());
                        // print(duration.years);
                        ageToString = c.yourAge(birthday).toString();
                        p.usiaController.text = ageToString;
                      });
                    });
                  },
                ),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: CustomFixedForm(
                  content: "$ageToString Tahun",
                  title: "Usia",
                  isMust: true,
                ),
              )
            ],
          ),
          CustomForm(
            controller: p.statusController,
            hintText: "cth: Suami / Istri / Anak ke-1 / Anak ke-2, dsb",
            title: "Status Pasien Dalam Keluarga",
            isMust: true,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomDropDown(
                title: "Jenis Kelamin",
                items: genderItems,
                firstItem: 'Pilih Salah Satu',
                controller: p.jenisKelaminController,
                isMust: true,
              )),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                  child: CustomDropDown(
                title: "Agama",
                items: religions,
                firstItem: 'Pilih Salah Satu',
                controller: p.agamaController,
                isMust: true,
              ))
            ],
          ),
          CustomForm(
            controller: p.alergiObatController,
            hintText: "cth: Alergi Paracetamol",
            title: "Alergi Obat",
            isMust: true,
          ),
          CustomDropDown(
            title: "Golongan Darah",
            items: goldarItem,
            firstItem: 'Pilih Salah Satu',
            controller: p.jenisKelaminController,
            isMust: true,
          ),
          CustomForm(
            controller: p.alamatController,
            hintText: "Masukkan Alamat",
            title: "Alamat",
            isMust: true,
          ),
          CustomForm(
            controller: p.kotaController,
            hintText: "Masukkan Kota",
            title: "Kota",
          ),
          CustomForm(
            controller: p.kelurahanController,
            hintText: "Masukkan Kelurahan",
            title: "Kelurahan",
          ),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  controller: p.rwController,
                  hintText: "Masukkan RW",
                  title: "RW",
                  isMust: false,
                ),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: CustomForm(
                  controller: p.rtController,
                  hintText: "Masukkan RT",
                  title: "RT",
                  isMust: false,
                ),
              ),
            ],
          ),
          CustomForm(
            controller: p.kecamatanController,
            hintText: "Kecamatan",
            title: "Masukkan Kecamatan",
          ),
          CustomForm(
            controller: p.teleponController,
            hintText: "Masukkan No. Telepon",
            title: "No. Telepon (Rumah)",
          ),
          CustomPhoneForm(
            controller: p.handphoneController,
            hintText: "Masukkan No. Handphone",
            title: "No. Handphone",
            isMust: true,
          ),
          CustomForm(
            controller: p.orangtuaController,
            hintText: "Masukkan Nama Orang Tua",
            title: "Nama Orang Tua",
          ),
        ],
      ),
    );
  }
}
