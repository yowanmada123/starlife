import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_account_information_page/profile_data_form.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileAccountInformation extends StatefulWidget {
  const ProfileAccountInformation({super.key});

  @override
  State<ProfileAccountInformation> createState() => _ProfileAccountInformationState();
}

class _ProfileAccountInformationState extends State<ProfileAccountInformation> {
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
        RoundedInside(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                ProfileDataForm(),
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

