import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    required this.poli,
    required this.idpoli,
    required this.namadokter,
    required this.userId,
    required this.username,
    required this.fname,
    this.firstname,
    this.lastname,
    required this.email,
    required this.hp,
    required this.hp2,
    required this.userRole,
    required this.departmentId,
    required this.picture,
    required this.dateOfBirth,
    required this.sex,
    required this.address,
    required this.kota,
    required this.logindate,
    required this.biografi,
    this.token,
    required this.spesialis,
    required this.bloodGroup,
    this.vacation,
    this.facebook,
    this.twitter,
    this.youtube,
    this.dribbble,
    this.behance,
    required this.createdBy,
    this.createDate,
    required this.updateDate,
    required this.status,
    required this.isHadir,
    required this.tarif,
    required this.bukatutup,
    required this.jadwaldokter,
    required this.jadwaldokter2,
    required this.jadwalPagi,
    required this.jadwalMalam,
  });

  String poli;
  String idpoli;
  String namadokter;
  String userId;
  String username;
  String fname;
  dynamic firstname;
  dynamic lastname;
  String email;
  String hp;
  String hp2;
  String userRole;
  String departmentId;
  String picture;
  String dateOfBirth;
  String sex;
  String address;
  String kota;
  String logindate;
  String biografi;
  dynamic token;
  String spesialis;
  String bloodGroup;
  dynamic vacation;
  dynamic facebook;
  dynamic twitter;
  dynamic youtube;
  dynamic dribbble;
  dynamic behance;
  String createdBy;
  dynamic createDate;
  String updateDate;
  String status;
  String isHadir;
  String tarif;
  String bukatutup;
  Jadwaldokter jadwaldokter;
  Jadwaldokter jadwaldokter2;
  Jadwal jadwalPagi;
  Jadwal jadwalMalam;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        poli: json["poli"] ?? "",
        idpoli: json["idpoli"] ?? "",
        namadokter: json["namadokter"] ?? "",
        userId: json["user_id"] ?? "",
        username: json["username"] ?? "",
        fname: json["fname"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        email: json["email"] ?? "",
        hp: json["hp"] ?? "",
        hp2: json["hp2"] ?? "",
        userRole: json["user_role"] ?? "",
        departmentId: json["department_id"] ?? "",
        picture: json["picture"] ?? "",
        dateOfBirth: json["date_of_birth"] ?? "",
        sex: json["sex"] ?? "",
        address: json["address"] ?? "",
        kota: json["kota"] ?? "",
        logindate: json["logindate"] ?? "",
        biografi: json["biografi"] ?? "",
        token: json["token"] ?? "",
        spesialis: json["spesialis"] ?? "",
        bloodGroup: json["blood_group"] ?? "",
        vacation: json["vacation"] ?? "",
        facebook: json["facebook"] ?? "",
        twitter: json["twitter"] ?? "",
        youtube: json["youtube"] ?? "",
        dribbble: json["dribbble"] ?? "",
        behance: json["behance"] ?? "",
        createdBy: json["created_by"] ?? "",
        createDate: json["create_date"] ?? "",
        updateDate: json["update_date"] ?? "",
        status: json["status"] ?? "",
        isHadir: json["is_hadir"] ?? "",
        tarif: json["tarif"] ?? "",
        bukatutup: json["bukatutup"] ?? "",
        jadwaldokter: Jadwaldokter.fromJson(json["jadwaldokter"]),
        jadwaldokter2: Jadwaldokter.fromJson(json["jadwaldokter2"]),
        jadwalPagi: Jadwal.fromJson(json["jadwalPagi"]),
        jadwalMalam: Jadwal.fromJson(json["jadwalMalam"]),
      );

  Map<String, dynamic> toJson() => {
        "poli": poli,
        "idpoli": idpoli,
        "namadokter": namadokter,
        "user_id": userId,
        "username": username,
        "fname": fname,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "hp": hp,
        "hp2": hp2,
        "user_role": userRole,
        "department_id": departmentId,
        "picture": picture,
        "date_of_birth": dateOfBirth,
        "sex": sex,
        "address": address,
        "kota": kota,
        "logindate": logindate,
        "biografi": biografi,
        "token": token,
        "spesialis": spesialis,
        "blood_group": bloodGroup,
        "vacation": vacation,
        "facebook": facebook,
        "twitter": twitter,
        "youtube": youtube,
        "dribbble": dribbble,
        "behance": behance,
        "created_by": createdBy,
        "create_date": createDate,
        "update_date": updateDate,
        "status": status,
        "is_hadir": isHadir,
        "tarif": tarif,
        "bukatutup": bukatutup,
        "jadwaldokter": jadwaldokter.toJson(),
        "jadwaldokter2": jadwaldokter2.toJson(),
        "jadwalPagi": jadwalPagi.toJson(),
        "jadwalMalam": jadwalMalam.toJson(),
      };
  static List<Doctor> listFromJson(List<dynamic> list) => List<Doctor>.from(list.map((x) => Doctor.fromJson(x)));
}

class Jadwal {
  Jadwal({
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat,
    required this.sabtu,
    required this.minggu,
  });

  String senin;
  String selasa;
  String rabu;
  String kamis;
  String jumat;
  String sabtu;
  String minggu;

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        senin: json["senin"],
        selasa: json["selasa"],
        rabu: json["rabu"],
        kamis: json["kamis"],
        jumat: json["jumat"],
        sabtu: json["sabtu"],
        minggu: json["minggu"],
      );

  Map<String, dynamic> toJson() => {
        "senin": senin,
        "selasa": selasa,
        "rabu": rabu,
        "kamis": kamis,
        "jumat": jumat,
        "sabtu": sabtu,
        "minggu": minggu,
      };
}

class Jadwaldokter {
  Jadwaldokter({
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat,
    required this.sabtu,
  });

  String senin;
  String selasa;
  String rabu;
  String kamis;
  String jumat;
  String sabtu;

  factory Jadwaldokter.fromJson(Map<String, dynamic> json) => Jadwaldokter(
        senin: json["Senin"],
        selasa: json["Selasa"],
        rabu: json["Rabu"],
        kamis: json["Kamis"],
        jumat: json["Jumat"],
        sabtu: json["Sabtu"],
      );

  Map<String, dynamic> toJson() => {
        "Senin": senin,
        "Selasa": selasa,
        "Rabu": rabu,
        "Kamis": kamis,
        "Jumat": jumat,
        "Sabtu": sabtu,
      };
}
