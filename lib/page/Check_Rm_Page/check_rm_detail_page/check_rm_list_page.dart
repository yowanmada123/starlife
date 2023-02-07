import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_detail_page.dart';
import 'package:starlife/page/Check_Rm_Page/check_rm_detail_page/check_rm_detail_topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/rounded_inside.dart';
import 'package:starlife/widget/ext_text.dart';

class CheckRmListPage extends StatefulWidget {
  const CheckRmListPage({super.key, required this.name});
  final String name;
  @override
  State<CheckRmListPage> createState() => _CheckRmListPageState();
}

class _CheckRmListPageState extends State<CheckRmListPage> {
  final List<String> entrie = <String>['Santo', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa', 'Darwaman Gunawangsa', 'Gunawan Ardiansyah', 'Muhammad Aulia Daffa'];
  List<String> doctorsImage = [
    'assets/images/img_doctor.png',
    'assets/images/img_doctor1.png',
    'assets/images/img_doctor2.png',
    'assets/images/img_doctor3.png',
    'assets/images/img_doctor1.png',
    'assets/images/img_doctor2.png',
    'assets/images/img_doctor2.png',
  ];
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
          CheckRmTopBar(
          ),
          RoundedInside(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: entrie.length,
                      itemBuilder: (BuildContext context, int index) {
                        return index == entrie.length - 1
                            ?Column(
                                children: [
                                  ItemList(
                                    name: entrie[index],
                                    image: doctorsImage[index],
                                  ),
                                  SizedBox(
                                    height: c.sh * 120,
                                  )
                                ],
                              )
                            : ItemList(
                                name: entrie[index],
                                image: doctorsImage[index],
                              );
                      }),
                ),
                SizedBox(
                  height: c.sh * 500,
                )
              ],
            )),
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
                        const ButtonBack(times: 2),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Text(widget.name).p16b().white(),
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

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(GlobalController());
    return GestureDetector(
      onTap: () {
        Get.to(CheckRmDetailPage(name: name));
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
                        image,
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
                        Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                  Icon(
                                    Icons.access_time_filled_rounded,
                                    size: 12,
                                    color: OPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: c.sw * 4,
                                  ),
                                  const Text('10:40 WIB').p10m().primary(),
                                ],
                              ),
                            ],
                          ),
                        ]),
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
