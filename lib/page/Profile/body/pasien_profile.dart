import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class PasienProfile extends StatelessWidget {
  const PasienProfile({super.key});

  @override
  Widget build(BuildContext context) {
  final c = Get.put(GlobalController());
    return Column(
      children: [
        SizedBox(
            height: c.sh*50,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Profile",
              style: TextStyle(height: 1.5),
            ).p16b().white(),
            Icon(Icons.edit, color: Colors.white, size: 15,)
          ],
        ),
        SizedBox(
            height: c.sh*20,
          ),
        Container(
          width: c.sw*230,
          height: c.sh*260,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0.1,
                blurRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: c.sh*20,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(1000)),
                    child: SizedBox(
                      width: c.sw * 120,
                      height: c.sw * 120,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset("assets/images/img_avatar_2.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: c.sh * 10,
                  ),
                  const Text("Sarah Celestia Bella").p15m().primary(),
                  const Text("sarahcb@gmail.com").p10r().primary(),
                  Expanded(
                    flex: 1,
                    child: AutoSizeText("No. RM : RM101085-101223/012", maxFontSize: 12, minFontSize: 9, style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: OPrimaryColor),)
                  ),
                  GestureDetector(
                    onTap: () async {
                        Clipboard.setData(new ClipboardData(text: "RM101085-101223/012")).then((_){
                          ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('RM Number Copied to your clipboard !')));
                        });
                      },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xffD0F4FF),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: OPrimaryColor)
                      ),
                      child: Text("Copy RM", style: TextStyle(color: Colors.grey),).p9r()),
                  ),
                  SizedBox(
                    height: c.sh * 15,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}