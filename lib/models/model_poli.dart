// To parse this JSON data, do
//
//     final poli = poliFromJson(jsonString);

import 'dart:convert';

Poli poliFromJson(String str) => Poli.fromJson(json.decode(str));

String poliToJson(Poli data) => json.encode(data.toJson());

class Poli {
  Poli({
    required this.dprtId,
    required this.mainId,
    required this.name,
    required this.flaticon,
    required this.description,
    required this.image,
    required this.status,
    required this.meta,
    required this.tanggal,
    required this.jadwal,
    required this.dokter,
  });

  String dprtId;
  String mainId;
  String name;
  String flaticon;
  String description;
  String image;
  String status;
  List<dynamic> meta;
  List<dynamic> tanggal;
  List<dynamic> jadwal;
  List<dynamic> dokter;

  factory Poli.fromJson(Map<String, dynamic> json) => Poli(
        dprtId: json["dprt_id"],
        mainId: json["main_id"],
        name: json["name"],
        flaticon: json["flaticon"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        tanggal: List<dynamic>.from(json["tanggal"].map((x) => x)),
        jadwal: List<dynamic>.from(json["jadwal"].map((x) => x)),
        dokter: List<dynamic>.from(json["dokter"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "dprt_id": dprtId,
        "main_id": mainId,
        "name": name,
        "flaticon": flaticon,
        "description": description,
        "image": image,
        "status": status,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "tanggal": List<dynamic>.from(tanggal.map((x) => x)),
        "jadwal": List<dynamic>.from(jadwal.map((x) => x)),
        "dokter": List<dynamic>.from(dokter.map((x) => x)),
      };

  static List<Poli> listFromJson(List<dynamic> list) => List<Poli>.from(list.map((x) => Poli.fromJson(x)));
}
