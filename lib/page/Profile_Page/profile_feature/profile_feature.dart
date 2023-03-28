import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile_Page/profile_body/profile_item_list.dart' as item;
import 'package:starlife/page/Profile_Page/profile_body/profile_logout_button.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_immunization_page/profile_immunization_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_patient_card/profile_pop_up_card.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_other_patient.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_change_password_page/password_change_pass_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_new_pin_page/profile_pin_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_account_information_page/profile_account_information_page.dart';
import 'package:starlife/page/global_controller.dart';

class ProfileFeature extends StatelessWidget {
  ProfileFeature({super.key});
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        item.ProfileItemList(
          icon: Icons.person,
          title: "Informasi Akun",
          ontap: () {
            Get.to(const ProfileAccountInformation());
          },
        ),
        item.ProfileItemList(
          icon: Icons.people,
          title: "Pasien Lain",
          ontap: () {
            Get.to(const ProfileOtherPatient());
          },
        ),
        item.ProfileItemList(
          icon: Icons.calendar_month_sharp,
          title: "Jadwal Imunisasi",
          ontap: () {
            Get.to(const ProfileImmunizationPage());
          },
        ),
        item.ProfileItemList(
          icon: Icons.badge_rounded,
          title: "Kartu Pasien",
          ontap: () {
            ProfilePopUpCard(context);
          },
        ),
        item.ProfileItemList(
          icon: Icons.lock,
          title: "Ubah Password",
          ontap: () {
            Get.to(const ProfileChangePasswordPage());
          },
        ),
        item.ProfileItemList(
          icon: Icons.lock_outline,
          title: "Ubah Pin RM",
          ontap: () {
            Get.to(const ProfilePinPage());
          },
        ),
        ProfileLogoutButton(p, c, context),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
