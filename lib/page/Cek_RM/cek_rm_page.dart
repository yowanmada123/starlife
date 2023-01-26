import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Cek_RM/body/topbar.dart';
import 'package:starlife/page/Cek_RM/list_rm/list_rm_page.dart';
import 'package:starlife/page/Cek_RM/list_rm/pin_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class CekRmPage extends StatefulWidget {
  const CekRmPage({super.key});

  @override
  State<CekRmPage> createState() => _CekRmPageState();
}

class _CekRmPageState extends State<CekRmPage> {
  final List<String> entrie = <String>['Sarah Celestia Bella', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa'];
  final List<String> role = <String>['Anda', 'Suami', 'Anak ke-1', 'Anak ke-2', 'Anak ke-3', 'Anak ke-4', 'Anak ke-5'];
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: c.sh * 124),
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
                                  height: c.sh * 100,
                                ),
                              ],
                            )
                          : ItemList(
                              name: entrie[index],
                              role: role[index],
                            );
                    }),
              ),
              SizedBox(
                height: c.sh * 500,
              )
            ],
          )),
          const TopBar()
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
        Get.to(PinPage(name: name,));
        
      },
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 10,
          ),
          Container(
              height: c.sh * 109.67,
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
                              height: c.sh * 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('No. Rekam Medis').p10r().black(),
                                const Text('RM101085-101223/012').p10b().black(),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                // if(role == 'Anda')...[]else()...[]
                                color: (role == 'Anda')
                                    ? Color(0xffEBD0FF)
                                    : (role == 'Suami' || role == 'Istri')
                                        ? Color(0xffFFD0A1)
                                        : Color(0xffC3FFEC),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                                  child: (role == 'Anda')
                                      ? Text(
                                          role,
                                          style: TextStyle(color: Color(0xff9B26F0)),
                                        ).p7m()
                                      : (role == 'Suami' || role == 'Istri')
                                          ? Text(
                                              role,
                                              style: TextStyle(color: Color(0xff8C4701)),
                                            ).p7m()
                                          : Text(
                                              role,
                                              style: TextStyle(color: Color(0xff21C994)),
                                            ).p7m())),
                        )
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
