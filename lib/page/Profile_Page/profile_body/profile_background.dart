

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';

class ProfileBackground extends StatefulWidget {
  const ProfileBackground({super.key});

  @override
  State<ProfileBackground> createState() => _ProfileBackgroundState();
}

class _ProfileBackgroundState extends State<ProfileBackground> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: c.sh*500,
      child: Stack(
        children: [
          Positioned(
              top: -470,
              left: -210,
              child: Container(
                width: c.sw * 844,
                height: c.sh * 844,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: OPrimaryColor),
              ),
            ),
            Positioned(
                top: -255,
                left: -100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(400)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      width: c.sw * 600,
                      height: c.sw * 600,
                      'assets/icon/ic_logo_crop.png',
                      // color: Colors.white.withOpacity(0.15),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                )),
                
        ],
      ),
    );
  }
}