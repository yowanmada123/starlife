import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_data/profile_patient_data_form.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfilePatientDataPage extends StatefulWidget {
  const ProfilePatientDataPage({super.key, required this.patient});
  final Patient patient;

  @override
  State<ProfilePatientDataPage> createState() => _ProfilePatientDataPageState();
}

class _ProfilePatientDataPageState extends State<ProfilePatientDataPage> {
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
          ProfilePatientDataform(
            patient: widget.patient,
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
                    SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: 16,
                        ),
                        const Text("Edit Profile").p16b().white(),
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
