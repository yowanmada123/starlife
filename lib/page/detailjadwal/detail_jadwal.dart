import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/detailjadwal/body/detail_dokter.dart';
import 'package:starlife/page/detailjadwal/body/topbar.dart';

import 'body/biografi_dokter.dart';
import 'body/bottombar.dart';
import 'body/jadwal_dokter.dart';
import 'body/lokasi_praktek.dart';
import 'body/waktu_available.dart';

class DetailJadwal extends StatefulWidget {
  const DetailJadwal({super.key});

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: const Color.fromARGB(255, 215, 215, 215),
          ),
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
              children: [
                DetailDokter(),
                const JadwalDokter(),
                const WaktuAvailable(),
                const LokasiPraktek(),
                Container(
                  height: 12,
                  color: Color.fromARGB(255, 250, 249, 249),
                ),
                const BiografiDokter()
              ],
            )),
          ),
          const TopBar(),
          const BottomBar(),
        ],
      ),
    );
  }
}