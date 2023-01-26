import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Cek_RM/list_rm/detail_rm_page.dart';
import 'package:starlife/page/Cek_RM/list_rm/topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ListRmPage extends StatefulWidget {
  const ListRmPage({super.key, required this.name});
  final String name;
  @override
  State<ListRmPage> createState() => _ListRmPageState();
}

class _ListRmPageState extends State<ListRmPage> {
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
                      return ItemList(
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
          TopBar(name:widget.name)
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
        Get.to(DetailRmPage(name:name));
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
                      child: Stack(
                        children:[
                           Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  maxLines: 1,
                                ).p16m().primary(),
                                SizedBox(
                                  height: c.sh * 2,
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey[200],   
                                ),
                                SizedBox(
                                  height: c.sh * 2,
                                ),
                                const Text('Dokter Umum').p10r().black(),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                             Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/icon/ic_date.svg"),
                                      SizedBox(
                                        width: c.sw * 4,
                                      ),
                                      const Text('24 November 2022').p10m().primary(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled_rounded, size: 12, color: OPrimaryColor,),
                                      SizedBox(
                                        width: c.sw * 4,
                                      ),
                                      const Text('10:40 WIB').p10m().primary(),
                                    ],
                                  ),
                                  
                                ],
                              ),
                          ]
                        ),
                        ]
                      ),
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
