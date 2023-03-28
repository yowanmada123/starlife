import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor_list.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class ExperiencedDoctorListPage extends StatefulWidget {
  const ExperiencedDoctorListPage({super.key, this.title});
  final String? title;

  @override
  State<ExperiencedDoctorListPage> createState() => _ExperiencedDoctorListPageState();
}

class _ExperiencedDoctorListPageState extends State<ExperiencedDoctorListPage> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 300) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          const CustomTopBar(height: 115),
          RoundedInside(
            height: 98,
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  ListDoctor(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Text(widget.title ?? "Dokter Berpengalaman").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
