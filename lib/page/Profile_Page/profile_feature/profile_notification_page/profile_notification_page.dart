import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_data/profile_patient_data_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfileNotificationPage extends StatefulWidget {
  const ProfileNotificationPage({super.key});

  @override
  State<ProfileNotificationPage> createState() => _ProfileNotificationPagetState();
}

class _ProfileNotificationPagetState extends State<ProfileNotificationPage> {
  final String entrie = "Pelayanan Imunisasi dilaksanakan pada hari ini, Selasa 10 Januari 2023 pukul 10.00";
  final List<String> time = <String>['04.00 PM', '03.00 PM', '01.00 PM', '12.00 AM', '11.00 AM', '10.00 AM', '08.00 AM'];
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
          const CustomTopBar(height: 115),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                padding: EdgeInsets.only(top: 97, left: c.sw*16, right: c.sw*16),
                width: Get.width,
                height: Get.height,
                child: ListView.builder(
                    itemCount: time.length,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return (index + 1 == time.length)
                          ? Column(
                              children: [
                                ItemList(
                                  name: entrie,
                                  time: time[index],
                                ),
                                SizedBox(
                                  height:    1000,
                                ),
                              ],
                            )
                          : ItemList(
                              name: entrie,
                              time: time[index],
                            );
                    }),
              ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height:    128,
            width: Get.width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:    53,
                    ),
                    Row(
                      children: [
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        const Text("Notifikasi").p16b().white(),
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
  const ItemList({super.key, required this.name, required this.time});
  final String name;
  final String time;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(GlobalController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                color: OPrimaryColor,
                borderRadius: BorderRadius.circular(10)
                ),
              ),
          ],
        ),
        SizedBox(
          width: c.sw * 13,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: c.sw*335,
              height: 35,
              child: Text(
                name,
                maxLines: 2,
                textAlign: TextAlign.left,
              ).p10m().black(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(time).p10r().grey(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
