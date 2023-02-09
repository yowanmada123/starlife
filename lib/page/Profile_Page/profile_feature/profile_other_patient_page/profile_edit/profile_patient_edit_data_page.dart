import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_edit/profile_patient_edit_data_form.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileEditDataPage extends StatefulWidget {
  const ProfileEditDataPage({super.key});

  @override
  State<ProfileEditDataPage> createState() => _ProfileEditDataPageState();
}

class _ProfileEditDataPageState extends State<ProfileEditDataPage> {
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
          const CustomTopBar(),  
          const ProfilePatientEditForm(),
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
