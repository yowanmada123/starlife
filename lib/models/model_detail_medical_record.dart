// // To parse this JSON data, do
// //
// //     final detailMedicalRecord = detailMedicalRecordFromJson(jsonString);

// import 'dart:convert';

// DetailMedicalRecord detailMedicalRecordFromJson(String str) => DetailMedicalRecord.fromJson(json.decode(str));

// String detailMedicalRecordToJson(DetailMedicalRecord data) => json.encode(data.toJson());

// class DetailMedicalRecord {
//   DetailMedicalRecord({
//     required this.id,
//     required this.appointmentId,
//     required this.patientId,
//     required this.patientType,
//     required this.doctorId,
//     this.chiefComplain,
//     this.insuranceId,
//     this.policyNo,
//     this.weight,
//     this.tindakan,
//     this.idRujukan,
//     required this.diagnosis2,
//     required this.konsulP,
//     required this.konsulO,
//     required this.konsulS,
//     required this.konsulA,
//     this.bloodPressure,
//     this.medicine,
//     required this.diagnosis,
//     this.visitingFees,
//     this.patientNotes,
//     this.referenceBy,
//     this.referenceTo,
//     required this.date,
//     this.idInvoice,
//     required this.tanggalTime,
//     required this.rm,
//     required this.nama,
//     required this.dokter,
//     required this.poli,
//     required this.keluhan,
//     required this.obat,
//   });

//   String id;
//   String appointmentId;
//   String patientId;
//   String patientType;
//   String doctorId;
//   dynamic chiefComplain;
//   dynamic insuranceId;
//   dynamic policyNo;
//   dynamic weight;
//   dynamic tindakan;
//   dynamic idRujukan;
//   String diagnosis2;
//   String konsulP;
//   String konsulO;
//   String konsulS;
//   String konsulA;
//   dynamic bloodPressure;
//   dynamic medicine;
//   List<String> diagnosis;
//   dynamic visitingFees;
//   dynamic patientNotes;
//   dynamic referenceBy;
//   dynamic referenceTo;
//   String date;
//   dynamic idInvoice;
//   String tanggalTime;
//   String rm;
//   String nama;
//   String dokter;
//   String poli;
//   List<String> keluhan;
//   List<String> obat;

//   factory DetailMedicalRecord.fromJson(Map<String, dynamic> json) => DetailMedicalRecord(
//         id: json["id"],
//         appointmentId: json["appointment_id"],
//         patientId: json["patient_id"],
//         patientType: json["patient_type"] ?? "",
//         doctorId: json["doctor_id"] ?? "",
//         chiefComplain: json["chief_complain"] ?? "",
//         insuranceId: json["insurance_id"] ?? "",
//         policyNo: json["policy_no"] ?? "",
//         weight: json["weight"] ?? "-",
//         tindakan: json["tindakan"] ?? "",
//         idRujukan: json["id_rujukan"] ?? "",
//         diagnosis2: json["diagnosis_2"] ?? "",
//         konsulP: json["konsul_p"] ?? "",
//         konsulO: json["konsul_o"] ?? "",
//         konsulS: json["konsul_s"] ?? "",
//         konsulA: json["konsul_a"] ?? "",
//         bloodPressure: json["blood_pressure"] ?? "-",
//         medicine: json["medicine"] ?? "",
//         diagnosis: List<String>.from(json["diagnosis"].map((x) => x)),
//         visitingFees: json["visiting_fees"] ?? "",
//         patientNotes: json["patient_notes"] ?? "",
//         referenceBy: json["reference_by"] ?? "",
//         referenceTo: json["reference_to"] ?? "",
//         date: json["date"] ?? "",
//         idInvoice: json["id_invoice"] ?? "",
//         tanggalTime: json["tanggal_time"] ?? "",
//         rm: json["rm"] ?? "",
//         nama: json["nama"] ?? "",
//         dokter: json["dokter"] ?? "",
//         poli: json["poli"] ?? "",
//         // keluhan: (json["keluhan"] == null) ? [] : List<String>.from((json["keluhan"] as List<String>) .map((x) => x.toString())),
//         keluhan: List<String>.from(json["keluhan"].map((x) => x.toString())),
//         obat: List<String>.from(json["obat"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "appointment_id": appointmentId,
//         "patient_id": patientId,
//         "patient_type": patientType,
//         "doctor_id": doctorId,
//         "chief_complain": chiefComplain,
//         "insurance_id": insuranceId,
//         "policy_no": policyNo,
//         "weight": weight,
//         "tindakan": tindakan,
//         "id_rujukan": idRujukan,
//         "diagnosis_2": diagnosis2,
//         "konsul_p": konsulP,
//         "konsul_o": konsulO,
//         "konsul_s": konsulS,
//         "konsul_a": konsulA,
//         "blood_pressure": bloodPressure,
//         "medicine": medicine,
//         "diagnosis": List<dynamic>.from(diagnosis.map((x) => x)),
//         "visiting_fees": visitingFees,
//         "patient_notes": patientNotes,
//         "reference_by": referenceBy,
//         "reference_to": referenceTo,
//         "date": date,
//         "id_invoice": idInvoice,
//         "tanggal_time": tanggalTime,
//         "rm": rm,
//         "nama": nama,
//         "dokter": dokter,a
//         "poli": poli,
//         "keluhan": List<dynamic>.from(keluhan.map((x) => x)),
//         "obat": List<dynamic>.from(obat.map((x) => x)),
//       };
// }

