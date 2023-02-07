import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../../../widget/base/custom_fixed_form.dart';
import '../../../../widget/base/custom_form.dart';
import '../../../global_controller.dart';

class FormDataPatient extends StatefulWidget {
  // final String title;
  final bool? passwordMode;

  const FormDataPatient({super.key, this.passwordMode});

  @override
  State<FormDataPatient> createState() => _FormDataPatientState();
}

class _FormDataPatientState extends State<FormDataPatient> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 115,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 136,
              height: 136,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/img_avatar.png"),
              ),
            ),
          ),
          const CustomFixedForm(content: "RM/545148-1151/015", title: "No. Rekam Medis"),
          const CustomFixedForm(content: "Herlambang Ardianto", title: "Nama Lengkap", backgroundColor: Colors.white,isMust: true,),
          const CustomFixedForm(content: "ardiantoCelaluCeria@gmail.com", title: "Email", backgroundColor: Colors.white,isMust: true,),
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
                child: 
                CustomFixedForm(content: "19/02/1985", title: "Tanggal Lahir", backgroundColor: Colors.white,isMust: true,),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: 
                CustomFixedForm(content: "42 Tahun", title: "Usia",isMust: true,),
                // const CustomFixedForm(content: "42 Tahun", title: "Usia"),
              )
            ],
          ),
         CustomFixedForm(content: "Istri", title: "Status Pasien Dalam Keluarga", backgroundColor: Colors.white,isMust: true,),          
          Row(
            children: [
              Expanded(
                child: 
                CustomFixedForm(content: "Perempuan", title: "Jenis Kelamin", backgroundColor: Colors.white,isMust: true,),          
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: 
                CustomFixedForm(content: "Islam", title: "Agama", backgroundColor: Colors.white,isMust: true,),
              ),
            ],
          ),
          CustomFixedForm(content: "Paracetamol", title: "Alergi Obat", backgroundColor: Colors.white,isMust: true,),
          CustomFixedForm(content: "AB", title: "Golongan Darah", backgroundColor: Colors.white,isMust: true,),
          CustomFixedForm(content: "Jl, Nginden Semolo No. 42, Nginden Jangkrungan, Kec. Sukolilo, Kota SBY, Jawa Timur 19002", title: "Alamat", backgroundColor: Colors.white,isMust: true, uboundedHeight: true,),
          CustomFixedForm(content: "Surabaya", title: "Kota", backgroundColor: Colors.white,isMust: true,),
          CustomFixedForm(content: "Kelurahan Sukolilo", title: "Kelurahan", backgroundColor: Colors.white,isMust: true,),
          Row(
            children: [
              Expanded(
                child: 
                  CustomFixedForm(content: "003", title: "RW", backgroundColor: Colors.white,isMust: true,),
              ),
              SizedBox(
                width: c.sw * 24,
              ),
              Expanded(
                child: 
                  CustomFixedForm(content: "006", title: "RT", backgroundColor: Colors.white,isMust: true,),
              ),
            ],
          ),
                  CustomFixedForm(content: "Kecamatan Sukolilo", title: "Kecamatan", backgroundColor: Colors.white,isMust: true,),
                  CustomFixedForm(content: "-", title: "No. Telepon (Rumah)", backgroundColor: Colors.white,isMust: true,),
                  CustomFixedForm(content: "0822265121515", title: "No. Handphone", backgroundColor: Colors.white,isMust: true,),
                  CustomFixedForm(content: "Ari Ardianto", title: "Nama Orang Tua", backgroundColor: Colors.white,isMust: true,),
            SizedBox(height: c.sh*20)
        ],
      ),
    );
  }
}
