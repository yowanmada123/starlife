import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/ext_text.dart';

// Tampilan biografi dokter atau bagian dari halaman detail shcedule dokter
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
          const SizedBox(
              height:14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Biografi Dokter").p14m().black(),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              child: const Text("dr. Ana Sulastri mempunyai pengalaman 7 tahun sebagai dokter spesialis anak dengan bidang keahlian nafsu makan, DBD dan penyakit tropis, pencernaan anak, bayi lahir kecil dan prematur, perkembangan anak dan kesehatan remaja.", textAlign: TextAlign.justify,).p12l().black(),
            ),
            const Divider(),
            const SizedBox(
              height: 60,
            ),
          
        ],
      ),
    );
  }
}
