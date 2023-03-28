// To parse this JSON data, do
//
//     final patientQueue = patientQueueFromJson(jsonString);

import 'dart:convert';

PatientQueue patientQueueFromJson(String str) => PatientQueue.fromJson(json.decode(str));

String patientQueueToJson(PatientQueue data) => json.encode(data.toJson());

class PatientQueue {
  PatientQueue({
    required this.id,
    required this.nomor,
    this.appointmentId,
    required this.patientId,
    required this.departmentId,
    required this.doctorId,
    required this.scheduleId,
    required this.serialNo,
    required this.date,
    required this.problem,
    required this.createdBy,
    required this.createDate,
    required this.status,
    required this.isVaksin,
    required this.formatNomor,
    required this.statusKedatanganDokter,
    required this.antrianSedangDilayani,
    required this.jumlahAntrian,
    required this.namaPasien,
    required this.namaDokter,
    required this.namaPoli,
    required this.formatJam,
    required this.rm,
  });

  String id;
  String nomor;
  dynamic appointmentId;
  String patientId;
  String departmentId;
  String doctorId;
  String scheduleId;
  String serialNo;
  String date;
  String problem;
  String createdBy;
  String createDate;
  String status;
  String isVaksin;
  String formatNomor;
  String statusKedatanganDokter;
  String antrianSedangDilayani;
  int jumlahAntrian;
  String namaPasien;
  String namaDokter;
  String namaPoli;
  String formatJam;
  String rm;

  factory PatientQueue.fromJson(Map<String, dynamic> json) => PatientQueue(
        id: json["id"] ?? "",
        nomor: json["nomor"] ?? 123,
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
        status: json["status"] ?? "",
        isVaksin: json["is_vaksin"] ?? "",
        formatNomor: json["format_nomor"] ?? "",
        statusKedatanganDokter: json["status_kedatangan_dokter"] ?? "",
        antrianSedangDilayani: json["antrian_sedang_dilayani"] ?? "",
        jumlahAntrian: json["jumlah_antrian"] ?? "",
        namaPasien: json["nama_pasien"] ?? "",
        namaDokter: json["nama_dokter"] ?? "",
        namaPoli: json["nama_poli"] ?? "",
        formatJam: json["format_jam"] ?? "",
        rm: json["rm"] ?? "",
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
        "format_nomor": formatNomor,
        "status_kedatangan_dokter": statusKedatanganDokter,
        "antrian_sedang_dilayani": antrianSedangDilayani,
        "jumlah_antrian": jumlahAntrian,
        "nama_pasien": namaPasien,
        "nama_dokter": namaDokter,
        "nama_poli": namaPoli,
        "format_jam": formatJam,
        "rm": rm,
      };
  static List<PatientQueue> listFromJson(List<dynamic> list) => List<PatientQueue>.from(list.map((x) => PatientQueue.fromJson(x)));
}
