import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/models/model_news.dart';
import 'package:starlife/models/model_patient_queue.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/dio/dio_client.dart';

class HomeController extends GetxController {
  DioClient dioClient = DioClient();
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  final listDoctors = <Doctor>[].obs;
  final listNews = <News>[].obs;
  final listPatientQueue = <PatientQueue>[].obs;
  final loadingDoctorData = false.obs;
  final loadingNewsData = false.obs;
  final loadingPatientQueueData = false.obs;
  final morningShcedule = ''.obs;
  final nightSchedule = ''.obs;
  final selectedDate = ''.obs;
  final selectedDepartment = ''.obs;

  getDataNews() async {
    listNews.value = await getNews();
    loadingNewsData.value = true;
    // print(listNews[0].title);
  }

  getNews() async {
    try {
      final response = await dio.get("${c.baseUrl}berita");
      // print(response.data["response"].toString());
      var data = response.data as Map<String, dynamic>;
      return News.listFromJson(data['response']);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  getDataDoctors() async {
    // loadingDoctorData.value = false;
    listDoctors.value = await getDoctors();
    loadingDoctorData.value = true;
    // print(listDoctors[0].address);
  }

  getDoctors() async {
    // var token = c.getToken();

    // final formData = FormData.fromMap({'token': token, 'tanggal': token, 'poli': token});
    try {
      final response = await dio.get("${c.baseUrl}dokter");
      // final response = await dio.get("${c.baseUrl}dokter_tanggal_poli");
      // print(response.data["response"].toString());
      var data = response.data as Map<String, dynamic>;
      return Doctor.listFromJson(data['response']);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  getDataScheduleDoctors() async {
    // listDoctors.value = [];
    // loadingDoctorData.value = false;
    listDoctors.value = await getSchedule();
    loadingDoctorData.value = true;
    // print(listDoctors[0].address);
  }

  getSchedule() async {
    var token = c.getToken();
    // print(token);
    print(selectedDate.value);
    print(selectedDepartment.value);
    final formData = FormData.fromMap({'token': token, 'tanggal': selectedDate.value, 'poli': selectedDepartment.value});
    try {
      final response = await dio.post("${c.baseUrl}dokter_tanggal_poli", data: formData);
      // final response = await dio.get("${c.baseUrl}dokter_tanggal_poli");
      print(response.data["response"]);
      // if (response.data["response"] == null || response.data["response"] == []) {
      //   print("Tidak ada jadwal dokter");
      // }
      var data = response.data as Map<String, dynamic>;
      return Doctor.listFromJson(data['response']);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  getDataPatientQueue() async {
    loadingPatientQueueData.value = false;
    listPatientQueue.value = await getPatientQueue();
    loadingPatientQueueData.value = true;
    // print(listPatientQueue[0].doctorId);
    // print("=======================");
  }

  getPatientQueue() async {
    var token = c.getToken();
    final formData = FormData.fromMap({
      'token': token,
    });
    try {
      final response = await dio.post("${c.baseUrl}antrianlisting", data: formData);
      print(response.data["response"].toString());
      // var data = response.data as Map<String, dynamic>;
      // return PatientQueue.listFromJson(data["response"] as List);
      return PatientQueue.listFromJson(response.data["response"]);
      // return PatientQueue.listFromJson(response.data["response"]["data"] as List);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }
}
