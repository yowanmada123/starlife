// To parse this JSON data, do
//
//     final responQueue = responQueueFromJson(jsonString);

import 'dart:convert';

ResponQueue responQueueFromJson(String str) => ResponQueue.fromJson(json.decode(str));

String responQueueToJson(ResponQueue data) => json.encode(data.toJson());

class ResponQueue {
  ResponQueue({
    required this.patientId,
    required this.doctorId,
    required this.date,
    required this.status,
    required this.problem,
    required this.createDate,
    required this.nomor,
    required this.createdBy,
    required this.scheduleId,
    required this.serialNo,
    required this.departmentId,
    required this.isVaksin,
    required this.namaPasien,
    required this.namaDokter,
    required this.namaPoli,
    required this.formatJam,
    required this.formatNomor,
    required this.statusKedatanganDokter,
    required this.antrianSedangDilayani,
    required this.jumlahAntrian,
  });

  String patientId;
  String doctorId;
  String date;
  int status;
  String problem;
  String createDate;
  int nomor;
  String createdBy;
  String scheduleId;
  int serialNo;
  String departmentId;
  int isVaksin;
  String namaPasien;
  String namaDokter;
  String namaPoli;
  String formatJam;
  String formatNomor;
  String statusKedatanganDokter;
  String antrianSedangDilayani;
  int jumlahAntrian;

  factory ResponQueue.fromJson(Map<String, dynamic> json) => ResponQueue(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        date: json["date"],
        status: json["status"],
        problem: json["problem"],
        createDate: json["create_date"],
        nomor: json["nomor"],
        createdBy: json["created_by"],
        scheduleId: json["schedule_id"],
        serialNo: json["serial_no"],
        departmentId: json["department_id"],
        isVaksin: json["is_vaksin"],
        namaPasien: json["nama_pasien"],
        namaDokter: json["nama_dokter"],
        namaPoli: json["nama_poli"],
        formatJam: json["format_jam"],
        formatNomor: json["format_nomor"],
        statusKedatanganDokter: json["status_kedatangan_dokter"],
        antrianSedangDilayani: json["antrian_sedang_dilayani"],
        jumlahAntrian: json["jumlah_antrian"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "date": date,
        "status": status,
        "problem": problem,
        "create_date": createDate,
        "nomor": nomor,
        "created_by": createdBy,
        "schedule_id": scheduleId,
        "serial_no": serialNo,
        "department_id": departmentId,
        "is_vaksin": isVaksin,
        "nama_pasien": namaPasien,
        "nama_dokter": namaDokter,
        "nama_poli": namaPoli,
        "format_jam": formatJam,
        "format_nomor": formatNomor,
        "status_kedatangan_dokter": statusKedatanganDokter,
        "antrian_sedang_dilayani": antrianSedangDilayani,
        "jumlah_antrian": jumlahAntrian,
      };
  static List<ResponQueue> listFromJson(List<dynamic> list) => List<ResponQueue>.from(list.map((x) => ResponQueue.fromJson(x)));
}
