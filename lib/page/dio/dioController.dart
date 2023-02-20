import 'package:get/get.dart';
import 'package:starlife/models/model_post.dart';
import 'package:starlife/page/dio/dio_client.dart';

class DioController extends GetxController {
  DioClient dioClient = DioClient();
  final listPost = <Post>[].obs;

  getData() async {
    listPost.value = await dioClient.fetchPostList();
  }
}
