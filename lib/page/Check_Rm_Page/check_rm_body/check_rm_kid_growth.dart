import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/ext_text.dart';

class CekPermkembanganPage extends StatefulWidget {
  const CekPermkembanganPage({super.key, required this.name});
  final String name;

  @override
  State<CekPermkembanganPage> createState() => _CekPermkembanganPageState();
}

class _CekPermkembanganPageState extends State<CekPermkembanganPage> {
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
          const CustomTopBar(height: 115),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  const Text("Berat anak berdasarkan usia").p14b().black(),
                  const SizedBox(
                    height: 14,
                  ),
                  SvgPicture.asset("assets/icon/table1.svg"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Berat badan berdasarkan tinggi badan").p14b().black(),
                  const SizedBox(
                    height: 14,
                  ),
                  SvgPicture.asset("assets/icon/table2.svg"),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: 16,
                        ),
                        Text(widget.name).p16b().white(),
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
