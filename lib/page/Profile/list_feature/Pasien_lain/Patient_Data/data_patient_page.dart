import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/page/Profile/list_feature/Pasien_lain/Patient_Data/form_data_patient.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/ext_text.dart';

class FormEditDataPasien extends StatefulWidget {
  const FormEditDataPasien({super.key});

  @override
  State<FormEditDataPasien> createState() => _FormEditDataPasienState();
}

class _FormEditDataPasienState extends State<FormEditDataPasien> {
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
          FormDataPasien(),
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
                        Text("Edit Profile").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
          CustomButtomButton(
            ontap: () {
              Get.back();
            },
            text: "Simpan",
          ),
        ],
      ),
    );
  }
}
