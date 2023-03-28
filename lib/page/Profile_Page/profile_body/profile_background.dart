

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
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Positioned(
              top: -470,
              left: -210,
              child: Container(
                width: 744,
                height: 744,
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
                      width: 560,
                      height: 530,
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