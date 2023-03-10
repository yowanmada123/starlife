import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile_Page/profile_body/profile_background.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_feature.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

import 'profile_body/profile_patient.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        const ProfileBackground(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw*16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfilePatient(),
                ProfileFeature(),
              ],
            ),
          ),
        )
        ],
      ),
    );
  }
}