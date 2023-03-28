// // To parse this JSON data, do
// //
// //     final person = personFromJson(jsonString);

// import 'dart:convert';

// Person personFromJson(String str) => Person.fromJson(json.decode(str));

// String personToJson(Person data) => json.encode(data.toJson());

// class Person {
//     Person({
//         required this.id,
//         this.patientId,
//         required this.fname,
//         this.firstname,
//         this.lastname,
//         this.username,
//         this.email,
//         this.password,
//         required this.phone,
//         required this.mobile,
//         required this.address,
//         required this.sex,
//         this.bloodGroup,
//         required this.dateOfBirth,
//         this.affliate,
//         this.picture,
//         required this.createdBy,
//         required this.createDate,
//         required this.status,
//         required this.agama,
//         this.statusPasien,
//         this.alergi,
//         required this.namaOrangtua,
//         this.nik,
//         required this.kota,
//         this.tmptLahir,
//         required this.kecamatan,
//         required this.kelurahan,
//         required this.rw,
//         required this.rt,
//         this.userRole,
//         this.token,
//         required this.pin,
//         required this.upline,
//         required this.pincode,
//     });

//     String id;
//     dynamic patientId;
//     String fname;
//     dynamic firstname;
//     dynamic lastname;
//     dynamic username;
//     dynamic email;
//     dynamic password;
//     String phone;
//     String mobile;
//     String address;
//     String sex;
//     dynamic bloodGroup;
//     String dateOfBirth;
//     dynamic affliate;
//     dynamic picture;
//     String createdBy;
//     String createDate;
//     String status;
//     String agama;
//     dynamic statusPasien;
//     dynamic alergi;
//     String namaOrangtua;
//     dynamic nik;
//     String kota;
//     dynamic tmptLahir;
//     String kecamatan;
//     String kelurahan;
//     String rw;
//     String rt;
//     dynamic userRole;
//     dynamic token;
//     String pin;
//     String upline;
//     String pincode;

//     factory Person.fromJson(Map<String, dynamic> json) => Person(
//         id: json["id"] ?? "",
//         patientId: json["patient_id"],
//         fname: json["fname"]?? "",
//         firstname: json["firstname"]?? "",
//         lastname: json["lastname"]?? "",
//         username: json["username"]?? "",
//         email: json["email"],
//         password: json["password"],
//         phone: json["phone"] ?? "",
//         mobile: json["mobile"]?? "",
//         address: json["address"]?? "",
//         sex: json["sex"]?? "",
//         bloodGroup: json["blood_group"],
//         dateOfBirth: json["date_of_birth"]?? "",
//         affliate: json["affliate"]?? "",
//         picture: json["picture"],
//         createdBy: json["created_by"]?? "",
//         createDate: json["create_date"]?? "",
//         status: json["status"]?? "",
//         agama: json["agama"]?? "",
//         statusPasien: json["status_pasien"]?? "",
//         alergi: json["alergi"]?? "",
//         namaOrangtua: json["nama_orangtua"]?? "",
//         nik: json["nik"]?? "",
//         kota: json["kota"]?? "",
//         tmptLahir: json["tmpt_lahir"]?? "",
//         kecamatan: json["kecamatan"]?? "",
//         kelurahan: json["kelurahan"]?? "",
//         rw: json["rw"]?? "",
//         rt: json["rt"]?? "",
//         userRole: json["user_role"]?? "",
//         token: json["token"]?? "",
//         pin: json["pin"]?? "",
//         upline: json["upline"]?? "",
//         pincode: json["pincode"]?? "",
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "patient_id": patientId,
//         "fname": fname,
//         "firstname": firstname,
//         "lastname": lastname,
//         "username": username,
//         "email": email,
//         "password": password,
//         "phone": phone,
//         "mobile": mobile,
//         "address": address,
//         "sex": sex,
//         "blood_group": bloodGroup,
//         "date_of_birth": dateOfBirth,
//         "affliate": affliate,
//         "picture": picture,
//         "created_by": createdBy,
//         "create_date": createDate,
//         "status": status,
//         "agama": agama,
//         "status_pasien": statusPasien,
//         "alergi": alergi,
//         "nama_orangtua": namaOrangtua,
//         "nik": nik,
//         "kota": kota,
//         "tmpt_lahir": tmptLahir,
//         "kecamatan": kecamatan,
//         "kelurahan": kelurahan,
//         "rw": rw,
//         "rt": rt,
//         "user_role": userRole,
//         "token": token,
//         "pin": pin,
//         "upline": upline,
//         "pincode": pincode,
//     };
// }

// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
    Patient({
        required this.id,
        this.patientId,
        required this.fname,
        this.firstname,
        this.lastname,
        this.username,
        this.email,
        this.password,
        required this.phone,
        required this.mobile,
        required this.address,
        required this.sex,
        this.bloodGroup,
        required this.dateOfBirth,
        this.affliate,
        this.picture,
        required this.createdBy,
        required this.createDate,
        required this.status,
        required this.agama,
        this.statusPasien,
        this.alergi,
        required this.namaOrangtua,
        this.nik,
        required this.kota,
        this.tmptLahir,
        required this.kecamatan,
        required this.kelurahan,
        required this.rw,
        required this.rt,
        this.userRole,
        this.token,
        required this.pin,
        required this.upline,
        required this.pincode,
        required this.tipePasien,
        required this.rm,
    });

    String id;
    dynamic patientId;
    String fname;
    dynamic firstname;
    dynamic lastname;
    dynamic username;
    dynamic email;
    dynamic password;
    String phone;
    String mobile;
    String address;
    String sex;
    dynamic bloodGroup;
    String dateOfBirth;
    dynamic affliate;
    dynamic picture;
    String createdBy;
    String createDate;
    String status;
    String agama;
    dynamic statusPasien;
    dynamic alergi;
    String namaOrangtua;
    dynamic nik;
    String kota;
    dynamic tmptLahir;
    String kecamatan;
    String kelurahan;
    String rw;
    String rt;
    dynamic userRole;
    dynamic token;
    String pin;
    String upline;
    String pincode;
    String tipePasien;
    String rm;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"]?? "",
        patientId: json["patient_id"]?? "",
        fname: json["fname"]?? "",
        firstname: json["firstname"]?? "",
        lastname: json["lastname"]?? "",
        username: json["username"]?? "",
        email: json["email"]?? "",
        password: json["password"],
        phone: json["phone"]?? "",
        mobile: json["mobile"]?? "",
        address: json["address"]?? "",
        sex: json["sex"]?? "",
        bloodGroup: json["blood_group"]?? "",
        dateOfBirth: json["date_of_birth"]?? DateTime.now().toString(),
        affliate: json["affliate"]?? "",
        picture: json["picture"]?? "",
        createdBy: json["created_by"]?? "",
        createDate: json["create_date"]?? "",
        status: json["status"]?? "",
        agama: json["agama"]?? "",
        statusPasien: json["status_pasien"]?? "",
        alergi: json["alergi"]?? "",
        namaOrangtua: json["nama_orangtua"]?? "",
        nik: json["nik"]?? "",
        kota: json["kota"]?? "",
        tmptLahir: json["tmpt_lahir"]?? "",
        kecamatan: json["kecamatan"]?? "",
        kelurahan: json["kelurahan"]?? "",
        rw: json["rw"]?? "",
        rt: json["rt"]?? "",
        userRole: json["user_role"]?? "",
        token: json["token"]?? "",
        pin: json["pin"]?? "",
        upline: json["upline"]?? "",
        pincode: json["pincode"]?? "",
        tipePasien: json["tipe_pasien"]?? "",
        rm: json["RM"]?? "",
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
        "token": token,
        "pin": pin,
        "upline": upline,
        "pincode": pincode,
        "tipe_pasien": tipePasien,
        "RM": rm,
    };

    static List<Patient> listFromJson(List<dynamic> list) => 
      List<Patient>.from(list.map((x) => Patient.fromJson(x)));
}
