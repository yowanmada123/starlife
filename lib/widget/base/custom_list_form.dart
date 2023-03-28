import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../page/global_controller.dart';

class CustomListform extends StatefulWidget {
  const CustomListform({
    super.key,
    required this.title,
    required this.content,
    this.height, this.isMust,
  });
  final List<String> content;
  final String title;
  final double? height;
  final bool? isMust;

  @override
  State<CustomListform> createState() => _CustomListformState();
}

class _CustomListformState extends State<CustomListform> {
  final c = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: Get.width,
          height: 30,
          child: RichText(
            text: TextSpan(
              text: widget.title,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: (widget.isMust == true) ?'*' : '',
                  style: GoogleFonts.poppins(color: const Color(0xffF1416C), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: c.sw * 15, top: 14, bottom: 14),
            width: Get.width,
            // height:    46,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xff28C6F5))),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: widget.content.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.grey,
                        size: 5,
                      ),
                      SizedBox(
                        width: c.sw * 5,
                      ),
                      Text(widget.content[index]).p12m().grey()
                      // Text("").p12m().grey(),
                    ],
                  );
                })),
        SizedBox(
          height:    16,
        ),
      ],
    );
  }
}