// // (json['blabla'] as List).map((e) => Kelas.fromjson(e)).toList()

// To parse this JSON data, do
//
//     final detailMedicalRecord = detailMedicalRecordFromJson(jsonString);

import 'dart:convert';

DetailMedicalRecord detailMedicalRecordFromJson(String str) => DetailMedicalRecord.fromJson(json.decode(str));

String detailMedicalRecordToJson(DetailMedicalRecord data) => json.encode(data.toJson());

class DetailMedicalRecord {
  DetailMedicalRecord({
    required this.id,
    required this.appointmentId,
    required this.patientId,
    required this.patientType,
    required this.doctorId,
    this.chiefComplain,
    this.insuranceId,
    this.policyNo,
    this.weight,
    this.tindakan,
    this.idRujukan,
    required this.diagnosis2,
    required this.konsulP,
    required this.konsulO,
    required this.konsulS,
    required this.konsulA,
    this.bloodPressure,
    this.medicine,
    required this.diagnosis,
    this.visitingFees,
    this.patientNotes,
    this.referenceBy,
    this.referenceTo,
    required this.date,
    this.idInvoice,
    required this.tanggalTime,
    required this.appointmentData,
    required this.rm,
    required this.nama,
    required this.datapasien,
    required this.dokter,
    required this.poli,
    required this.keluhan,
    required this.obat,
  });

  String id;
  String appointmentId;
  String patientId;
  String patientType;
  String doctorId;
  dynamic chiefComplain;
  dynamic insuranceId;
  dynamic policyNo;
  dynamic weight;
  dynamic tindakan;
  dynamic idRujukan;
  String diagnosis2;
  String konsulP;
  String konsulO;
  String konsulS;
  String konsulA;
  dynamic bloodPressure;
  dynamic medicine;
  List<String> diagnosis;
  dynamic visitingFees;
  dynamic patientNotes;
  dynamic referenceBy;
  dynamic referenceTo;
  String date;
  dynamic idInvoice;
  String tanggalTime;
  AppointmentData appointmentData;
  String rm;
  String nama;
  Datapasien datapasien;
  String dokter;
  String poli;
  List<String> keluhan;
  List<String> obat;

