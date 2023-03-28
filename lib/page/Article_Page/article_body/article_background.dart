

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';

class ArticleBackground extends StatefulWidget {
  const ArticleBackground({super.key});

  @override
  State<ArticleBackground> createState() => _ArticleBackgroundState();
}

class _ArticleBackgroundState extends State<ArticleBackground> {
  final c = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Positioned(
              top: -450,
              left: -210,
              child: Container(
                width: c.sw * 844,
                height: 844,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: OPrimaryColor),
              ),
            ),
            Positioned(
                top: -230,
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