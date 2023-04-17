import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/models/model_news.dart';
import 'package:starlife/models/model_patient_queue.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/models/model_poli.dart';

class HomeController extends GetxController {
  // DioClient dioClient = DioClient();
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  final listDoctors = <Doctor>[].obs;
  final listNews = <News>[].obs;
  final listPoli = <Poli>[].obs;
  final listPatientQueue = <PatientQueue>[].obs;
  final loadingPoliData = false.obs;
  final loadingDoctorData = false.obs;
  final loadingNewsData = false.obs;
  final loadingPatientQueueData = false.obs;
  final morningShcedule = ''.obs;
  final nightSchedule = ''.obs;
  final selectedDate = ''.obs;
  final selectedDepartment = ''.obs;
  final selectedPoli = ''.obs;

  // Fungsi untuk mengambil data list dokter berdasarkan poli
  getListDoctorByPoli() async {
    loadingDoctorData.value = false;
    final formData = FormData.fromMap({'id': selectedDepartment.value});
    try {
      final response = await dio.get("${c.baseUrl}dokterpoli", data: formData);
      if (response.data["response"][0] != null) {
        var data = response.data as Map<String, dynamic>;
        listDoctors.value = Doctor.listFromJson(data['response']);
        loadingDoctorData.value = true;
      }
      // print(response.data["response"].toString());
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  // Fungsi untuk mengambil data list poli
  getPoli() async {
    loadingPoliData.value = false;
    try {
      final response = await dio.get("${c.baseUrl}poli");
      if (response.data["response"][0] != null) {
        var data = response.data as Map<String, dynamic>;
        listPoli.value = Poli.listFromJson(data['response']);
        loadingPoliData.value = true;
      }
      // print(response.data["response"].toString());
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  // Fungsi untuk memanggil fungsi getDataNews.
  getDataNews() async {
    await getNews();
  }

  // Fungsi untuk mengambil daftar atau list data berita.
  getNews() async {
    loadingNewsData.value = false;
    try {
      final response = await dio.get("${c.baseUrl}berita");
      if (response.data["response"][0] != null) {
        var data = response.data as Map<String, dynamic>;
        listNews.value = News.listFromJson(data['response']);
        loadingNewsData.value = true;
      }
      // var data = response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  // Fungsi untuk memanggil fungsi getDoctors.
  getDataDoctors() async {
    await getDoctors();
  }

  // Fungsi untuk mengambil daftar atau list semua dokter.
  getDoctors() async {
    loadingDoctorData.value = false;
    try {
      final response = await dio.get("${c.baseUrl}dokter");
      if (response.data["response"][0] != null) {
        var data = response.data as Map<String, dynamic>;
        listDoctors.value = Doctor.listFromJson(data['response']);
        loadingDoctorData.value = true;
      }
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  // Fungsi untuk memanggil fungsi getDataScheduleDoctors()
  getDataScheduleDoctors() async {
    await getSchedule();
  }

  // Fungsi untuk mengambil data schedule dokter berdasarkan tanggal dan poli
  getSchedule() async {
    loadingDoctorData.value = false;
    var token = await c.getToken();
    // print(token);
    print(selectedDate.value);
    print(selectedDepartment.value);
    final formData = FormData.fromMap({'token': token, 'tanggal': selectedDate.value, 'poli': selectedDepartment.value});
    try {
      final response = await dio.post("${c.baseUrl}dokter_tanggal_poli", data: formData);
      // final response = await dio.get("${c.baseUrl}dokter_tanggal_poli");
      // print("=======");
      // print(response);
      print("=======");
      print(response.data["response"][0]);
      if (response.data["response"][0] != null) {
        print("DATA TIDAK KOSONG");
        var data = response.data as Map<String, dynamic>;
        listDoctors.value = Doctor.listFromJson(data['response']);
        loadingDoctorData.value = true;
      } else {
        print("DATA KOSONG");
      }
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  // Fungsi untuk memanggil fungsi getPatientQueue()
  getDataPatientQueue() async {
    loadingPatientQueueData.value = false;
    await getPatientQueue();
    if (listPatientQueue.isNotEmpty) {
      loadingPatientQueueData.value = true;
    }
    // print(listPatientQueue[0].doctorId);
    // print("=======================");
  }

  // Fungsi untuk mengambil data antrian pasien yang telah dibuat.
  getPatientQueue() async {
    var token = await c.getToken();
    final formData = FormData.fromMap({
      'token': token,
    });
    try {
      final response = await dio.post("${c.baseUrl}antrianlisting", data: formData);
      // print(response.data["response"].toString());
      // print(response.data["success"].toString());
      // print(response.data["response"]["message"].toString());
      var ok = response.data["success"].toString();
      if (ok == "ok") {
        // return PatientQueue.listFromJson(data["response"] as List);
        listPatientQueue.value = PatientQueue.listFromJson(response.data["response"]);
      }
      // var data = response.data as Map<String, dynamic>;
      // return PatientQueue.listFromJson(data["response"] as List);
      // return PatientQueue.listFromJson(response.data["response"]);
      // return PatientQueue.listFromJson(response.data["response"]["data"] as List);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }
}
