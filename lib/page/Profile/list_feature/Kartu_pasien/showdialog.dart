import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/back_card.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/flip_animation.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/flip_card.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/front_card.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

Future<Object?> MendapatNomerAntrian(BuildContext context) {
  final controller = FlipCardController();
  final c = Get.put(GlobalController());
  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
        child: AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          actions: [
            Column(
              children: [
                FlipCardPage(),
                SizedBox(
                  height: c.sh * 8,
                ),
                const Text(
                  "Tekan kartu pasien untuk memunculkan QR Code",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                ).p10m(),
                SizedBox(
                  height: c.sh * 8,
                ),
                SizedBox(
                  width: Get.width,
                  height: c.sh * 34,
                  child: BaseButton(
                    ontap: () {},
                    text: "Download Kartu Pasien",
                    textColor: Colors.white,
                    outlineRadius: 10,
                    textSize: 14,
                    textWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    },

    animationType: DialogTransitionType.slideFromBottom,
    // curve: Curves.fastOutSlowIn,
    // duration: Duration(seconds: 1),
  );
}
