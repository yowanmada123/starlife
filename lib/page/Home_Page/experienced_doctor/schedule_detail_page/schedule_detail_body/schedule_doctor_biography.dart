import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

class ScheduleDoctorBiography extends StatefulWidget {
  const ScheduleDoctorBiography({super.key});

  @override
  State<ScheduleDoctorBiography> createState() => _ScheduleDoctorBiographyState();
}

class _ScheduleDoctorBiographyState extends State<ScheduleDoctorBiography> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
              height: c.sh*14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Biografi Dokter").p14m().black(),
              ],
            ),
            SizedBox(
              height: c.sh*6,
            ),
            Container(
              child: const Text("dr. Ana Sulastri mempunyai pengalaman 7 tahun sebagai dokter spesialis anak dengan bidang keahlian nafsu makan, DBD dan penyakit tropis, pencernaan anak, bayi lahir kecil dan prematur, perkembangan anak dan kesehatan remaja.", textAlign: TextAlign.justify,).p12l().black(),
            ),
            const Divider(),
            SizedBox(
              height: c.sh*60,
            ),
          
        ],
      ),
    );
  }
}
