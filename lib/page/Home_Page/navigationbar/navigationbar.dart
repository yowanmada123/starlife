import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Auth_Page/Login/login_page.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';

class HelloConvexAppBar extends StatefulWidget {
  const HelloConvexAppBar({super.key});
  
  @override
  State<HelloConvexAppBar> createState() => _HelloConvexAppBarState();
}

class _HelloConvexAppBarState extends State<HelloConvexAppBar> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => c.children[c.tabHomeIndex.toInt()]),
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: Obx(() => ConvexAppBar(
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
            onTap: (int i) async {
              String? token = await c.getToken();
              if (i == 1 || i == 2 || i == 4) {
                if (token == null) {
                  c.onTabTapped(0);
                  // Navigator.of(context).pushReplacement(builde: context, )
                  Get.offAll(const HelloConvexAppBar());
                  Get.to(const LoginPage());
                  // Future.delayed(const Duration(milliseconds: 10), () async {

                  // });
                } else {
                  // c.isLogin.value = true;
                  c.onTabTapped(i);
                }
              } else {
                c.onTabTapped(i);
              }
            })),
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
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 12, color: color);
  }
}
