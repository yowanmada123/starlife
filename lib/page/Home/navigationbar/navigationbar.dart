import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Cek_RM/cek_rm_page.dart';
import 'package:starlife/page/Home/home_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';

class HelloConvexAppBar extends StatelessWidget {
  final c = Get.put(GlobalController());

  final List<Widget> _children = [
    const HomePage(),
    const CekRmPage(),
    const CekRmPage(),
    const CekRmPage(),
    const CekRmPage(),
  ];

  void onTabTapped(int index) {
    c.tabHomeIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Hello ConvexAppBar')),
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
            initialActiveIndex: 0,
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
