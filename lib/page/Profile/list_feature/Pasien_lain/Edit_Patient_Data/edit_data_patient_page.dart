import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile/list_feature/Pasien_lain/Edit_Patient_Data/form_edit_patient.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/page/Profile/list_feature/Pasien_lain/Patient_Data/form_data_patient.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/ext_text.dart';

class EditDataPatientPage extends StatefulWidget {
  const EditDataPatientPage({super.key});

  @override
  State<EditDataPatientPage> createState() => _EditDataPatientPageState();
}

class _EditDataPatientPageState extends State<EditDataPatientPage> {
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
          FormEditPatient(),
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
