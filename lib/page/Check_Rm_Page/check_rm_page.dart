import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_topbar.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_kid_growth.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_pin_page.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_body/check_rm_immunitation_history.dart';
import 'package:starlife/page/dio/dioController.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class CheckRmPage extends StatefulWidget {
  const CheckRmPage({super.key});

  @override
  State<CheckRmPage> createState() => _CheckRmPageState();
}

class _CheckRmPageState extends State<CheckRmPage> {
  final List<String> entrie = <String>['Sarah Celestia Bella', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa'];
  final List<String> role = <String>['Anda', 'Suami', 'Anak ke-1', 'Anak ke-2', 'Anak ke-3', 'Anak ke-4', 'Anak ke-5'];
  final c = Get.put(GlobalController());
  
  final dC = Get.put(DioController());
  final loading = true.obs;
  // Future<Post>? post;
  // Future<List<Post>>? posts;
  // final listPost = <Post>[].obs;
  
  @override
  void initState() {
    super.initState();
    dC.getData();
    loading.value = false;
  }
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
          const TopBar(),
          RoundedInside(
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  // padding: EdgeInsets.only(top: c.sh * 124),
                  width: Get.width,
                  height: Get.height,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: entrie.length,
                      itemBuilder: (BuildContext context, int index) {
                        return (index + 1 == entrie.length)
                            ? Column(
                                children: [
                                  ItemList(
                                    name: entrie[index],
                                    role: role[index],
                                  ),
                                  SizedBox(
                                    height: c.sh * 220,
                                  ),
                                ],
                              )
                            : ItemList(
                                name: entrie[index],
                                role: role[index],
                              );
                      }),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.name, required this.role});
  final String name;
  final String role;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(GlobalController());
    return GestureDetector(
      onTap: () {
        Get.to(PinPage(
          name: name,
        ));
      },
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 10,
          ),
          Container(
              height: 125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Color(0x54000000), spreadRadius: 0.1, blurRadius: 2, offset: Offset(0.0, 0.1)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "assets/images/img_avatar_2.png",
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    SizedBox(
                      width: c.sw * 13,
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              maxLines: 1,
                            ).p16m().primary(),
                            SizedBox(
                              height: c.sh * 3,
                            ),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                            SizedBox(
                              height: c.sh * 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('No. Rekam Medis').p10r().black(),
                                const Text('RM101085-101223/012').p10b().black(),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (role == 'Suami' || role == 'Istri' || role == 'Anda') ...[
                                    Container(
                                        decoration: BoxDecoration(
                                          // if(role == 'Anda')...[]else()...[]
                                          color: (role == 'Anda')
                                              ? const Color(0xffEBD0FF)
                                              : (role == 'Suami' || role == 'Istri')
                                                  ? const Color(0xffFFD0A1)
                                                  : const Color(0xffC3FFEC),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            child: (role == 'Anda')
                                                ? Text(
                                                    role,
                                                    style: const TextStyle(color: Color(0xff9B26F0)),
                                                  ).p10r()
                                                : (role == 'Suami' || role == 'Istri')
                                                    ? Text(
                                                        role,
                                                        style: const TextStyle(color: Color(0xff8C4701)),
                                                      ).p10r()
                                                    : Text(
                                                        role,
                                                        style: const TextStyle(color: Color(0xff21C994)),
                                                      ).p10r())),
                                  ] else ...[
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                  // if(role == 'Anda')...[]else()...[]
                                                  color: (role == 'Anda')
                                                      ? const Color(0xffEBD0FF)
                                                      : (role == 'Suami' || role == 'Istri')
                                                          ? const Color(0xffFFD0A1)
                                                          : const Color(0xffC3FFEC),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                    child: (role == 'Anda')
                                                        ? Text(
                                                            role,
                                                            style: const TextStyle(color: Color(0xff9B26F0)),
                                                          ).p10r()
                                                        : (role == 'Suami' || role == 'Istri')
                                                            ? Text(
                                                                role,
                                                                style: const TextStyle(color: Color(0xff8C4701)),
                                                              ).p10r()
                                                            : Text(
                                                                role,
                                                                style: const TextStyle(color: Color(0xff21C994)),
                                                              ).p10r())),
                                          ],
                                        ),
                                        SizedBox(
                                          height: c.sh * 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BaseButton(
                                              ontap: () {
                                                Get.to(CekPermkembanganPage(
                                                  name: name,
                                                ));
                                              },
                                              text: "Cek Perkembangan",
                                              textColor: Colors.white,
                                              outlineRadius: 20,
                                              width: c.sw * 98,
                                              height: c.sh * 20,
                                              textSize: 8,
                                            ),
                                            SizedBox(
                                              width: c.sw * 12,
                                            ),
                                            BaseButton(
                                              ontap: () {
                                                Get.to(const CheckRmImmunizationHistoryPage());
                                              },
                                              text: "Riwayat Imunisasi",
                                              textColor: Colors.white,
                                              outlineRadius: 20,
                                              width: c.sw * 98,
                                              height: c.sh * 20,
                                              textSize: 8,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: c.sh * 10,
          )
        ],
      ),
    );
  }
}
