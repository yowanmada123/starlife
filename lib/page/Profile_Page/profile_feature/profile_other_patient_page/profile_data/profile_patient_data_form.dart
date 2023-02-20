import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
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
  bool visible = false;
  String password = "abcedef";
  bool editIcon = false;
  bool editButton = true;
  DateTime dateOfbirth = DateTime.now();
  String date = '';
  String age = '';

  @override
  void initState() {
    super.initState();
    dateOfbirth = DateTime.parse(widget.patient.dateOfBirth);
    date = dateOfbirth.toSlashDate();
    age = c.yourAge(DateTime.parse(widget.patient.dateOfBirth));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: c.sh * 109, right: 16, left: 16),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: c.sh * 30),
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: 136,
                    height: 136,
                    child: FittedBox(fit: BoxFit.cover, child: widget.patient.picture == '' || widget.patient.picture == null ? Image.asset("assets/images/img_avatar.png") : Image.network(widget.patient.picture)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: c.sh * 20,
                ),
                Container(
                    width: c.sw * 128,
                    height: c.sh * 26,
                    child: BaseButton(
                      ontap: () {
                        Get.to(const ProfileEditDataPage());
                      },
                      text: "Edit Profile",
                      textSize: 12,
                    )),
                SizedBox(
                  height: c.sh * 20,
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
              content: widget.patient.email,
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
              content: (visible) ? widget.patient.pin : widget.patient.pin.replaceAll(RegExp(r"."), "*"),
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
                    content: widget.patient.sex,
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
            SizedBox(height: c.sh * 80)
          ],
        ),
      ),
    );
  }
}
