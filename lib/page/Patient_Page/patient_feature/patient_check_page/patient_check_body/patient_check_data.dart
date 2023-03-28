import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/Patient_Page/patient_controller/patient_page_controller.dart';
import 'package:starlife/widget/extention/ext_date.dart';

import '../../../../../widget/base/custom_fixed_form.dart';
import '../../../../global_controller.dart';

class PatientCheckData extends StatefulWidget {
  const PatientCheckData({super.key, required this.rm});
  final String rm;

  @override
  State<PatientCheckData> createState() => _PatientCheckDataState();
}

class _PatientCheckDataState extends State<PatientCheckData> {
  final c = Get.put(GlobalController());
  final p = Get.put(PatientPageController());
  final loadingDataPersonal = false.obs;
  var dio = Dio();
  Patient? person;
  String birthday = '';
  String age = '';

  @override
  void initState() {
    super.initState();
    checkDataPersonal();
    // if (person != null) {
    //   loadingDataPersonal.value = true;
    // }
    // print(loadingDataPersonal.value);
  }

  checkDataPersonal() async {
    try {
      person = await getPatientByRm();
      var date = DateTime.parse(person!.dateOfBirth);
      birthday = date.toSlashDate();
      age = c.yourAge(DateTime.parse(person!.dateOfBirth));
      print("AAAAAAAA");
      print(person!.agama);
      print("AAAAAAAA");
      print(loadingDataPersonal.value);
      loadingDataPersonal.value = true;
      print(loadingDataPersonal.value);
      // if (person.fname != null || person.fname != "") {
      // }
      // if (truePerson.value) {
      //   loadingDataPersonal.value = true;
      //   // Get.off(PatientCheckPage(rm: rm));
      //   // truePerson.value = false;
      // }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.black87,
      ));
      throw Exception(e.toString());
    }
    // Get.to(const PatientCheckPage());
    // loadingDataPersonal.value = false;
    // rmController.clear();
  }

  getPatientByRm() async {
    var token = c.getToken();
    final formData = FormData.fromMap({"token": token, 'rm': widget.rm});
    try {
      final response = await dio.post('${c.baseUrl}pasien_cekrm', data: formData);
      // print("=====================================");
      print(response.statusCode);
      print(response.data);
      print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        print(response.data["response"]["data"]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Hai ${response.data["response"]["data"]["fname"]} !!!"),
          backgroundColor: Colors.black87,
        ));
        // loadingDataPersonal.value = true;
        // Get.off(PatientCheckPage(rm: rm));
        return Patient.fromJson(response.data["response"]["data"]);
      } else {
        // ignore: use_build_context_synchronously
        print(response.data["response"]["message"]);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
      }
      // if (ok == "ok" && ok != null) {
      //   loadingDataPersonal.value = true;
      // }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.black87,
      ));
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => (loadingDataPersonal.value)
              ? Column(
                  children: [
                    SizedBox(
                      height:    115,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(1000)),
                      child: SizedBox(
                        width: 136,
                        height: 136,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: 
                          FadeInImage(
                            image: NetworkImage(person!.picture),
                            placeholder: const AssetImage("assets/images/img_avatar.png"),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/img_avatar.png',);
                            },
                            // fit: BoxFit.fitWidth,
                          ),
                          // Image.asset("assets/images/img_avatar.png"),
                        ),
                      ),
                    ),
                    CustomFixedForm(content: person!.rm, title: "No. Rekam Medis"),
                    CustomFixedForm(
                      content: person!.fname,
                      title: "Nama Lengkap",
                      backgroundColor: Colors.white,
                      isMust: true,
                    ),
                     const CustomFixedForm(content: "42 Tahun", title: "Usia", isMust: true,),
                     CustomFixedForm(
                            content: person!.sex,
                            title: "Jenis Kelamin",
                            backgroundColor: Colors.white,
                            isMust: true,
                          ),
                          CustomFixedForm(
                      content: person!.kota,
                      title: "Kota",
                      backgroundColor: Colors.white,
                      isMust: true,
                    ),
                    // CustomFixedForm(
                    //   content: person!.email,
                    //   title: "Email",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: CustomFixedForm(
                    //         content: birthday,
                    //         title: "Tanggal Lahir",
                    //         backgroundColor: Colors.white,
                    //         isMust: true,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: c.sw * 24,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: CustomFixedForm(
                    //         content: "$age Tahun",
                    //         title: "Usia",
                    //         isMust: true,
                    //       ),
                    //       // const CustomFixedForm(content: "42 Tahun", title: "Usia"),
                    //     )
                    //   ],
                    // ),
                    // CustomFixedForm(
                    //   content: person!.statusPasien,
                    //   title: "Status Pasien Dalam Keluarga",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: CustomFixedForm(
                    //         content: person!.sex,
                    //         title: "Jenis Kelamin",
                    //         backgroundColor: Colors.white,
                    //         isMust: true,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: c.sw * 24,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: CustomFixedForm(
                    //         content: person!.agama,
                    //         title: "Agama",
                    //         backgroundColor: Colors.white,
                    //         isMust: true,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // CustomFixedForm(
                    //   content: person!.alergi,
                    //   title: "Alergi Obat",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // CustomFixedForm(
                    //   content: person!.bloodGroup,
                    //   title: "Golongan Darah",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // CustomFixedForm(
                    //   content: person!.address,
                    //   title: "Alamat",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    //   uboundedHeight: true,
                    // ),
                    // CustomFixedForm(
                    //   content: person!.kota,
                    //   title: "Kota",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // CustomFixedForm(
                    //   content: person!.kelurahan,
                    //   title: "Kelurahan",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: CustomFixedForm(
                    //         content: person!.rw,
                    //         title: "RW",
                    //         backgroundColor: Colors.white,
                    //         isMust: true,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: c.sw * 24,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: CustomFixedForm(
                    //         content: person!.rt,
                    //         title: "RT",
                    //         backgroundColor: Colors.white,
                    //         isMust: true,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    CustomFixedForm(
                      content: person!.kecamatan,
                      title: "Kecamatan",
                      backgroundColor: Colors.white,
                      isMust: true,
                    ),
                    // CustomFixedForm(
                    //   content: person!.phone,
                    //   title: "No. Telepon (Rumah)",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // CustomFixedForm(
                    //   content: person!.mobile,
                    //   title: "No. Handphone",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    // CustomFixedForm(
                    //   content: person!.namaOrangtua,
                    //   title: "Nama Orang Tua",
                    //   backgroundColor: Colors.white,
                    //   isMust: true,
                    // ),
                    SizedBox(height:    20)
                  ],
                )
              : const CircularProgressIndicator(),
        ));
  }
}
