import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/models/model_person.dart';
import 'package:starlife/models/model_queue_check.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_page.dart';
import 'package:starlife/controllers/global_controller.dart';

class PatientPageController extends GetxController {
  var c = Get.put(GlobalController());
  final loadingDataPersonal = false.obs;
  final loadingAddNewPersonal = false.obs;
  final truePerson = false.obs;
  final loadingAppoinment = false.obs;
  Patient? person;
  ResponQueue? appointment;
  ResponQueue? scheduledAppointment;
  // Patient person = Patient(id: "", fname: "", phone: "", mobile: "", address: "", sex: "", dateOfBirth: "", createdBy: "", createDate: "", status: "", agama: "", namaOrangtua: "", kota: "", kecamatan: "", kelurahan: "", rw: "", rt: "", pin: "", upline: "", pincode: "", tipePasien: "", rm: "");
  var jenisKelamin = ''.obs;
  var dio = Dio();
  String age = '';
  String birthday = '';
  RxBool selectedPatient = false.obs;
  var selectedPatientRm = ''.obs;
  final selectedDoctor = ''.obs;
  var selectedSchedule = ''.obs;

  // @override
  // void onClose() {
  //   loadingDataPersonal.value = false;
  // }

  TextEditingController rmController = TextEditingController(text: "");
  TextEditingController namaController = TextEditingController(text: "");
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

  cekDataAppointment(BuildContext context, bool isSubmit) async {
    if (isSubmit) {
      scheduledAppointment = await checkDoctorAppointment(context, isSubmit);
    } else {
      appointment = await checkDoctorAppointment(context, isSubmit);
    }
    if (appointment != null) {
      loadingAppoinment.value = true;
      // print("SUKSES SUKSES SUKSES SUKSES SUKSES");
    }
  }

  checkDoctorAppointment(BuildContext context, bool isSubmit) async {
    var token = await c.getToken();
    final FormData formData;
    if (isSubmit) {
      formData = FormData.fromMap({
        "token": token,
        'rm': selectedPatientRm.value,
        'dokter': selectedDoctor.value,
        'tanggal': selectedSchedule.value,
        'submit': 1,
        // 'jam': selectedSchedule.value,
      });
    } else {
      formData = FormData.fromMap({
        "token": token,
        'rm': selectedPatientRm.value,
        'dokter': selectedDoctor.value,
        'tanggal': selectedSchedule.value,
        // 'jam': selectedSchedule.value,
      });
    }
    try {
      final response = await dio.post('${c.baseUrl}antriandaftar', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      print(response.data);
      // print(response.data["response"]["data"]);
      var ok = response.data["success"];
      if (ok == "ok" && ok != null) {
        return ResponQueue.fromJson(response.data["response"]["data"]);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  patientAdd(BuildContext context) async {
    var token = await c.getToken();
    bool emailTrue = c.isEmail(emailController.text);
    bool phoneTrue = c.isPhone(handphoneController.text);

    if (namaController.text.isNotEmpty && emailController.text.isNotEmpty && tanggalLahirController.text.isNotEmpty && statusController.text.isNotEmpty && jenisKelaminController.text.isNotEmpty && handphoneController.text.isNotEmpty

        // usiaController.text.isNotEmpty &&
        // agamaController.text.isNotEmpty &&
        // alergiObatController.text.isNotEmpty &&
        // alamatController.text.isNotEmpty
        ) {
      if (emailTrue) {
        if (phoneTrue) {
          var gender = '';
          if (jenisKelaminController.text == "Laki-Laki") {
            gender = "male";
            // print(gender);
          } else {
            gender = "famale";
            // print(gender);
          }
          final formData = FormData.fromMap({
            "token": token,
            'fname': namaController.text,
            'email': emailController.text,
            'date_of_birth': tanggalLahirController.text,
            'status_pasien': statusController.text,
            'sex': gender,
            'address': alamatController.text,
            'phone': handphoneController.text,
            'agama': agamaController.text,
            'alergi': alergiObatController.text,
            'blood_group': goldarController.text,
            'kelurahan': kelurahanController.text,
            'kota': kotaController.text,
            'rw': rwController.text,
            'rt': rtController.text,
            'kecamatan': kecamatanController.text,
            'mobile': teleponController.text,
            'nama_orangtua': orangtuaController.text
          });
          try {
            final response = await dio.post('${c.baseUrl}register_pasien_lanjutan', data: formData);
            // print("=====================================");
            // print(response.statusCode);
            // print(response.data);
            // print(response.data["response"]["data"]);
            var ok = response.data["response"]["data"];
            if (ok == "sukses" && ok != null) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Patient Success Added"),
                backgroundColor: Colors.black87,
              ));
              Get.to(const PatientListPage());
              clearDataEntry();
              // Get.to(const PatientListPage());
            } else {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(response.data["response"]["message"]),
                backgroundColor: Colors.black87,
              ));
            }
            return null;
          } on DioError catch (e) {
            throw Exception(e.toString());
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please fill correct "No.Handphone"'),
            backgroundColor: Colors.black87,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please fill correct "Email"'),
          backgroundColor: Colors.black87,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please Fill in the blank'),
        backgroundColor: Colors.black87,
      ));
    }
  }

