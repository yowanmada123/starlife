import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile/list_feature/Informasi_akun/form_data_pasien.dart';
import 'package:starlife/widget/base/button_back.dart';
import 'package:starlife/widget/base/custom_topbar.dart';
import 'package:starlife/page/Profile/list_feature/Jadwal_imuniasi/jadwal_imunisasi.dart';
import 'package:starlife/page/Profile/list_feature/Jadwal_imuniasi/sudah_imunisasi.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class JadwalImunisasiPage extends StatefulWidget {
  const JadwalImunisasiPage({super.key});

  @override
  State<JadwalImunisasiPage> createState() => _JadwalImunisasiPageState();
}

class _JadwalImunisasiPageState extends State<JadwalImunisasiPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final c = Get.put(GlobalController());
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          CustomTopBar(),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: c.sh*120,),
                // give the tab bar a height [can change hheight to preferred height]
                Container(
                  height: 20,
                  child: TabBar(
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(
                        1.0,
                      ),
                      color: Colors.white,
                    ),
                    labelColor: OPrimaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Jadwal Imunisasi',
                      ),
          
                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Sudah Imunisasi',
                      ),
                    ],
                  ),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      // first tab bar view widget 
                      JadwalImunisasi(),
          
                      // second tab bar view widget
                      SudahImunisasi(),
                    ],
                  ),
                ),
              ],
            ),
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
                        const ButtonBack(),
                        SizedBox(
                          width: c.sw * 16,
                        ),
                        Text("Jadwal Imunisasi").p16b().white(),
                      ],
                    ),
                  ],
                )),
          ),
        ]
      ),
    );
  }
}