  factory DetailMedicalRecord.fromJson(Map<String, dynamic> json) => DetailMedicalRecord(
        id: json["id"],
        appointmentId: json["appointment_id"],
        patientId: json["patient_id"] ?? "",
        patientType: json["patient_type"] ?? "",
        doctorId: json["doctor_id"] ?? "",
        chiefComplain: json["chief_complain"] ?? "",
        insuranceId: json["insurance_id"] ?? "",
        policyNo: json["policy_no"] ?? "",
        weight: json["weight"] ?? "-",
        tindakan: json["tindakan"] ?? "",
        idRujukan: json["id_rujukan"] ?? "",
        diagnosis2: json["diagnosis_2"] ?? "",
        konsulP: json["konsul_p"] ?? "",
        konsulO: json["konsul_o"] ?? "",
        konsulS: json["konsul_s"] ?? "",
        konsulA: json["konsul_a"] ?? "",
        bloodPressure: json["blood_pressure"] ?? "-",
        medicine: json["medicine"] ?? "",
        diagnosis: List<String>.from(json["diagnosis"].map((x) => x)),
        visitingFees: json["visiting_fees"] ?? "",
        patientNotes: json["patient_notes"] ?? "",
        referenceBy: json["reference_by"] ?? "",
        referenceTo: json["reference_to"] ?? "",
        date: json["date"] ?? "",
        idInvoice: json["id_invoice"] ?? "",
        tanggalTime: json["tanggal_time"] ?? "",
        appointmentData: AppointmentData.fromJson(json["appointment_data"]),
        rm: json["rm"] ?? "",
        nama: json["nama"] ?? "",
        datapasien: Datapasien.fromJson(json["datapasien"]),
        dokter: json["dokter"] ?? "",
        poli: json["poli"] ?? "",
        keluhan: List<String>.from(json["keluhan"].map((x) => x)),
        obat: List<String>.from(json["obat"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "appointment_id": appointmentId,
        "patient_id": patientId,
        "patient_type": patientType,
        "doctor_id": doctorId,
        "chief_complain": chiefComplain,
        "insurance_id": insuranceId,
        "policy_no": policyNo,
        "weight": weight,
        "tindakan": tindakan,
        "id_rujukan": idRujukan,
        "diagnosis_2": diagnosis2,
        "konsul_p": konsulP,
        "konsul_o": konsulO,
        "konsul_s": konsulS,
        "konsul_a": konsulA,
        "blood_pressure": bloodPressure,
        "medicine": medicine,
        "diagnosis": List<String>.from(diagnosis.map((x) => x)),
        "visiting_fees": visitingFees,
        "patient_notes": patientNotes,
        "reference_by": referenceBy,
        "reference_to": referenceTo,
        "date": date,
        "id_invoice": idInvoice,
        "tanggal_time": tanggalTime,
        "appointment_data": appointmentData.toJson(),
        "rm": rm,
        "nama": nama,
        "datapasien": datapasien.toJson(),
        "dokter": dokter,
        "poli": poli,
        "keluhan": List<dynamic>.from(keluhan.map((x) => x)),
        "obat": List<dynamic>.from(obat.map((x) => x)),
      };
}

class AppointmentData {
  AppointmentData({
    required this.id,
    required this.nomor,
    this.appointmentId,
    required this.patientId,
    required this.departmentId,
    required this.doctorId,
    this.scheduleId,
    this.serialNo,
    required this.date,
    required this.problem,
    required this.createdBy,
    required this.createDate,
    required this.status,
    required this.isVaksin,
  });

  String id;
  String nomor;
  dynamic appointmentId;
  String patientId;
  String departmentId;
  String doctorId;
  dynamic scheduleId;
  dynamic serialNo;
  String date;
  String problem;
  String createdBy;
  String createDate;
  String status;
  String isVaksin;

  factory AppointmentData.fromJson(Map<String, dynamic> json) => AppointmentData(
        id: json["id"],
        nomor: json["nomor"] ?? "",
        appointmentId: json["appointment_id"] ?? "",
        patientId: json["patient_id"] ?? "",
        departmentId: json["department_id"] ?? "",
        doctorId: json["doctor_id"] ?? "",
        scheduleId: json["schedule_id"] ?? "",
        serialNo: json["serial_no"] ?? "",
        date: json["date"] ?? "",
        problem: json["problem"] ?? "",
        createdBy: json["created_by"] ?? "",
        createDate: json["create_date"] ?? "",
        status: json["status"],
        isVaksin: json["is_vaksin"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "appointment_id": appointmentId,
        "patient_id": patientId,
        "department_id": departmentId,
        "doctor_id": doctorId,
        "schedule_id": scheduleId,
        "serial_no": serialNo,
        "date": date,
        "problem": problem,
        "created_by": createdBy,
        "create_date": createDate,
        "status": status,
        "is_vaksin": isVaksin,
      };
}

class Datapasien {
  Datapasien({
    required this.id,
    this.patientId,
    required this.fname,
    this.firstname,
    this.lastname,
    this.username,
    required this.email,
    required this.password,
    required this.phone,
    this.mobile,
    required this.address,
    required this.sex,
    required this.bloodGroup,
    required this.dateOfBirth,
    this.affliate,
    required this.picture,
    this.createdBy,
    required this.createDate,
    required this.status,
    required this.agama,
    required this.statusPasien,
    required this.alergi,
    this.namaOrangtua,
    this.nik,
    required this.kota,
    this.tmptLahir,
    required this.kecamatan,
    required this.kelurahan,
    required this.rw,
    required this.rt,
    this.userRole,
    required this.pin,
    required this.upline,
    required this.pincode,
    required this.tipePasien,
  });

  String id;
  dynamic patientId;
  String fname;
  dynamic firstname;
  dynamic lastname;
  dynamic username;
  String email;
  String password;
  String phone;
  dynamic mobile;
  String address;
  String sex;
  String bloodGroup;
  String dateOfBirth;
  dynamic affliate;
  String picture;
  dynamic createdBy;
  String createDate;
  String status;
  String agama;
  String statusPasien;
  String alergi;
  dynamic namaOrangtua;
  dynamic nik;
  String kota;
  dynamic tmptLahir;
  String kecamatan;
  String kelurahan;
  String rw;
  String rt;
  dynamic userRole;
  String pin;
  String upline;
  String pincode;
  String tipePasien;

  factory Datapasien.fromJson(Map<String, dynamic> json) => Datapasien(
        id: json["id"],
        patientId: json["patient_id"],
        fname: json["fname"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        phone: json["phone"] ?? "",
        mobile: json["mobile"] ?? "",
        address: json["address"] ?? "",
        sex: json["sex"] ?? "",
        bloodGroup: json["blood_group"] ?? "",
        dateOfBirth: json["date_of_birth"] ?? "",
        affliate: json["affliate"] ?? "",
        picture: json["picture"] ?? "",
        createdBy: json["created_by"] ?? "",
        createDate: json["create_date"] ?? "",
        status: json["status"] ?? "",
        agama: json["agama"] ?? "",
        statusPasien: json["status_pasien"] ?? "",
        alergi: json["alergi"] ?? "",
        namaOrangtua: json["nama_orangtua"] ?? "",
        nik: json["nik"] ?? "",
        kota: json["kota"] ?? "",
        tmptLahir: json["tmpt_lahir"] ?? "",
        kecamatan: json["kecamatan"] ?? "",
        kelurahan: json["kelurahan"] ?? "",
        rw: json["rw"] ?? "",
        rt: json["rt"] ?? "",
        userRole: json["user_role"] ?? "",
        pin: json["pin"] ?? "",
        upline: json["upline"] ?? "",
        pincode: json["pincode"] ?? "",
        tipePasien: json["tipe_pasien"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "fname": fname,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "mobile": mobile,
        "address": address,
        "sex": sex,
        "blood_group": bloodGroup,
        "date_of_birth": dateOfBirth,
        "affliate": affliate,
        "picture": picture,
        "created_by": createdBy,
        "create_date": createDate,
        "status": status,
        "agama": agama,
        "status_pasien": statusPasien,
        "alergi": alergi,
        "nama_orangtua": namaOrangtua,
        "nik": nik,
        "kota": kota,
        "tmpt_lahir": tmptLahir,
        "kecamatan": kecamatan,
        "kelurahan": kelurahan,
        "rw": rw,
        "rt": rt,
        "user_role": userRole,
        "pin": pin,
        "upline": upline,
        "pincode": pincode,
        "tipe_pasien": tipePasien,
      };
}
