import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseForm extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool? passwordMode;

  const BaseForm({super.key, required this.controller, required this.title, this.passwordMode});

  @override
  State<BaseForm> createState() => _BaseFormState();
}

class _BaseFormState extends State<BaseForm> {
  var screenHeight = Get.height / 763;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 14),
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.title,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    );
  }
}
