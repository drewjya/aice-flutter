import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:aice/src/feature/absent/model/produk_report_model.dart';

class CheckOutModel {
  final String namaToko;
  final String kodeToko;
  final List<ProdukReportModel> listProduk;
  Timestamp? timestamp;
  final Timestamp waktuCheckOut;
  CheckOutModel(
      {required this.namaToko,
      required this.kodeToko,
      required this.listProduk,
      this.timestamp})
      : waktuCheckOut = timestamp ?? Timestamp.now();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaToko': namaToko,
      'kodeToko': kodeToko,
      'waktuCheckOut': waktuCheckOut,
      'listProduk': listProduk.map((x) => x.toMap()).toList(),
    };
  }

  factory CheckOutModel.fromMap(Map<String, dynamic> map) {
    return CheckOutModel(
      namaToko: map['namaToko'] as String,
      kodeToko: map['kodeToko'] as String,
      timestamp: map['waktuCheckOut'] as Timestamp,
      listProduk: List<ProdukReportModel>.from(
        (map['listProduk'] as List).map(
          (x) => ProdukReportModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckOutModel.fromJson(String source) =>
      CheckOutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckOutModel(namaToko: $namaToko, kodeToko: $kodeToko, waktuCheckOut: $waktuCheckOut, listProduk: $listProduk)';
  }

  @override
  bool operator ==(covariant CheckOutModel other) {
    if (identical(this, other)) return true;

    return other.namaToko == namaToko &&
        other.kodeToko == kodeToko &&
        other.waktuCheckOut == waktuCheckOut &&
        listEquals(other.listProduk, listProduk);
  }

  @override
  int get hashCode {
    return namaToko.hashCode ^
        kodeToko.hashCode ^
        waktuCheckOut.hashCode ^
        listProduk.hashCode;
  }
}
