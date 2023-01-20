import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class BiografiDokter extends StatefulWidget {
  const BiografiDokter({super.key});

  @override
  State<BiografiDokter> createState() => _BiografiDokterState();
}

class _BiografiDokterState extends State<BiografiDokter> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
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
              child: Text("dr. Ana Sulastri mempunyai pengalaman 7 tahun sebagai dokter spesialis anak dengan bidang keahlian nafsu makan, DBD dan penyakit tropis, pencernaan anak, bayi lahir kecil dan prematur, perkembangan anak dan kesehatan remaja.", textAlign: TextAlign.justify,).p12l().black(),
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
