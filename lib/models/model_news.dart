// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    News({
        required this.id,
        this.deptId,
        required this.title,
        required this.content,
        required this.judul,
        required this.image,
        this.slug,
        required this.idKategori,
        required this.featuredImage,
        required this.createDate,
        required this.createBy,
        required this.status,
    });

    String id;
    dynamic deptId;
    String title;
    String content;
    String judul;
    String image;
    dynamic slug;
    String idKategori;
    String featuredImage;
    DateTime createDate;
    String createBy;
    String status;

    factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        deptId: json["dept_id"],
        title: json["title"],
        content: json["content"],
        judul: json["judul"],
        image: json["image"],
        slug: json["slug"],
        idKategori: json["id_kategori"],
        featuredImage: json["featured_image"],
        createDate: DateTime.parse(json["create_date"]),
        createBy: json["create_by"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dept_id": deptId,
        "title": title,
        "content": content,
        "judul": judul,
        "image": image,
        "slug": slug,
        "id_kategori": idKategori,
        "featured_image": featuredImage,
        "create_date": "${createDate.year.toString().padLeft(4, '0')}-${createDate.month.toString().padLeft(2, '0')}-${createDate.day.toString().padLeft(2, '0')}",
        "create_by": createBy,
        "status": status,
    };

    static List<News> listFromJson(List<dynamic> list) => 
      List<News>.from(list.map((x) => News.fromJson(x)));
}
