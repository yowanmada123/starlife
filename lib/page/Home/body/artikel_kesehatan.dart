import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ArtikelKesehatan extends StatefulWidget {
  const ArtikelKesehatan({super.key});

  @override
  State<ArtikelKesehatan> createState() => _ArtikelKesehatanState();
}

class _ArtikelKesehatanState extends State<ArtikelKesehatan> {
  final c = Get.put(GlobalController());
  List<String> category = [
    'Semua',
    'Kesehatan Anak',
    'Kesehatan Ibu Hamil',
    'Kesehatan Gigi',
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: c.sw * 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Artikel Kesehatan").p16b().black(),
          ],
        ),
      ),
      SizedBox(
        height: c.sh * 16,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
            height: 26,
            child: ListView.builder(
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int itemIndex) => Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = itemIndex;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: selectedIndex == itemIndex ? OPrimaryColor : Colors.white, 
                        borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                      // width: c.sw * 81,
                      child: Center(
                          child: Text(
                        category[itemIndex],
                        style: TextStyle(color:  selectedIndex == itemIndex ? Colors.white : OPrimaryColor, ),
                      ).p12r()),
                    ),
                  ),
                  SizedBox(
                    width: c.sw * 10,
                  ),
                  
                ],
              ),
            )),
      ),
      SizedBox(
        height: c.sh * 10,
      ),
      Container(
        height: 275,
        child: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int itemIndex) =>
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: 80,
                          height: 80,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset("assets/icon/ic_doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: c.sw * 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          child: 
                          Stack(
                            children: [
                              Container(
                                width: c.sw*258,
                                child: const Text("Kenali dan Pahami 10 Tanda Masalah Gigi & Mulut",
                                style: TextStyle(height: 1.5),
                                ).p14b().black()),
                              
                              Positioned(
                                bottom: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.timelapse_rounded, color: Colors.grey, size: 10,),
                                    SizedBox(
                                      width: c.sw * 10,
                                    ),
                                    const Text("1 minutes ago • Admin",
                                      style: TextStyle(height: 1.5),
                                    ).p10r().grey(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: c.sh * 10,
                ),
              ],
            ),
        
        ),
      ),
      SizedBox(
        height: c.sh * 30,
      ),
      
      
    ]);
  }
}
