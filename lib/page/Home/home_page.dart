import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/Home/body/artikel_kesehatan.dart';
import 'package:starlife/page/Home/body/brochure.dart';
import 'package:starlife/page/Home/body/dokter_pengalaman.dart';
import 'package:starlife/page/Home/body/topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starlife/widget/ext_text.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'body/pelayanan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final c = Get.put(GlobalController());
  int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              const Brochure(),
              Pelayanan(),
              const DokterPengalaman(),
              const ArtikelKesehatan(),
            ],
          )),
          const TopBar()
        ],
      ),
    );
  }
}
