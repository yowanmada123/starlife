import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:starlife/models/model_detail_medical_record.dart';
import 'package:starlife/models/model_medical_record.dart';
import 'package:starlife/page/global_controller.dart';

class CheckRmController extends GetxController {
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  final medicalRecords = <MedicalRecord>[].obs;
  // final detailMedicalRecords = <DetailMedicalRecord>[].obs;
  DetailMedicalRecord? detailMedicalRecords;
  final loadingDataMedicalRecord = false.obs;
  final loadingDetailMedicalRecord = false.obs;
  final patientRm = ''.obs;
  final idMedicalRecord = ''.obs;

  getDetailDataMedicalRecord(BuildContext context) async {
    loadingDetailMedicalRecord.value = false;
    detailMedicalRecords = await getDetailMedicalRecord(context);
    loadingDetailMedicalRecord.value = true;
  }

  getDetailMedicalRecord(BuildContext context) async {
    var token = c.getToken();
    print(token);
    print(patientRm.value);
    print(idMedicalRecord.value);
    final formData = FormData.fromMap({'token': token, 'rm': patientRm.value, "id": idMedicalRecord.value});
    try {
      final response = await dio.post('${c.baseUrl}list_pasien_rekammedis_detail', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      print(response.data["response"]["data"]);
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
          backgroundColor: Color.fromARGB(221, 33, 32, 32),
        ));
        print(response.data["response"]["message"]);
      }
      // return response.data["response"]["message"];
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

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

  getMedicalRecords(BuildContext context) async {
    var token = c.getToken();
    print(token);
    print(patientRm.value);
    final formData = FormData.fromMap({'token': token, 'rm': patientRm.value});
    try {
      final response = await dio.post('${c.baseUrl}list_pasien_rekammedis', data: formData);
      // print("=====================================");
      // print(response.statusCode);
      print(response.data["response"]);
      print(response.data["success"]);
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
        print(response.data["response"]["message"]);
      }
      // return response.data["response"]["message"];
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
