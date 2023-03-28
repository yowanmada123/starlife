import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_edit/profile_patient_edit_data_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../../../widget/base/custom_fixed_form.dart';

class ProfilePatientDataform extends StatefulWidget {
  const ProfilePatientDataform({super.key, required this.patient});
  final Patient patient;

  @override
  State<ProfilePatientDataform> createState() => _ProfilePatientDataformState();
}

class _ProfilePatientDataformState extends State<ProfilePatientDataform> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());
  bool visible = false;
  DateTime dateOfbirth = DateTime.now();
  String date = '';
  String age = '';

  @override
  void initState() {
    super.initState();
    print(widget.patient.picture);
    dateOfbirth = DateTime.parse(widget.patient.dateOfBirth);
    date = dateOfbirth.toSlashDate();
    age = c.yourAge(DateTime.parse(widget.patient.dateOfBirth));
    p.namaController.text = widget.patient.fname;
    p.emailController.text = widget.patient.email;
    p.pincode.value = widget.patient.pincode;
    p.tanggalLahirController.text = widget.patient.dateOfBirth;
    p.statusController.text = widget.patient.statusPasien;
    p.jenisKelaminController.text = widget.patient.sex;
    p.agamaController.text = widget.patient.agama;
    p.alergiObatController.text = widget.patient.alergi;
    p.goldarController.text = widget.patient.bloodGroup;
    p.kotaController.text = widget.patient.kota;
    p.kelurahanController.text = widget.patient.kelurahan;
    p.rwController.text = widget.patient.rw;
    p.rtController.text = widget.patient.rt;
    p.kecamatanController.text = widget.patient.kecamatan;
    p.teleponController.text = widget.patient.phone;
    p.handphoneController.text = widget.patient.mobile;
    p.orangtuaController.text = widget.patient.namaOrangtua;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 98, right: 16, left: 16),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                  child: SizedBox(
                    width: 136,
                    height: 136,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(widget.patient.picture, errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/img_avatar.png");
                        })),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: c.sw * 128,
                    height: 26,
                    child: BaseButton(
                      ontap: () {
                        Get.to(ProfileEditDataPage(
                          patient: widget.patient,
                        ));
                      },
                      text: "Edit Profile",
                      textSize: 12,
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            CustomFixedForm(
              content: widget.patient.rm,
              title: "No. Rekam Medis",
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.fname,
              title: "Nama Lengkap",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.email == '' || widget.patient.email == null ? '' : widget.patient.email,
              title: "Email",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              title: "Pin RM",
              cornerIcon: (visible) ? Icons.visibility : Icons.visibility_off,
              ontapIcon: () {
                setState(() {
                  visible = !visible;
                });
              },
              content: (visible) ? widget.patient.pincode : widget.patient.pincode.replaceAll(RegExp(r"."), "*"),
              backgroundColor: Colors.white,
              ontap: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFixedForm(
                    content: date,
                    title: "Tanggal Lahir",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomFixedForm(
                    content: "$age Tahun",
                    title: "Usia",
                    isMust: true,
                  ),
                  // const CustomFixedForm(content: "42 Tahun", title: "Usia"),
                )
              ],
            ),
            CustomFixedForm(
              content: "Istri",
              title: "Status Pasien Dalam Keluarga",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFixedForm(
                    content: widget.patient.sex == "male" ? "Laki - Laki" : "Perempuan",
                    title: "Jenis Kelamin",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomFixedForm(
                    content: widget.patient.agama,
                    title: "Agama",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                ),
              ],
            ),
            CustomFixedForm(
              content: widget.patient.alergi,
              title: "Alergi Obat",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.bloodGroup,
              title: "Golongan Darah",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.address,
              title: "Alamat",
              backgroundColor: Colors.white,
              isMust: true,
              uboundedHeight: true,
            ),
            CustomFixedForm(
              content: widget.patient.kota,
              title: "Kota",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.kelurahan,
              title: "Kelurahan",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFixedForm(
                    content: widget.patient.rw,
                    title: "RW",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomFixedForm(
                    content: widget.patient.rt,
                    title: "RT",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                ),
              ],
            ),
            CustomFixedForm(
              content: widget.patient.kecamatan,
              title: "Kecamatan",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.phone,
              title: "No. Telepon (Rumah)",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.mobile,
              title: "No. Handphone",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            CustomFixedForm(
              content: widget.patient.namaOrangtua,
              title: "Nama Orang Tua",
              backgroundColor: Colors.white,
              isMust: true,
            ),
            SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
