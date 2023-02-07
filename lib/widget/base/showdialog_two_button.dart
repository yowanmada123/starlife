import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/widget/base/button_base.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../utils/colors.dart';

dialogBuilder({required bool barier, required BuildContext context, required String title,
required Function() buttonLeft, required Function() buttonRight, required String leftTittle, required String rightTitle, }) 


{
  final c = Get.put(GlobalController());
  return showDialog<void>(
    context: context,
    barrierDismissible: barier,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ).p15m(),
        // content: const Text('A dialog is a type of modal window that\n'
        //     'appears in front of app content to\n'
        //     'provide critical information, or prompt\n'
        //     'for a decision to be made.'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: c.sw * 110,
                  child: BaseButton(
                    ontap: buttonLeft,
                    text: leftTittle,
                    textSize: 14,
                    textColor: OPrimaryColor,
                    color: Colors.white,
                    outlineColor: OPrimaryColor,
                  )),
              SizedBox(
                width: c.sw * 23,
              ),
              Container(
                  width: c.sw * 110,
                  child: BaseButton(
                    ontap: buttonRight,
                    text: rightTitle,
                    textSize: 14,
                    textColor: Colors.white,
                    width: c.sw * 110,
                  ))
            ],
          ),
          SizedBox(
            height: c.sh * 14,
          ),
        ],
      );
    },
  );
}
