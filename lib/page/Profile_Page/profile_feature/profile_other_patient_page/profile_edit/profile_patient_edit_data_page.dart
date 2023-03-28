import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_edit/profile_patient_edit_data_form.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileEditDataPage extends StatefulWidget {
  ProfileEditDataPage({super.key, this.patient});
  Patient? patient;

  @override
  State<ProfileEditDataPage> createState() => _ProfileEditDataPageState();
}

class _ProfileEditDataPageState extends State<ProfileEditDataPage> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

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
          ProfilePatientEditForm(patient: widget.patient),
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
                    const SizedBox(
                      height: 53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        const Text("Edit Profile").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
          CustomButtomButton(
            ontap: () {
              p.updateProfile(context);
            },
            text: "Simpan",
          ),
        ],
      ),
    );
  }
}
