import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_data/profile_patient_data_form.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_buttom_button.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/ext_text.dart';

// Halaman detail pasien yang terdaftar pada list pasien.
class ProfilePatientDataPage extends StatelessWidget {
  ProfilePatientDataPage({super.key, required this.patient});
  final Patient patient;
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
          //Tampilan Body daripada halaman detail pasien.
          ProfilePatientDataform(
            patient: patient,
          ),
          Container(
            color: Colors.transparent,
            height: 115,
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
