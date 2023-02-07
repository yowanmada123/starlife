import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile/list_feature/Informasi_akun/form_data_pasien.dart';
import 'package:starlife/page/global_controller.dart';
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
          CustomTopBar(
            
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: c.sw*16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: c.sh*130,),
                  Text("Berat anak berdasarkan usia").p14b().black(),
                  SizedBox(height: c.sh*14,),
                  SvgPicture.asset("assets/icon/table1.svg"),
                  SizedBox(height: c.sh*20,),
                  Text("Berat badan berdasarkan tinggi badan").p14b().black(),
                  SizedBox(height: c.sh*14,),
                  SvgPicture.asset("assets/icon/table2.svg"),
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
