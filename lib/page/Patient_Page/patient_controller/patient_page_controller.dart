import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:starlife/model/patient_res.dart';
import 'package:starlife/page/Patient_Page/patient_feature/patient_list_page/patient_list_page.dart';
import 'package:starlife/page/global_controller.dart';

class PatientPageController extends GetxController {
  var c = Get.put(GlobalController());
  TextEditingController rmController = TextEditingController(text: "");
  TextEditingController namaController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController tanggalLahirController = TextEditingController(text: "");
  TextEditingController usiaController = TextEditingController(text: "");
  TextEditingController statusController = TextEditingController(text: "");
  TextEditingController jenisKelaminController = TextEditingController(text: "");
  TextEditingController agamaController = TextEditingController(text: "");
  TextEditingController alergiObatController = TextEditingController(text: "");
  TextEditingController goldarController = TextEditingController(text: "");
  TextEditingController alamatController = TextEditingController(text: "");
  TextEditingController kotaController = TextEditingController(text: "");
  TextEditingController kelurahanController = TextEditingController(text: "");
  TextEditingController rtController = TextEditingController(text: "");
  TextEditingController rwController = TextEditingController(text: "");
  TextEditingController kecamatanController = TextEditingController(text: "");
  TextEditingController teleponController = TextEditingController(text: "");
  TextEditingController handphoneController = TextEditingController(text: "");
  TextEditingController orangtuaController = TextEditingController(text: "");
  List<Pasien> selectedPasien = [];
  
  var dio = Dio();
  patientAdd(BuildContext context) {
    bool emailTrue = c.isEmail(emailController.text);
    bool phoneTrue = c.isPhone(handphoneController.text);
    
    if(emailController.text.isNotEmpty && 
    namaController.text.isNotEmpty && 
    tanggalLahirController.text.isNotEmpty && 
    usiaController.text.isNotEmpty && 
    statusController.text.isNotEmpty && 
    jenisKelaminController.text.isNotEmpty && 
    agamaController.text.isNotEmpty && 
    alergiObatController.text.isNotEmpty && 
    alamatController.text.isNotEmpty && 
    handphoneController.text.isNotEmpty){
      if (emailTrue) {
        if(phoneTrue){
          Get.to(const PatientListPage());
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please fill correct "No.Handphone"'),
          backgroundColor: Colors.black87,
        ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please fill correct "Email"'),
          backgroundColor: Colors.black87,
        ));
      }
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please Fill in the blank'),
        backgroundColor: Colors.black87,
      ));
    }
  }

  patientOneWayAdd(BuildContext context){
    if(
    namaController.text.isNotEmpty && 
    jenisKelaminController.text.isNotEmpty ){

    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Fill in the blank'),
          backgroundColor: Colors.black87,
        ));
    }
  }

}
