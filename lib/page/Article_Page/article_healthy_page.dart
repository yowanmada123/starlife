import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Article_Page/article_body/article_recommendation.dart';
import 'package:starlife/page/Article_Page/article_body/article_brochure.dart';
import 'package:starlife/controllers/global_controller.dart';

class HealthyArticlePage extends StatefulWidget {
  const HealthyArticlePage({super.key});

  @override
  State<HealthyArticlePage> createState() => _HealthyArticlePageState();
}

class _HealthyArticlePageState extends State<HealthyArticlePage> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          // const ArticleBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              mainAxisAlignment: MainAxisAlignment.start, 
              children: const [
                  ArticleBrochure(),
                  ArticleRecommendations()
              ]
            ),
          ),
        ],
      ),
    );
  }
}
