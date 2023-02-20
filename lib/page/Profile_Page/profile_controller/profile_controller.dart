import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/extention/ext_date.dart';

class ProfileController extends GetxController {
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  late Patient person;
  final loading = false.obs;
  final loadingPatientsData = false.obs;
  String age = '';
  String birthday = '';
  final patients = <Patient>[].obs;

  @override
  void onClose() {
    loading.value = false;
    loadingPatientsData.value = false;
  }

  getDataPersonal() async {
    person = await getPersonalData();
    var date = DateTime.parse(person.dateOfBirth as String);
    birthday = date.toSlashDate();
    age = c.yourAge(DateTime.parse(person.dateOfBirth as String));
    loading.value = true;
  }

  Future<Patient> getPersonalData() async {
    var token = c.getToken();
    final formData = FormData.fromMap({
      'token': token,
    });
    try {
      final response = await dio.post('${c.baseUrl}pasien', data: formData);
      // print("=====================================");
      print(response.statusCode);
      // print(response.data);
      print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        print(response.data["response"]["data"]);
      } else {
        // ignore: use_build_context_synchronously
        print(response.data["response"]["message"]);
      }
      return Patient.fromJson(response.data["response"]["data"]);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  getPatients() async {
    patients.value = await getListPatientData();
    var date = DateTime.parse(person.dateOfBirth as String);
    birthday = date.toSlashDate();
    loadingPatientsData.value = true;
    print(patients.length);
    print(patients[0].fname);
  }

  getListPatientData() async {
    var token = c.getToken();
    // var data;
    final formData = FormData.fromMap({
      'token': token,
    });
    try {
      final response = await dio.post('${c.baseUrl}list_pasien', data: formData);
      // print("=====================================");
      print(response.statusCode);
      // print(response.data);
      print(response.data["success"]);
      var ok = response.data?["success"];
      if (ok == "ok" && ok != null) {
        print(response.data["response"]);
        var data = response.data as Map<String, dynamic>;
        return Patient.listFromJson(data["response"]);
      } else {
        // ignore: use_build_context_synchronously
        print(response.data["response"]["message"]);
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
