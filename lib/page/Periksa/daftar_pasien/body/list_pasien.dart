import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ListPasien extends StatefulWidget {
  final bool? passwordMode;

  const ListPasien({super.key, this.passwordMode});

  @override
  State<ListPasien> createState() => _ListPasienState();
}

class _ListPasienState extends State<ListPasien> {
  var screenHeight = Get.height / 763;
  final c = Get.put(GlobalController());
  List<Pasien> _pasiens = [
    Pasien(id: "01", name: "Darmawan Gunawangsa", rm: "RM21285-101223/15", role: "Anak ke-2", isSelected: false),
    Pasien(id: "02", name: "Muhammad Aulia Daffa", rm: "RM21285-101223/15", role: "Anak ke-3", isSelected: false),
    Pasien(id: "03", name: "Darmawan Gunawangsa", rm: "RM21285-101223/15", role: "Anda", isSelected: false),
    // Pasien(id: "04", name: "Muhammad Aulia Daffa", rm: "RM21285-101223/15", role: "Anak ke-2", isSelected: false),
    // Pasien(id: "05", name: "Darmawan Gunawangsa", rm: "RM21285-101223/15", role: "Anak ke-1", isSelected: false),
    // Pasien(id: "06", name: "Muhammad Aulia Daffa", rm: "RM21285-101223/15", role: "Anak ke-4", isSelected: false),
    // Pasien(id: "78", name: "Darmawan Gunawangsa", rm: "RM21285-101223/15", role: "Anak ke-5", isSelected: false),
    // Pasien(id: "15807", name: "Muhammad Aulia Daffa", rm: "RM21285-101223/15", role: "Anak ke-6", isSelected: false),
  ];
  List<Pasien> selectedPasien = [];
  // final _items = _pasiens.map((pasien) => MultiSelectItem<Pasien>(pasien, pasien.name)).toList();
  // List<Pasien> _selectedPasiens = [];
  // final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: c.sh * 115,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _pasiens.length,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _pasiens[index].isSelected = !_pasiens[index].isSelected;
                        if (_pasiens[index].isSelected == true) {
                          selectedPasien.add(_pasiens[index]);
                          print(selectedPasien);
                        } else {
                          selectedPasien.removeWhere((item) => item.id == _pasiens[index].id);
                          print(selectedPasien);
                        }
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: c.sh * 10,
                        ),
                       
                        Container(
                            height: c.sh * 109.67,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color.fromRGBO(225, 225, 225, 1)),
                              boxShadow: const [
                                BoxShadow(color: Color(0x54000000), spreadRadius: 0.1, blurRadius: 0.5, offset: Offset(0.0, 0.1)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      "assets/images/img_avatar_2.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: c.sw * 13,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Stack(children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(_pasiens[index].name, maxLines: 1, style: GoogleFonts.poppins(fontSize: 14, color: OPrimaryColor, fontWeight: FontWeight.w700), minFontSize: 5),
                                          SizedBox(
                                            height: c.sh * 2,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                              color: Color.fromARGB(255, 234, 234, 234),
                                            ))),
                                          ),
                                          SizedBox(
                                            height: c.sh * 2,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                'No. Rekam Medis',
                                                style: GoogleFonts.poppins(fontSize: 8),
                                                minFontSize: 3,
                                                maxLines: 1,
                                              ),
                                              AutoSizeText('RM101085-101223/012', style: GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w700), minFontSize: 3, maxLines: 1)
                                            ],
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                              // if(role == 'Anda')...[]else()...[]
                                              color: (_pasiens[index].role == 'Anda')
                                                  ? const Color(0xffEBD0FF)
                                                  : (_pasiens[index].role == 'Suami' || _pasiens[index].role == 'Istri')
                                                      ? const Color(0xffFFD0A1)
                                                      : const Color(0xffC3FFEC),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                                                child: (_pasiens[index].role == 'Anda')
                                                    ? Text(
                                                        _pasiens[index].role,
                                                        style: const TextStyle(color: Color(0xff9B26F0)),
                                                      ).p7m()
                                                    : (_pasiens[index].role == 'Suami' || _pasiens[index].role == 'Istri')
                                                        ? Text(
                                                            _pasiens[index].role,
                                                            style: const TextStyle(color: Color(0xff8C4701)),
                                                          ).p7m()
                                                        : Text(
                                                            _pasiens[index].role,
                                                            style: TextStyle(color: Color(0xff21C994)),
                                                          ).p7m())),
                                      )
                                    ]),
                                  ),
                                  SizedBox(
                                    width: c.sw * 15,
                                  ),
                                  Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: _pasiens[index].isSelected == false ? Colors.grey : OPrimaryColor), color: _pasiens[index].isSelected == false ? Colors.white : OPrimaryColor),
                                      child: _pasiens[index].isSelected == true
                                          ? Center(
                                              child: Icon(
                                              Icons.done_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            ))
                                          : Container())
                                ],
                              ),
                            )),
                        SizedBox(
                          height: c.sh * 5,
                        )
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}

class Pasien {
  final String id;
  final String name;
  final String rm;
  final String role;
  bool isSelected;

  Pasien({
    required this.id,
    required this.name,
    required this.rm,
    required this.role,
    required this.isSelected,
  });

  @override
  String toString() {
    return '{ ${this.name}, ${this.id} }';
  }
}
