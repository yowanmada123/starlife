import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../../../widget/base/custom_fixed_form.dart';
import '../../../../../../widget/base/custom_form.dart';

class ProfilePatientEditForm extends StatefulWidget {
  final bool? passwordMode;

  const ProfilePatientEditForm({super.key, this.passwordMode});

  @override
  State<ProfilePatientEditForm> createState() => _ProfilePatientEditFormState();
}

class _ProfilePatientEditFormState extends State<ProfilePatientEditForm> {
  final c = Get.put(GlobalController());
  bool visible = false;
  String password = "abcedef";
  bool editIcon = false;
  bool editButton = true;
  String _dateTime = "10/10/1985";
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
    return Container(
      padding: EdgeInsets.only(top: c.sh * 109, right: 16, left: 16),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: c.sh * 30,
            ),
            Stack(children: [
              Column(
                children: [
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
                ],
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: c.sw * 39,
                    height: c.sh * 39,
                    decoration: BoxDecoration(
                        color: OPrimaryColor,
                        borderRadius: BorderRadius.circular(1000),
                        boxShadow: const [
                          BoxShadow(color: Color.fromARGB(83, 46, 46, 46), spreadRadius: 1, blurRadius: 1, offset: Offset(0.0, 1.0)),
                        ],
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              )
            ]),
            const CustomFixedForm(
              content: "RM/545148-1151/015",
              title: "No. Rekam Medis",
            ),
            CustomForm(
              controller: namaController,
              hintText: "Herlambang Ardianto",
              title: "Nama Lengkap",
              isMust: true,
            ),
            CustomForm(
              controller: emailController,
              hintText: "ardiantoCelaluCeria@gmail.com",
              title: "Email",
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
              content: (visible) ? password : password.replaceAll(RegExp(r"."), "*"),
              backgroundColor: Colors.white,
              ontap: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFixedForm(
                    title: "Tanggal Lahir",
                    cornerIcon: Icons.calendar_month_outlined,
                    content: _dateTime,
                    backgroundColor: Colors.white,
                    ontap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        //tambahkan setState dan panggil variabel _dateTime.
                        setState(() {
                          _dateTime = date!.toSlashDate();
                        });
                      });
                    },
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
              hintText: "Istri",
              title: "Status Pasien Dalam Keluarga",
              isMust: true,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomForm(
                    controller: jenisKelaminController,
                    hintText: "Perempuan",
                    title: "Jenis Kelamin",
                    isMust: true,
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomForm(
                    controller: agamaController,
                    hintText: "Islam",
                    title: "Agama",
                  ),
                ),
              ],
            ),
            CustomForm(
              controller: alergiObatController,
              hintText: "Paracetamol",
              title: "Alergi Obat",
              isMust: true,
            ),
            CustomForm(
              controller: goldarController,
              hintText: "O",
              title: "Golongan Darah",
            ),
            CustomForm(
              controller: alamatController,
              hintText: "Jl, Nginden Semolo No. 42, Nginden Jangkrungan, Kec. Sukolilo, Kota SBY, Jawa Timur 19002",
              title: "Alamat",
              isMust: true,
            ),
            CustomForm(
              controller: kotaController,
              hintText: "Surabaya",
              title: "Kota",
            ),
            CustomForm(
              controller: kelurahanController,
              hintText: "Kelurahan Sukolilo",
              title: "Kelurahan",
            ),
            Row(
              children: [
                Expanded(
                  child: CustomForm(
                    controller: rwController,
                    hintText: "003",
                    title: "RW",
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomForm(
                    controller: rtController,
                    hintText: "006",
                    title: "RT",
                  ),
                ),
              ],
            ),
            CustomForm(
              controller: kecamatanController,
              hintText: "Kecamatan",
              title: "Kecamatan Sukolilo",
            ),
            CustomForm(
              controller: teleponController,
              hintText: "-",
              title: "No. Telepon (Rumah)",
            ),
            CustomForm(
              controller: handphoneController,
              hintText: "0822265121515",
              title: "No. Handphone",
            ),
            CustomForm(
              controller: orangtuaController,
              hintText: "Ari Ardianto",
              title: "Nama Orang Tua",
            ),
            SizedBox(
              height: c.sh * 80,
            )
          ],
        ),
      ),
    );
  }
}
