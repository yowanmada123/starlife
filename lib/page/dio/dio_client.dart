// import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_post.dart';
import 'package:starlife/page/dio/dioController.dart';

class DioClient {
  
  final Dio dio = Dio();
  static const baseUrl = "https://jsonplaceholder.typicode.com";
  static const postEndpoint = "$baseUrl/posts";

  Future<Post> fetchPost(int postId) async {
    try {
      final response = await dio.get("$postEndpoint/$postId");
      // final response = await dio.get(postEndpoint, queryParameters: {"id" : postId});

      // final response = await dio.get(postsEndpoint + "/posts");

      print(response.toString());
      return Post.fromJson(response.data);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load post: $postId"); 
    }
  }

  Future <List<Post>> fetchPostList() async {
    try {
      final response = await dio.get(postEndpoint);
      // final response = await dio.get(postEndpoint, queryParameters: {"id" : postId});
      
      // final response = await dio.get(postsEndpoint + "/posts");

      print(response.toString());
      return Post.listFromJson(response.data);
    } on DioError catch (e) {
      print("Status code : ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load posts"); 
    }
  }
}
