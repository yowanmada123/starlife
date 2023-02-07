import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_page.dart';
import 'package:starlife/page/Patient_Page/patient_list_page.dart';
import 'package:starlife/page/Home_Page/home_page.dart';
import 'package:starlife/page/Auth_Page/Login/login_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_check_page/patient_check_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_oneway_add_page/patient_oneway_add_page.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_add_page/patient_add_page.dart';
import 'package:starlife/page/Profile_Page/profile_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/showdialog_fill_button.dart';
import 'package:starlife/widget/base/showdialog_two_button.dart';

import '../../Article_Page/article_healthy_page.dart';

class HelloConvexAppBar extends StatelessWidget {
  final c = Get.put(GlobalController());

  final List<Widget> _children = [
    const HomePage(),
    const CheckRmPage(),
    const PatientListPage(),
    const HealthyArticlePage(),
    const ProfilePage(),
  ];

  HelloConvexAppBar({super.key});

  void onTabTapped(int index) {
    if (index == 1 || index == 2 || index == 4) {
      if (c.isLogin.value == false) {
        c.tabHomeIndex.value = 0;
        Get.offAll(HelloConvexAppBar());
        Get.to(const LoginPage());
      } else {
        c.tabHomeIndex.value = index;
      }
    } else {
      c.tabHomeIndex.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _children[c.tabHomeIndex.toInt()]),
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
            style: TabStyle.fixedCircle,
            curveSize: 80,
            height: 62,
            cornerRadius: 20,
            items: [
              TabItem(icon: SvgPicture.asset("assets/icon/ic_home_inactive.svg"), activeIcon: SvgPicture.asset("assets/icon/ic_home_active.svg"), title: "Home"),
              TabItem(icon: SvgPicture.asset("assets/icon/ic_rm_inactive.svg"), activeIcon: SvgPicture.asset("assets/icon/ic_rm_active.svg"), title: "Cek RM"),
              TabItem(
                icon: SvgPicture.asset("assets/icon/ic_inactive_middle.svg"),
                activeIcon: SvgPicture.asset("assets/icon/ic_active_middle.svg"),
              ),
              TabItem(icon: SvgPicture.asset("assets/icon/ic_artikel_inactive.svg"), activeIcon: SvgPicture.asset("assets/icon/ic_artikel_active.svg"), title: "Artikel"),
              TabItem(icon: SvgPicture.asset("assets/icon/ic_profil.svg"), activeIcon: SvgPicture.asset("assets/icon/ic_profil_active.svg"), title: "Profil"),
            ],
            activeColor: OPrimaryColor,
            color: const Color.fromARGB(255, 212, 211, 211),
            backgroundColor: Colors.white,
            initialActiveIndex: c.tabHomeIndex.value,
            disableDefaultTabController: true,
            onTap: (int i) {
              print('click index=$i');
              onTabTapped(i);
            }),
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 50;
  @override
  double get activeIconMargin => 5;
  @override
  double get iconSize => 40;
  @override
  TextStyle textStyle(Color color, String? s) {
    return TextStyle(fontSize: 12, color: color);
  }
}

// class Periksa extends StatefulWidget {
//   const Periksa({super.key});

//   @override
//   State<Periksa> createState() => _PeriksaState();
// }

// class _PeriksaState extends State<Periksa> {
//   TextEditingController controller = TextEditingController(text: "");
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration.zero, () => showAlert(context));
//     return Container();
//   }

//   void showAlert(BuildContext context) {
//     dialogBuilder(
//       barier: true,
//         context: context,
//         buttonLeft: () {
//           Get.back();
//           dialogBuilder(
//               context: context,
//               title: "Apakah Calon Pasien Termasuk Pasien Periksa Sekali Jalan ?",
//               buttonLeft: () {
//                 Get.back();
//                 Get.to(const TambahPasien());
//               },
//               buttonRight: () {
//                 Get.back();
//                 Get.to(const TambahPasienSekaliJalan());
//               },
//               leftTittle: "Bukan Termasuk",
//               rightTitle: "Ya, Termasuk", barier: true);
//         },
//         buttonRight: () {
//           Get.back();
//           filledShowDialog(
//               context: context,
//               title: "Masukkan No. Rekam Medis",
//               button: () {
//                 Get.to(const BelumAdaPasien());
//               },
//               controller: controller,
//               hint: "Masukkan No. Rekam Medis Anda");
//         },
//         title: "Apakah Anda Sudah Memiliki Nomor Rekam Medis ?",
//         leftTittle: 'Belum',
//         rightTitle: "Sudah");
//   }
// }
