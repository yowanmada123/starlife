import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_doctor.dart';
import 'package:starlife/models/model_news.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/page/dio/dio_client.dart';

class HomeController extends GetxController {
  DioClient dioClient = DioClient();
  var c = Get.put(GlobalController());
  final Dio dio = Dio();
  final listDoctors = <Doctor>[].obs;
  final listNews = <News>[].obs;
  final loadingDoctorData = false.obs;
  final loadingNewsData = false.obs;
  final morningShcedule = ''.obs;
  final nightSchedule = ''.obs;
  // final

  getDataNews() async {
    listNews.value = await getNews();
    loadingNewsData.value = true;
    print(listNews[0].title);
  }

  getNews() async {
    try {
      final response = await dio.get("${c.baseUrl}berita");
      print(response.data["response"].toString());
      var data = response.data as Map<String, dynamic>;
      return News.listFromJson(data['response']);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }

  getDataDoctors() async {
    listDoctors.value = await getDoctors();
    loadingDoctorData.value = true;
    print(listDoctors[0].address);
  }

  getDoctors() async {
    try {
      final response = await dio.get("${c.baseUrl}dokter");
      print(response.data["response"].toString());
      var data = response.data as Map<String, dynamic>;
      return Doctor.listFromJson(data['response']);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts");
    }
  }
}
