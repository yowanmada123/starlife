import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/controllers/patient_page_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/extention/ext_date.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ProfileController extends GetxController {
  var c = Get.put(GlobalController());
  var p = Get.put(PatientPageController());
  final Dio dio = Dio();
  Patient? person;
  // Patient? person1;
  // Patient person = Patient(id: "", fname: "", phone: "", mobile: "", address: "", sex: "", dateOfBirth: "", createdBy: "", createDate: "", status: "", agama: "", namaOrangtua: "", kota: "", kecamatan: "", kelurahan: "", rw: "", rt: "", pin: "", upline: "", pincode: "", tipePasien: "", rm: "");
  final loadingPersonal = false.obs;
  final loadingPatientsData = false.obs;
  String age = '';
  String birthday = '';
  String statusPasien = '';
  String createDate = '';
  var pincode = ''.obs;
  var filePhoto;
  final patients = <Patient>[].obs;

  TextEditingController namaController = TextEditingController(text: "");
  TextEditingController rmController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController tanggalLahirController = TextEditingController(text: "");
  TextEditingController usiaController = TextEditingController(text: "");
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
  TextEditingController pinLamaController = TextEditingController(text: "");
  TextEditingController pinBaruController = TextEditingController(text: "");

  @override
  void onClose() {
    // loadingPersonal.value = false;
    loadingPatientsData.value = false;
    // person = Patient(id: "", fname: "", phone: "", mobile: "", address: "", sex: "", dateOfBirth: "", createdBy: "", createDate: "", status: "", agama: "", namaOrangtua: "", kota: "", kecamatan: "", kelurahan: "", rw: "", rt: "", pin: "", upline: "", pincode: "", tipePasien: "", rm: "");
  }

  updateImageProfile() async {
    var token = await c.getToken();
    FormData formData = FormData.fromMap({
      'token': token,
      'image': await MultipartFile.fromFile(filePhoto.path),
    });
    try {
      var response = await Dio().post('${c.baseUrl}pasien_update_profile_picture', data: formData);

      // print(response.data["success"]);
      return response.data["success"].toString();
    } on DioError catch (e) {
      Get.snackbar("Upload Fail", e.toString());
      throw Exception(e.toString());
    }
  }

  updateProfile(BuildContext context) async {
    var token = await c.getToken();
    String uploadDone = await updateImageProfile();
    final formData = FormData.fromMap({
      'token': token,
      'fname': namaController.text,
      'email': emailController.text,
      'pincode': pincode.value,
      'date_of_birth': tanggalLahirController.text,
      'status_pasien': statusController.text,
      'sex': jenisKelaminController.text,
      'agama': agamaController.text,
      'alergi': alergiObatController.text,
      'blood_group': goldarController.text,
      'address': alamatController.text,
      'kota': kotaController.text,
      'kelurahan': kelurahanController.text,
      'rw': rwController.text,
      'rt': rtController.text,
      'kecamatan': kecamatanController.text,
      'mobile': teleponController.text,
      'phone': handphoneController.text,
      'nama_orangtua': orangtuaController.text,
    });

    try {
      final response = await dio.post('${c.baseUrl}pasien_update_data', data: formData);
      var ok = response.data?["success"];
      print(response);
      if (ok == "ok" && ok != null) {
        Get.snackbar("Success", "Update Success");
        Get.close(3);
      } else {
        Get.snackbar("Error", "${response.data["response"]["message"]}");
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  changePIN() async {
    // print(pinLamaController.text);
    // print(pinBaruController.text);
    var token = await c.getToken();
    final formData = FormData.fromMap({
      'token': token,
      'pinlama': pinLamaController.text,
      'pinbaru': pinBaruController.text,
    });
    try {
      final response = await dio.post('${c.baseUrl}pasien_update_pinbaru', data: formData);
      // print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        return "ok";
      } else {
        // ignore: use_build_context_synchronously
        // print(response.data["response"]["message"]);
      }
      // return response.data["response"]["message"];
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  getDataPersonal() async {
    loadingPersonal.value = false;
    var token = await c.getToken();
    if (token != null) {
      await getPersonalData();
      var date = DateTime.parse(person!.dateOfBirth);
      birthday = date.toSlashDate();
      age = c.yourAge(DateTime.parse(person!.dateOfBirth));
      date = DateTime.parse(person!.createDate);
      createDate = date.toSlashDate();
      loadingPersonal.value = true;
    }
    // if (person != null) {

    // }
    // print(loadingPersonal.value);
    // print("===============");
    // print(loadingPersonal.value);
    // print("===============");
    // print(token);
  }

  getPersonalData() async {
    var token = await c.getToken();
    // print("AAAAA");
    // print(token);
    final formData = FormData.fromMap({
      'token': token,
    });
    try {
      final response = await dio.post('${c.baseUrl}pasien', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      // print(response.data);
      // print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        // print(response.data["response"]["data"]);
        person = Patient.fromJson(response.data["response"]["data"]);
      } else {
        // ignore: use_build_context_synchronously
        // print(response.data["response"]["message"]);
      }
      // return response.data["response"]["message"];
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  getPatients() async {
    patients.value = await getListPatientData();
    var date = DateTime.parse(person!.dateOfBirth);
    birthday = date.toSlashDate();
    loadingPatientsData.value = true;
    p.loadingAddNewPersonal.value = true;
    // print(patients.length);
    // print(patients[1].pincode);
  }

  getListPatientData() async {
    var token = await c.getToken();
    // var data;
    final formData = FormData.fromMap({
      'token': token,
    });
    try {
      final response = await dio.post('${c.baseUrl}list_pasien', data: formData);
      // print("=====================================");
      // print('${c.baseUrl}list_pasien');
      // print("=====================================");
      // print(response.statusCode);
      // print(response.data);
      // print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        // print(response.data["response"]);
        var data = response.data as Map<String, dynamic>;
        return Patient.listFromJson(data["response"]);
      } else {
        // ignore: use_build_context_synchronously
        // print(response.data["response"]["message"]);
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  void getPDF() async {
    var r = await rootBundle.load("assets/fonts/Poppins-Regular.ttf");
    var m = await rootBundle.load("assets/fonts/Poppins-Medium.ttf");
    var b = await rootBundle.load("assets/fonts/Poppins-Bold.ttf");
    var regularFont = pw.Font.ttf(r);
    var mediumFont = pw.Font.ttf(m);
    var boldFont = pw.Font.ttf(b);
    final pdf = pw.Document();
    var dataImage = await rootBundle.load("assets/icon/ic_logo.png");
    var logo = dataImage.buffer.asUint8List();
    dataImage = await rootBundle.load("assets/images/bg_bottomRight.png");
    var bottomRight = dataImage.buffer.asUint8List();
    dataImage = await rootBundle.load("assets/images/bg_topLeft.png");
    var topLeft = dataImage.buffer.asUint8List();
    dataImage = await rootBundle.load("assets/icon/ic_qr_code.JPG");
    var qr = dataImage.buffer.asUint8List();
    // "assets/icon/ic_qr_code.JPG"
    // buat pages
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            frontCard(logo, bottomRight, topLeft, regularFont, mediumFont, boldFont),
            pw.SizedBox(height: 50),
            backCard(logo, qr, bottomRight, topLeft, regularFont, mediumFont, boldFont)
            // frontCard(logo, bottomRight, topLeft),
          ]);
        })); // Page
    // simpan
    Uint8List bytes = await pdf.save();
    //buat file kosong di directori
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/Patient_Card.pdf');
    // timpa file yang sebelumnya kosong dengan file pdf kita
    await file.writeAsBytes(bytes);
    // open file pdf
    await OpenFile.open(file.path);
    // await getDownloadsDirectory()
  }

  backCard(Uint8List logo, Uint8List qr, Uint8List bottomRight, Uint8List topLeft, Font regularFont, Font mediumFont, Font boldFont) {
    return pw.SizedBox(
      child: pw.Stack(children: [
        pw.Container(
            height: 194,
            width: Get.width,
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              borderRadius: pw.BorderRadius.circular(10),
            ),
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(30.0),
              child: pw.Center(child: pw.Image(pw.MemoryImage(qr))
                  // Image.asset("assets/icon/ic_qr_code.JPG"),
                  ),
            )),
        pw.Positioned(
          top: 0,
          right: 0,
          child: pw.Container(width: 38, height: 38, child: pw.Image(pw.MemoryImage(logo))),
        ),
        // Image.asset(
        //   "assets/icon/ic_logo.png",
        // )),
        pw.Positioned(bottom: 0, right: 0, child: pw.ClipRRect(horizontalRadius: 10, verticalRadius: 10, child: pw.Image(pw.MemoryImage(bottomRight)))

            // Image.asset("assets/images/bg_bottomRight.png"))
            ),
        pw.Positioned(
            top: 0,
            left: 0,
            child: pw.Container(width: 70, height: 100, child: pw.ClipRRect(horizontalRadius: 10, verticalRadius: 10, child: pw.Image(pw.MemoryImage(topLeft)))
                // Image.asset(
                //   "assets/images/bg_topLeft.png",
                // ))
                ))
      ]),
    );
  }

  frontCard(Uint8List logo, Uint8List bottomRight, Uint8List topLeft, Font regularFont, Font mediumFont, Font boldFont) {
    return pw.SizedBox(
      child: pw.Stack(children: [
        pw.Container(
          height: 194,
          width: Get.width,
          decoration: pw.BoxDecoration(color: PdfColors.white, borderRadius: pw.BorderRadius.circular(10), border: pw.Border.all(color: PdfColors.grey300)),
          child: pw.Column(
            children: [
              pw.SizedBox(
                height: 17,
              ),
              pw.Text(
                "Kartu Pasien Klinik Starlife",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: boldFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 14, fontWeight: pw.FontWeight.bold),
                // style: pw.GoogleFonts.poppins(color: PdfColor.fromInt(0xff15577A),fontSize: 14, fontWeight: FontWeight.w400),
              ),
              pw.Text(
                "Kartu pasien ini diberikan kepada :",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: regularFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 10),
              ),
              pw.SizedBox(
                height: 13,
              ),
              pw.Stack(children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      width: 250,
                      height: 60,
                      foregroundDecoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(10),
                        gradient: const pw.LinearGradient(
                          begin: pw.Alignment.centerLeft,
                          end: pw.Alignment.centerRight,
                          colors: [
                            PdfColor.fromInt(0xff5CC7AC),
                            PdfColor.fromInt(0xff8DCCA2),
                            // const Color(0xff8DCCA2).withOpacity(0.5),
                            PdfColor.fromInt(0xfffcbd395),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(person!.fname,
                        // "SARAH CELESTIA BELLA",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            // font: ttf,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white)),
                    pw.SizedBox(
                      height: 4,
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 50),
                      child: pw.Container(
                        height: 1,
                        decoration: const pw.BoxDecoration(
                            border: pw.Border(
                                bottom: pw.BorderSide(
                          color: PdfColors.white,
                        ))),
                      ),
                    ),
                    pw.SizedBox(
                      height: 4,
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      width: 250,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Text(
                                "No. RM",
                                textAlign: TextAlign.center,
                                style: pw.TextStyle(font: regularFont, color: PdfColors.white, fontSize: 10, fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                person!.rm,
                                textAlign: TextAlign.center,
                                style: pw.TextStyle(
                                    font: regularFont,
                                    // font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ],
                          ),
                          pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Text(
                                "Tanggal Lahir",
                                textAlign: TextAlign.center,
                                style: pw.TextStyle(font: regularFont, color: PdfColors.white, fontSize: 10, fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                birthday,
                                textAlign: TextAlign.center,
                                style: pw.TextStyle(font: regularFont, color: PdfColors.white, fontSize: 10, fontWeight: pw.FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              pw.Column(children: [
                pw.SizedBox(
                  height: 12,
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Alamat",
                          style: pw.TextStyle(font: regularFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 8, fontWeight: pw.FontWeight.bold),
                        ),
                        //   style: pw.TextStyle(color: Color(0xff15577A)),
                        // ).p8r(),
                        pw.SizedBox(
                          width: 140,
                          child: pw.Text(
                            person!.address,
                            // "Ruko City Pride (Palacio) B23 Lt. 1Jl. Nginden Semolo 42 Surabaya",
                            textAlign: TextAlign.left,
                            // style: pw.TextStyle(color: Color(0xff15577A)),
                            style: pw.TextStyle(
                                font: regularFont,
                                // font: ttf,
                                color: const PdfColor.fromInt(0xff15577A),
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold),
                          ),

                          // ).p8r(),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      width: 3,
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "No. Telp",
                          style: pw.TextStyle(font: regularFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 8, fontWeight: pw.FontWeight.bold),
                        ),

                        // ).p8r(),

                        //   style: pw.TextStyle(color: Color(0xff15577A)),
                        // ).p8r(),
                        pw.Text(
                          person!.phone,
                          // "0895522091349",
                          textAlign: TextAlign.left,
                          style: pw.TextStyle(font: regularFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 8, fontWeight: pw.FontWeight.bold),
                        ),

                        //   style: pw.TextStyle(color: Color(0xff15577A)),
                        // ).p8r(),
                      ],
                    ),
                    pw.SizedBox(
                      width: 5,
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Terdaftar Sejak",
                          style: pw.TextStyle(font: regularFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 8, fontWeight: pw.FontWeight.bold),
                        ),

                        // style: pw.TextStyle(color: Color(0xff15577A)),
                        // ).p8r(),
                        pw.Text(
                          createDate,
                          // "10/12/2022",
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(font: regularFont, color: const PdfColor.fromInt(0xff15577A), fontSize: 8, fontWeight: pw.FontWeight.bold),
                        ),

                        // style: pw.TextStyle(color: Color(0xff15577A)),
                        // ).p8r(),
                      ],
                    )
                  ],
                )
              ])
            ],
          ),
        ),
        pw.Positioned(
            top: 0,
            right: 0,
            child: pw.Container(width: 38, height: 38, child: pw.Image(pw.MemoryImage(logo))
                // Image.asset(
                //   "assets/icon/ic_logo.png",
                // )
                )),
        pw.Positioned(
            bottom: 0,
            right: 0,
            child: pw.ClipRRect(
                horizontalRadius: 10,
                verticalRadius: 10,
                // borderRadius: const BorderRadius.all(Radius.circular(10)),
                // child: Image.asset("assets/images/bg_bottomRight.png")
                child: pw.Image(pw.MemoryImage(bottomRight)))),
        pw.Positioned(
            top: 0,
            left: 0,
            child: pw.ClipRRect(
                horizontalRadius: 10,
                verticalRadius: 10,
                // borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: pw.Image(pw.MemoryImage(topLeft))

                // child: Image.asset(
                //   "assets/images/bg_topLeft.png",
                //   width:   70,
                //   height: 100,
                // )
                ))
      ]),
    );
  }
}
