import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../../widget/base/custom_fixed_form.dart';

class ProfileDataForm extends StatefulWidget {
  final bool? passwordMode;

  const ProfileDataForm({super.key, this.passwordMode});

  @override
  State<ProfileDataForm> createState() => _ProfileDataFormState();
}

class _ProfileDataFormState extends State<ProfileDataForm> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());
  bool visible = false;
  String convertedDate = '';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      p.getDataPersonal();
    });
    // p.getDataPersonal();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() => (p.loadingPersonal.value)
            ? Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(1000)),
                    child: SizedBox(
                      width: 136,
                      height: 136,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(p.person!.picture, errorBuilder: (context, error, stackTrace) {
                            return Image.asset("assets/images/img_avatar.png");
                          })),
                    ),
                  ),
                  CustomFixedForm(
                    content: p.person!.rm,
                    title: "No. Rekam Medis",
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.fname,
                    title: "Nama Lengkap",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.email,
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
                    content: (visible) ? p.person!.pin : p.person!.pin.replaceAll(RegExp(r"."), "*"),
                    backgroundColor: Colors.white,
                    ontap: () {},
                  ),
                  // CustomFixedForm(content: p.person.dateOfBirth, title: "Tanggal Lahir", backgroundColor: Colors.white,isMust: true,),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFixedForm(
                          content: p.birthday,
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
                          content: "${p.age} Tahun",
                          title: "Usia",
                          isMust: true,
                        ),
                        // const CustomFixedForm(content: "42 Tahun", title: "Usia"),
                      )
                    ],
                  ),
                  CustomFixedForm(
                    content: p.person!.status,
                    title: "Status Pasien Dalam Keluarga",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFixedForm(
                          content: p.person!.sex,
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
                          content: p.person!.agama,
                          title: "Agama",
                          backgroundColor: Colors.white,
                          isMust: true,
                        ),
                      ),
                    ],
                  ),
                  CustomFixedForm(
                    content: p.person!.alergi,
                    title: "Alergi Obat",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.bloodGroup,
                    title: "Golongan Darah",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.address,
                    title: "Alamat",
                    backgroundColor: Colors.white,
                    isMust: true,
                    uboundedHeight: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.kota,
                    title: "Kota",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.kelurahan,
                    title: "Kelurahan",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFixedForm(
                          content: p.person!.rw,
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
                          content: p.person!.rt,
                          title: "RT",
                          backgroundColor: Colors.white,
                          isMust: true,
                        ),
                      ),
                    ],
                  ),
                  CustomFixedForm(
                    content: p.person!.kecamatan,
                    title: "Kecamatan",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.phone,
                    title: "Phone",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.mobile,
                    title: "No. Handphone",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                  CustomFixedForm(
                    content: p.person!.namaOrangtua,
                    title: "Nama Orang Tua",
                    backgroundColor: Colors.white,
                    isMust: true,
                  ),
                ],
              )
            : const Center(
                child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
              )));
  }
}
