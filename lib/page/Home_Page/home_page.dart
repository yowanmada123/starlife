import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/page/Home_Page/home_page_body/home_page_patient_queue.dart';
import 'package:starlife/page/Home_Page/home_page_body/home_page_health_article.dart';
import 'package:starlife/page/Home_Page/home_page_body/home_page_brochure.dart';
import 'package:starlife/page/Home_Page/home_page_body/home_page_expeirenced_doctor.dart';
import 'package:starlife/page/Home_Page/home_page_body/home_page_topbar.dart';
import 'package:starlife/controllers/global_controller.dart';

import 'home_page_body/home_page_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: const [
                  HomePageBrochure(),
                  HomePagePatientQueue(),
                  HomePageService(),
                  HomePageExperiencedDoctor(),
                  HomePageHealthArticle(),
                ],
              )),
          const HomePageTopBar()
        ],
      ),
    );
  }
}
