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
    required this.rm,
    required this.nama,
    required this.dokter,
    required this.poli,
    required this.keluhan,
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
  String diagnosis;
  dynamic visitingFees;
  dynamic patientNotes;
  dynamic referenceBy;
  dynamic referenceTo;
  DateTime date;
  dynamic idInvoice;
  String tanggalTime;
  String rm;
  String nama;
  String dokter;
  String poli;
  String keluhan;

  factory DetailMedicalRecord.fromJson(Map<String, dynamic> json) => DetailMedicalRecord(
        id: json["id"],
        appointmentId: json["appointment_id"],
        patientId: json["patient_id"],
        patientType: json["patient_type"],
        doctorId: json["doctor_id"],
        chiefComplain: json["chief_complain"],
        insuranceId: json["insurance_id"],
        policyNo: json["policy_no"],
        weight: json["weight"],
        tindakan: json["tindakan"],
        idRujukan: json["id_rujukan"],
        diagnosis2: json["diagnosis_2"],
        konsulP: json["konsul_p"],
        konsulO: json["konsul_o"],
        konsulS: json["konsul_s"],
        konsulA: json["konsul_a"],
        bloodPressure: json["blood_pressure"],
        medicine: json["medicine"],
        diagnosis: json["diagnosis"],
        visitingFees: json["visiting_fees"],
        patientNotes: json["patient_notes"],
        referenceBy: json["reference_by"],
        referenceTo: json["reference_to"],
        date: DateTime.parse(json["date"]),
        idInvoice: json["id_invoice"],
        tanggalTime: json["tanggal_time"],
        rm: json["rm"],
        nama: json["nama"],
        dokter: json["dokter"],
        poli: json["poli"],
        keluhan: json["keluhan"],
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
        "diagnosis": diagnosis,
        "visiting_fees": visitingFees,
        "patient_notes": patientNotes,
        "reference_by": referenceBy,
        "reference_to": referenceTo,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "id_invoice": idInvoice,
        "tanggal_time": tanggalTime,
        "rm": rm,
        "nama": nama,
        "dokter": dokter,
        "poli": poli,
        "keluhan": keluhan,
      };
}
