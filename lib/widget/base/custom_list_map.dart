import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/widget/ext_text.dart';

import '../../controllers/global_controller.dart';

class CustomListOfMap extends StatefulWidget {
  const CustomListOfMap({
    super.key,
    required this.title,
    required this.content,
    this.height,
    this.isMust,
  });
  final List<Map<String, dynamic>> content;
  final String title;
  final double? height;
  final bool? isMust;

  @override
  State<CustomListOfMap> createState() => _CustomListOfMapState();
}

class _CustomListOfMapState extends State<CustomListOfMap> {
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
                  text: (widget.isMust == true) ? '*' : '',
                  style: GoogleFonts.poppins(color: const Color(0xffF1416C), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 15, top: 14, bottom: 14),
            width: Get.width,
            // height:    46,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xff28C6F5))),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: widget.content.length,
                itemBuilder: (BuildContext context, int index) {
                  return (index + 1 == widget.content.length)
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  color: Colors.grey,
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(widget.content[index]['obat']).p12m().grey()
                                // Text("").p12m().grey(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(widget.content[index]['aturan']).p12m().grey(),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  color: Colors.grey,
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(widget.content[index]['obat']).p12m().grey()
                                // Text("").p12m().grey(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(widget.content[index]['aturan']).p12m().grey(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                })),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
