import 'dart:convert';

import 'package:aice/src/src.dart';

class ProdukReportModel {
  final String namaProduk;
  final String kodeProduk;
  final int jumlahProduk;
  final int harga;
  ProdukReportModel({
    required this.namaProduk,
    required this.kodeProduk,
    required this.jumlahProduk,
    required this.harga,
  });

  int get totalPrice => harga * jumlahProduk;
  ProdukReportModel copyWith({
    String? namaProduk,
    String? kodeProduk,
    int? jumlahProduk,
    int? harga,
  }) {
    return ProdukReportModel(
      namaProduk: namaProduk ?? this.namaProduk,
      kodeProduk: kodeProduk ?? this.kodeProduk,
      jumlahProduk: jumlahProduk ?? this.jumlahProduk,
      harga: harga ?? this.harga,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produkId': kodeProduk,
      'quantity': jumlahProduk,
      'harga': harga,
    };
  }

  factory ProdukReportModel.fromMap(Map<String, dynamic> map) {
    dPrint(map.keys);
    final data = ProdukModel.produkList()
        .where((element) => element.kodeProduk == map['produkId'] as String)
        .toList();
    return ProdukReportModel(
      namaProduk: data.isNotEmpty ? data[0].namaProduk : "-",
      kodeProduk: map['produkId'] as String,
      jumlahProduk: map['quantity'] as int,
      harga: map['harga'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukReportModel.fromJson(String source) =>
      ProdukReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProdukReportModel(namaProduk: $namaProduk, kodeProduk: $kodeProduk, jumlahProduk: $jumlahProduk, harga: $harga)';
  }

  @override
  bool operator ==(covariant ProdukReportModel other) {
    if (identical(this, other)) return true;

    return other.namaProduk == namaProduk &&
        other.kodeProduk == kodeProduk &&
        other.jumlahProduk == jumlahProduk &&
        other.harga == harga;
  }

  @override
  int get hashCode {
    return namaProduk.hashCode ^
        kodeProduk.hashCode ^
        jumlahProduk.hashCode ^
        harga.hashCode;
  }
}
