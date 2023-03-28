import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/custom_dropdown.dart';
import 'package:starlife/widget/extention/ext_date.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../../../widget/base/custom_fixed_form.dart';
import '../../../../../../widget/base/custom_form.dart';

class ProfilePatientEditForm extends StatefulWidget {
  const ProfilePatientEditForm({super.key, required this.patient});
  // final bool? passwordMode;
  final patient;

  @override
  State<ProfilePatientEditForm> createState() => _ProfilePatientEditFormState();
}

class _ProfilePatientEditFormState extends State<ProfilePatientEditForm> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  bool visible = false;
  DateTime dateOfbirth = DateTime.now();
  String myDate = '';
  String age = '';
  File? filePhoto;
  final ImagePicker _picker = ImagePicker();
  final List<String> genderItems = [
    'Laki-Laki',
    'Perempuan',
  ];
  final List<String> religionItems = [
    'Islam',
    'Kristen',
    'Konghucu',
    'Hindu',
    'Budha',
    'Katolik',
  ];
  final List<String> bloodGroupItems = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB-',
    'AB-',
    'O+',
    'O-',
  ];

  @override
  void initState() {
    super.initState();
    // print(widget.patient.picture);
    dateOfbirth = DateTime.parse(widget.patient.dateOfBirth);
    myDate = dateOfbirth.toSlashDate();
    age = c.yourAge(DateTime.parse(widget.patient.dateOfBirth));
    print(widget.patient.pincode);
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
      padding: const EdgeInsets.only(top: 98, right: 16, left: 16),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(1000)),
                    child: SizedBox(
                      width: 136,
                      height: 136,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: (filePhoto == null)
                            ? FadeInImage(
                                image: NetworkImage(widget.patient.picture),
                                placeholder: const AssetImage("assets/images/img_avatar.png"),
                                imageErrorBuilder: (context, error, stackTrace) {
                                  return Image.asset('assets/images/img_avatar.png', fit: BoxFit.fitWidth);
                                },
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(filePhoto!.path),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (c) => AlertDialog(
                        // title: Container(),
                        content: Container(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          height: 58,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                  // File? file = await Get.to(() => const CameraOverlay('identitas'));
                                  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                                  if (image != null) {
                                    setState(() {
                                      filePhoto = File(image.path);
                                      p.filePhoto = File(image.path);
                                      // filePhoto = image as File?;
                                    });
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Kamera",
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                  if (image != null) {
                                    setState(() {
                                      filePhoto = File(image.path);
                                      p.filePhoto = File(image.path);
                                    });
                                  }
                                },
                                child: const Text("Galeri"),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: c.sw * 39,
                    height: 39,
                    decoration: BoxDecoration(
                        color: OPrimaryColor,
                        borderRadius: BorderRadius.circular(1000),
                        boxShadow: const [
                          BoxShadow(color: Color.fromARGB(83, 46, 46, 46), spreadRadius: 1, blurRadius: 1, offset: Offset(0.0, 1.0)),
                        ],
                        border: Border.all(color: Colors.white, width: 2)),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              )
            ]),
            CustomFixedForm(
              content: (widget.patient.rm == null || widget.patient.rm == '') ? "RM/545148-1151/015" : widget.patient.rm,
              title: "No. Rekam Medis",
            ),
            CustomForm(
              controller: p.namaController,
              // hintText: "",
              hintText: widget.patient.fname,
              title: "Nama Lengkap",
              isMust: true,
            ),
            CustomForm(
              controller: p.emailController,
              hintText: widget.patient.email,
              title: "Email",
              isMust: true,
            ),
            CustomFixedForm(
              isMust: true,
              title: "Pin RM",
              cornerIcon: (visible) ? Icons.visibility : Icons.visibility_off,
              ontapIcon: () {
                setState(() {
                  visible = !visible;
                });
              },
              content: (visible) ? p.pincode.value : p.pincode.value.replaceAll(RegExp(r"."), "*"),
              // content: (visible) ? widget.patient.pincode : widget.patient.pincode.replaceAll(RegExp(r"."), "*"),
              backgroundColor: Colors.white,
              ontap: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFixedForm(
                    isMust: true,
                    title: "Tanggal Lahir",
                    cornerIcon: Icons.calendar_month_outlined,
                    content: myDate,
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
                          myDate = date!.toSlashDate();
                          p.tanggalLahirController.text = date.toyyyyMMdd();
                          // print(p.tanggalLahirController.text);
                          age = c.yourAge(date);
                        });
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomFixedForm(content: "$age Tahun", title: "Usia"),
                )
              ],
            ),
            CustomForm(
              controller: p.statusController,
              hintText: widget.patient.statusPasien,
              title: "Status Pasien Dalam Keluarga",
              isMust: true,
            ),
            Row(
              children: [
                // Expanded(
                //   child: CustomForm(
                //     controller: p.jenisKelaminController,
                //     hintText: (widget.patient.sex == "male") ? "Laki - Laki" : "Perempuan",
                //     title: "Jenis Kelamin",
                //     isMust: true,
                //   ),
                // ),
                Expanded(
                  child: CustomDropDown(
                    title: "Jenis Kelamin",
                    items: genderItems,
                    firstItem: p.jenisKelaminController.text == "male" ? "Laki - Laki" : "Perempuan",
                    controller: p.jenisKelaminController,
                    isMust: true,
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomDropDown(
                    title: "Agama",
                    items: religionItems,
                    firstItem: p.agamaController.text,
                    controller: p.agamaController,
                    isMust: true,
                  ),
                ),
              ],
            ),
            CustomForm(
              controller: p.alergiObatController,
              hintText: widget.patient.alergi,
              title: "Alergi Obat",
              isMust: true,
            ),
            CustomDropDown(
              title: "Golongan Darah",
              items: bloodGroupItems,
              firstItem: p.goldarController.text,
              controller: p.goldarController,
              isMust: true,
            ),
            CustomForm(
              controller: p.alamatController,
              hintText: widget.patient.address,
              title: "Alamat",
              isMust: true,
            ),
            CustomForm(
              controller: p.kotaController,
              hintText: widget.patient.kota,
              title: "Kota",
            ),
            CustomForm(
              controller: p.kelurahanController,
              hintText: widget.patient.kelurahan,
              title: "Kelurahan",
            ),
            Row(
              children: [
                Expanded(
                  child: CustomForm(
                    controller: p.rwController,
                    hintText: widget.patient.rw,
                    title: "RW",
                  ),
                ),
                SizedBox(
                  width: c.sw * 24,
                ),
                Expanded(
                  child: CustomForm(
                    controller: p.rtController,
                    hintText: widget.patient.rt,
                    title: "RT",
                  ),
                ),
              ],
            ),
            CustomForm(
              controller: p.kecamatanController,
              hintText: widget.patient.kecamatan,
              title: "Kecamatan",
            ),
            CustomForm(
              controller: p.teleponController,
              hintText: widget.patient.phone,
              title: "No. Telepon (Rumah)",
            ),
            CustomForm(
              controller: p.handphoneController,
              hintText: "",
              title: "No. Handphone",
              isMust: true,
            ),
            CustomForm(
              controller: p.orangtuaController,
              hintText: widget.patient.namaOrangtua,
              title: "Nama Orang Tua",
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
