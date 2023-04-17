import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_patient_card/profile_flip_card_animation.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

// Fungsi yang berguna untuk menampilkan kartu pasien.
Future<Object?> ProfilePopUpCard(BuildContext context) {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          actions: [
            Column(
              children: [
                const ProfileFlipCardAnimation(),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Tekan kartu pasien untuk memunculkan QR Code",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                ).p10m(),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: Get.width,
                  height: 34,
                  child: BaseButton(
                    ontap: () {
                      // Fungsi untuk convert tampilan kartu ke bentuk PDF
                      p.getPDF();
                      // p.tryToDownload();
                      ///////////////////////
                    },
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
