import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/models/model_detail_medical_record.dart';
import 'package:starlife/models/model_medical_record.dart';
import 'package:starlife/controllers/global_controller.dart';

class CheckRmController extends GetxController {
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  final medicalRecords = <MedicalRecord>[].obs;
  // final detailMedicalRecords = <DetailMedicalRecord>[].obs;
  DetailMedicalRecord? detailMedicalRecord;
  final loadingDataMedicalRecord = false.obs;
  final loadingDetailMedicalRecord = false.obs;
  final patientRm = ''.obs;
  final idMedicalRecord = ''.obs;

  // Fungsi untuk memanggil fungsi getDetailMedicalRecord dan mengubah status loadingDetailMedicalRecord
  getDetailDataMedicalRecord(BuildContext context) async {
    loadingDetailMedicalRecord.value = false;
    detailMedicalRecord = await getDetailMedicalRecord(context);
    loadingDetailMedicalRecord.value = true;
  }

  // Fungsi untuk mendapatkan Detail Medical Record daripada user.
  getDetailMedicalRecord(BuildContext context) async {
    var token = await c.getToken();
    // print(token);
    // print(patientRm.value);
    // print(idMedicalRecord.value);
    final formData = FormData.fromMap({'token': token, 'rm': patientRm.value, "id": idMedicalRecord.value});
    try {
      final response = await dio.post('${c.baseUrl}list_pasien_rekammedis_detail', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      // print(response.data["response"]["data"]);
      // print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        var data = response.data["response"] as Map<String, dynamic>;
        // print(response.data["response"]["data"]);
        return DetailMedicalRecord.fromJson(data["data"]);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: const Color.fromARGB(221, 33, 32, 32),
        ));
        // print(response.data["response"]["message"]);
      }
      // return response.data["response"]["message"];
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  // Fungsi untuk memanggil fungsi getMedicalRecords dan mengubah status loadingDataMedicalRecord
  getDataMedicalRecords(BuildContext context) async {
    loadingDataMedicalRecord.value = false;
    // print("AAAAAAAAAAAAAAAAAAa");
    medicalRecords.value = await getMedicalRecords(context);
    // print("AAAAAAAAAAAAAAAAAAa");
    loadingDataMedicalRecord.value = true;
    // var date = DateTime.parse(person!.dateOfBirth);
    // birthday = date.toSlashDate();
    // age = c.yourAge(DateTime.parse(person!.dateOfBirth));
    // loadingDataMedicalRecord.value = true;
  }

  // Fungsi untuk mendapatkan Daftar / List Medical record yang pernah dijalankan pada device user.
  getMedicalRecords(BuildContext context) async {
    var token = await c.getToken();
    // print(token);
    // print(patientRm.value);
    final formData = FormData.fromMap({'token': token, 'rm': patientRm.value});
    try {
      final response = await dio.post('${c.baseUrl}list_pasien_rekammedis', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      // print(response.data["response"]);
      // print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        var data = response.data as Map<String, dynamic>;
        // print(response.data["response"]["data"]);
        return MedicalRecord.listFromJson(data["response"]);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["response"]["message"]),
          backgroundColor: Colors.black87,
        ));
        // print(response.data["response"]["message"]);
      }
      // return response.data["response"]["message"];
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
