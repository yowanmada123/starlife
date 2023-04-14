import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/page/Home_Page/navigationbar/navigationbar.dart';
import 'package:starlife/page/Profile_Page/profile_body/profile_item_list.dart' as item;
import 'package:starlife/page/Profile_Page/profile_body/profile_logout_button.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_immunization_page/profile_immunization_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_new_pin_page/profile_change_pin_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_patient_card/profile_pop_up_card.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_other_patient.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_change_password_page/password_change_pass_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_new_pin_page/profile_pin_page.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_account_information_page/profile_account_information_page.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';

class ProfileFeature extends StatefulWidget {
  const ProfileFeature({super.key});

  @override
  State<ProfileFeature> createState() => _ProfileFeatureState();
}

class _ProfileFeatureState extends State<ProfileFeature> {
  final c = Get.put(GlobalController());
  final h = Get.put(HomeController());
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
            Get.to(const ProfileChangePinPage());
          },
        ),
        Container(
            width: Get.width,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 227, 226, 226),
                  blurRadius: 3.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    8.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: BaseButton(
              ontap: () {
                dialogBuilder(
                    context: context,
                    buttonLeft: () async {
                      await c.removeToken();
                      c.token.value = '';
                      setState(() {
                        Get.back();
                        c.tabHomeIndex.value = 0;
                        c.isLogin.value = false;
                        c.pasienNumber = 0;
                        p.loadingPersonal.value = false;
                        p.loadingPatientsData.value = false;
                        // p.person.clear();
                        h.listPatientQueue.clear();
                        Get.offAll(HelloConvexAppBar());
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Logout Success'),
                          backgroundColor: Colors.black87,
                        ));
                      });
                    },
                    buttonRight: () {
                      Get.back();
                    },
                    title: "Anda Yakin ingin Logout ?",
                    leftTittle: 'Ya',
                    rightTitle: "Tidak",
                    barier: true);
              },
              color: OPrimaryColor,
              text: "Keluar",
              textWeight: FontWeight.w600,
              textSize: 12,
              iconColor: Color(0xffD9532E),
              height: 38,
              width: Get.width,
              icon: Icons.logout,
            )),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
