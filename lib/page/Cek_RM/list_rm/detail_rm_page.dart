import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Cek_RM/list_rm/form_data_rm.dart';
import 'package:starlife/page/Cek_RM/list_rm/topbar.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class DetailRmPage extends StatefulWidget {
  const DetailRmPage({super.key, required this.name});
  final String name;
  @override
  State<DetailRmPage> createState() => _DetailRmPageState();
}

class _DetailRmPageState extends State<DetailRmPage> {
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
              FormDataRm(title: widget.name,)
            ],
          )),
          TopBar(name:widget.name)
        ],
      ),
    );
  }
}