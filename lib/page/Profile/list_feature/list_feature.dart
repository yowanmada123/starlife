import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile/body/item_list.dart' as item;
import 'package:starlife/page/Profile/body/logout_button.dart';
import 'package:starlife/page/Profile/list_feature/Informasi_akun/informasi_akun.dart';
import 'package:starlife/page/Profile/list_feature/Jadwal_imuniasi/jadwal_imunisasi_main_page.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/flip_card.dart';
import 'package:starlife/page/Profile/list_feature/Ubah_password/ubah_password_page.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/showdialog.dart';
import 'package:starlife/page/Profile/list_feature/Ubah_pin_rm/pin_page.dart';
import 'package:starlife/page/global_controller.dart';

import 'Pasien_lain/list_pasien_lain.dart';

class ListFeature extends StatelessWidget {
  ListFeature({super.key});
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: c.sh * 25,
        ),
        item.ItemList(
          icon: Icons.person,
          title: "Informasi Akun",
          ontap: () {
            Get.to(InformasiAkun());
          },
        ),
        item.ItemList(
          icon: Icons.people,
          title: "Pasien Lain",
          ontap: () {
            Get.to(ListPasienLain());
          },
        ),
        item.ItemList(
          icon: Icons.calendar_month_sharp,
          title: "Jadwal Imunisasi",
          ontap: () {
            Get.to(JadwalImunisasiPage());
          },
        ),
        item.ItemList(
          icon: Icons.badge_rounded,
          title: "Kartu Pasien",
          ontap: () {
            MendapatNomerAntrian(context);
          },
        ),
        item.ItemList(
          icon: Icons.lock,
          title: "Ubah Password",
          ontap: () {
            Get.to(UbahPasswordPage());
          },
        ),
        item.ItemList(
          icon: Icons.lock_outline,
          title: "Ubah Pin RM",
          ontap: () {
            Get.to(PinPage());
          },
        ),
        LogoutButton(c),
      ],
    );
  }
}
