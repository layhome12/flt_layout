// To parse this JSON data, do
//
//     final tourism = tourismFromJson(jsonString);

import 'dart:convert';

TourismResult tourismFromJson(String str) => TourismResult.fromJson(json.decode(str));

String tourismToJson(TourismResult data) => json.encode(data.toJson());

class TourismResult {
  TourismResult({
    required this.statusCode,
    required this.listData,
  });

  int statusCode;
  List<TourismDetail> listData;

  factory TourismResult.fromJson(Map<String, dynamic> json) => TourismResult(
    statusCode: json["statusCode"],
    listData: List<TourismDetail>.from(json["listData"].map((x) => TourismDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "listData": List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class TourismDetail {
  TourismDetail({
    required this.id,
    required this.wisataNama,
    required this.wisataDeskripsi,
    required this.wisataLokasi,
    required this.wisataImg,
    required this.wisataJamKerja,
    required this.wisataHargaHtm,
    required this.wisataHariBuka,
    required this.createdAt,
    required this.updatedAt,
    required this.wisataListImg,
  });

  int id;
  String wisataNama;
  String wisataDeskripsi;
  String wisataLokasi;
  String wisataImg;
  String wisataJamKerja;
  int wisataHargaHtm;
  String wisataHariBuka;
  dynamic createdAt;
  dynamic updatedAt;
  List<String> wisataListImg;

  factory TourismDetail.fromJson(Map<String, dynamic> json) => TourismDetail(
    id: json["id"],
    wisataNama: json["wisata_nama"],
    wisataDeskripsi: json["wisata_deskripsi"],
    wisataLokasi: json["wisata_lokasi"],
    wisataImg: json["wisata_img"] == null ? null : json["wisata_img"],
    wisataJamKerja: json["wisata_jam_kerja"],
    wisataHargaHtm: json["wisata_harga_htm"],
    wisataHariBuka: json["wisata_hari_buka"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    wisataListImg: List<String>.from(json["wisata_list_img"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wisata_nama": wisataNama,
    "wisata_deskripsi": wisataDeskripsi,
    "wisata_lokasi": wisataLokasi,
    "wisata_img": wisataImg == null ? null : wisataImg,
    "wisata_jam_kerja": wisataJamKerja,
    "wisata_harga_htm": wisataHargaHtm,
    "wisata_hari_buka": wisataHariBuka,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "wisata_list_img": List<dynamic>.from(wisataListImg.map((x) => x)),
  };
}
