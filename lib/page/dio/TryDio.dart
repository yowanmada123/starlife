import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/dio/dioController.dart';
import 'package:starlife/page/dio/dio_client.dart';

class TryDioPage extends StatefulWidget {
  const TryDioPage({super.key});

  @override
  State<TryDioPage> createState() => _TryDioPageState();
}

class _TryDioPageState extends State<TryDioPage> {
  final dC = Get.put(DioController());
  final loading = true.obs;
  // Future<Post>? post;
  // Future<List<Post>>? posts;
  // final listPost = <Post>[].obs;
  
  @override
  void initState() {
    super.initState();
    dC.getData();
    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trying With Dio"),
      ),
      body: SafeArea(
          child: Obx(() => Container(
                child: (loading.value)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                      height: Get.height,
                      child: ListView.builder(
                        itemCount: dC.listPost.length,
                        itemBuilder: (context, index) => 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dC.listPost[index].title, textAlign: TextAlign.left,),
                              const SizedBox(height: 10,)
                            ],
                          ),
                      ),
                    ),
              ))),
    );
  }
}
