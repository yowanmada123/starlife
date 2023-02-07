import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile/list_feature/Informasi_akun/form_data_pasien.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class InformasiAkun extends StatefulWidget {
  const InformasiAkun({super.key});

  @override
  State<InformasiAkun> createState() => _InformasiAkunState();
}

class _InformasiAkunState extends State<InformasiAkun> {
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
        CustomTopBar(),  
        RoundedInside(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormDataPasien(),
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
                    Text("Informasi Akun").p16b().white(),
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

