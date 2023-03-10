import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key, required this.title, this.isMust, required this.items, required this.firstItem, required this.controller});
  final String title;
  final bool? isMust;
  final List<String> items;
  final String firstItem;
  final TextEditingController controller;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final c = Get.put(GlobalController());
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: Get.width,
            height: c.sh * 30,
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
          // TextFormField(
          //   decoration: InputDecoration(
          //     contentPadding: const EdgeInsets.symmetric(
          //       horizontal: 20,
          //       vertical: 20,
          //     ),
          //     hintText: 'Enter Your Full Name.',
          //     hintStyle: const TextStyle(fontSize: 14),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 30),
          DropdownButtonFormField2(
            isDense: false,
            decoration: InputDecoration(
                //Add isDense true and zero Paddi

                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: OPrimaryColor))
                //Add more decoration as you want here
                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                ),
            isExpanded: true,
            hint: Text(
              widget.firstItem,
              style: GoogleFonts.poppins(color: Color(0xff868686), fontSize: 12, fontWeight: FontWeight.w600),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: OPrimaryColor,
            ),
            iconOnClick: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: OPrimaryColor,
            ),
            // dropdownElevation: 5,
            iconSize: 15,
            buttonHeight: c.sh * 46,
            buttonPadding: const EdgeInsets.only(right: 10),
            dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(color: Color(0xff868686), fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select gender.';
              }
            },
            onChanged: (value) {
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              selectedValue = value.toString();
              widget.controller.value = selectedValue as TextEditingValue;
            },
          ),
          SizedBox(
            height: c.sh * 16,
          )
          // const SizedBox(height: 30),
          // TextButton(
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       _formKey.currentState!.save();
          //     }
          //   },
          //   child: const Text('Submit Button'),
          // ),
        ],
      ),
    );
  }
}