  patientOneWayAdd(BuildContext context) async {
    var token = await c.getToken();
    if (namaController.text.isNotEmpty) {
      if (jenisKelaminController.text.isNotEmpty) {
        var gender = '';
        if (jenisKelaminController.text == "Laki-Laki") {
          gender = "male";
          // print(gender);
        } else {
          gender = "famale";
          // print(gender);
        }
        final formData = FormData.fromMap({"token": token, 'fname': namaController.text, 'sex': gender, 'address': alamatController.text, 'date_of_birth': tanggalLahirController.text});
        try {
          final response = await dio.post('${c.baseUrl}register_pasien_sekalijalan', data: formData);
          // print("=====================================");
          // print(response.statusCode);
          // print(response.data);
          // print(response.data["response"]["data"]);
          var ok = response.data["response"]["data"];
          if (ok == "sukses" && ok != null) {
            Get.off(const PatientListPage());
            clearDataEntry();
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(response.data["response"]["message"]),
              backgroundColor: Colors.black87,
            ));
          }
          return null;
        } on DioError catch (e) {
          throw Exception(e.toString());
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Choose Your Gender'),
          backgroundColor: Colors.black87,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Name Field Cannot Be Empty'),
        backgroundColor: Colors.black87,
      ));
    }

    // Get.to(const PatientListPage());
  }

  addNewPatientByRm(BuildContext context, String rm) async {
    var token = await c.getToken();
    try {
      final formData = FormData.fromMap({
        "token": token,
        'rm': rm,
        'submit': "1",
      });
      final response = await dio.post('${c.baseUrl}pasien_cekrm', data: formData);
      // print(response.statusCode);
      // print(response.data);
      // print(response.data["success"]);
      var ok = response.data["response"]["data"];
      if (ok == "ok" && ok != null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["data"]),
          backgroundColor: Colors.black87,
        ));
        loadingAddNewPersonal.value = true;
        // Get.to(const PatientListMainPage());
        // if(loadingAddNewPersonal.value){
        Timer(const Duration(seconds: 1), () {
          // print("Yeah, this line is printed after 3 seconds");
          Get.off(const PatientListPage());
        });
        // }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
      }
      if (loadingAddNewPersonal.value == true) {
        Timer(const Duration(seconds: 1), () {
          // print("Yeah, this line is printed after 3 seconds");
          Get.off(const PatientListPage());
        });
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.black87,
      ));
      throw Exception(e.toString());
    }
  }

  // checkDataPersonal(BuildContext context, String rm) async {
  //   try{
  //     person = await getPatientByRm(context);
  //     // var date = DateTime.parse(person.dateOfBirth);
  //     // birthday = date.toSlashDate();
  //     // age = c.yourAge(DateTime.parse(person.dateOfBirth));
  //     // if(truePerson.value){
  //     //   loadingDataPersonal.value = true;
  //     //   // Get.off(PatientCheckPage(rm: rm));
  //     //   // truePerson.value = false;
  //     // }
  //   }catch (e){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(e.toString()),
  //       backgroundColor: Colors.black87,
  //     ));
  //     throw Exception(e.toString());
  //   }
  //   // Get.to(const PatientCheckPage());
  //   // loadingDataPersonal.value = false;
  //   // rmController.clear();
  // }
  clearDataEntry() {
    rmController = TextEditingController(text: "");
    namaController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    tanggalLahirController = TextEditingController(text: "");
    usiaController = TextEditingController(text: "");
    statusController = TextEditingController(text: "");
    jenisKelaminController = TextEditingController(text: "");
    agamaController = TextEditingController(text: "");
    alergiObatController = TextEditingController(text: "");
    goldarController = TextEditingController(text: "");
    alamatController = TextEditingController(text: "");
    kotaController = TextEditingController(text: "");
    kelurahanController = TextEditingController(text: "");
    rtController = TextEditingController(text: "");
    rwController = TextEditingController(text: "");
    kecamatanController = TextEditingController(text: "");
    teleponController = TextEditingController(text: "");
    handphoneController = TextEditingController(text: "");
    orangtuaController = TextEditingController(text: "");
  }

  getPatientByRm(BuildContext context, String rm) async {
    var token = await c.getToken();
    final formData = FormData.fromMap({"token": token, 'rm': rmController.text});
    try {
      final response = await dio.post('${c.baseUrl}pasien_cekrm', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      // print(response.data);
      // print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        // print(response.data["response"]["data"]);
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text("Hai ${response.data["response"]["data"]["fname"]} !!!"),
        //   backgroundColor: Colors.black87,
        // ));

        // loadingDataPersonal.value = true;
        Get.to(() => PatientCheckPage(rm: rm),
            arguments: [
              {"Details": ""}
            ],
            preventDuplicates: false);
        // Get.to(PatientCheckPage(rm: rm));

        // return Patient.fromJson(response.data["response"]["data"]);
      } else {
        // ignore: use_build_context_synchronously
        // print(response.data["response"]["message"]);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
      }
      // if(ok == "ok" && ok != null){
      //   truePerson.value = true;
      // }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.black87,
      ));
      throw Exception(e.toString());
    }
  }
}
