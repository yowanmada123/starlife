import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home_Page/experienced_doctor/experienced_doctor.dart';
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
    final double itemHeight = (size.height - kToolbarHeight - c.sh * 300) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          CustomTopBar(),
          RoundedInside(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  ListDokter(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: c.sh * 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: c.sh * 53,
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
