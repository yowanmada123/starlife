import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key, this.times});
  final int? times;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (times != null) {
          Get.close(times!);

        }
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color.fromARGB(83, 46, 46, 46), spreadRadius: 1, blurRadius: 1, offset: Offset(0.0, 1.0)),
          ],
        ),
        child: ClipOval(
          child: SizedBox(
              width: 32,
              height: 32,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: const [
                Padding(
                  padding: EdgeInsets.only(left: 7.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 17,
                    color: Colors.black,
                  ),
                )
              ])),
        ),
      ),
    );
  }
}
