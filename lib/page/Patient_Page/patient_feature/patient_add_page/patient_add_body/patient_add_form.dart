import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/widget/base/custom_dropdown.dart';

import '../../../../../widget/base/custom_fixed_form.dart';
import '../../../../../widget/base/custom_form.dart';
import '../../../../global_controller.dart';

class PatientAddForm extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool? passwordMode;

  const PatientAddForm({super.key, required this.controller, required this.title, this.passwordMode});

  @override
  State<PatientAddForm> createState() => _PatientAddFormState();
}

class _PatientAddFormState extends State<PatientAddForm> {
  final c = Get.put(GlobalController());
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
  final List<String> genderItems = [
    'Laki -laki',
    'Perempuan',
  ];

  final List<String> religions = [
    'Islam',
    'Kristen',
    'Hindu',
    'Budha',
    'Konghucu',
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
          const CustomFixedForm(content: "RM/545148-1151/015", title: "No. Rekam Medis"),
          CustomForm(
            controller: namaController,
            hintText: "Masukan Nama Lengkap",
            title: "Nama Lengkap",
            isMust: true,
          ),
          CustomForm(
            controller: emailController,
            hintText: "Masukan Email",
            title: "Email",
            isMust: true,
          ),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  controller: tanggalLahirController,
                  hintText: "dd/mm//yyyy",
                  title: "Tanggal Lahir",
            isMust: true,
                ),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: const CustomFixedForm(content: "42 Tahun", title: "Usia"),
              )
            ],
          ),
          CustomForm(
            controller: statusController,
            hintText: "cth: Suami / Istri / Anak ke-1 / Anak ke-2, dsb",
            title: "Status Pasien Dalam Keluarga",
            isMust: true, 
          ),
          Row(
            children: [
              Expanded(child: CustomDropDown(title: "Jenis Kelamin", items: genderItems,firstItem: 'Pilih Salah Satu', controller: jenisKelaminController,)),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(child: CustomDropDown(title: "Agama",items: religions, firstItem: 'Pilih Salah Satu', controller: agamaController,))
            ],
          ),
          CustomForm(
            controller: alergiObatController,
            hintText: "cth: Alergi Paracetamol",
            title: "Alergi Obat",
            isMust: true,
          ),
          CustomForm(
            controller: goldarController,
            hintText: "cth: AB",
            title: "Golongan Darah",
          ),
          CustomForm(
            controller: alamatController,
            hintText: "Masukkan Alamat",
            title: "Alamat",
            isMust: true,
          ),
          CustomForm(
            controller: kotaController,
            hintText: "Masukkan Kota",
            title: "Kota",
          ),
          CustomForm(
            controller: kelurahanController,
            hintText: "Masukkan Kelurahan",
            title: "Kelurahan",
          ),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  controller: jenisKelaminController,
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
                  controller: agamaController,
                  hintText: "Masukkan RT",
                  title: "RT",
            isMust: false,
                ),
              ),
            ],
          ),
          CustomForm(
            controller: kecamatanController,
            hintText: "Kecamatan",
            title: "Masukkan Kecamatan",
          ),
          CustomForm(
            controller: teleponController,
            hintText: "Masukkan No. Telepon",
            title: "No. Telepon (Rumah)",
          ),
          CustomForm(
            controller: handphoneController,
            hintText: "Masukkan No. Handphone",
            title: "No. Handphone",
          ),
          CustomForm(
            controller: orangtuaController,
            hintText: "Masukkan Nama Orang Tua",
            title: "Nama Orang Tua",
          ),
        ],
      ),
    );
  }
}
