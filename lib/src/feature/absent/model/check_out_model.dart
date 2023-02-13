// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckOutModel {
  final int kualitasBaik;
  final int kualitasRusak;
  final String papanHargaFreezer;
  final String priceTagTg;
  final String priceTagIsland;
  final String statusPopPromo;
  final int kelengkapanItem;
  final String kebersihanFreezer;
  final String itemKosong;
  final int absensiSpgId;
  CheckOutModel({
    required this.kualitasBaik,
    required this.kualitasRusak,
    required this.papanHargaFreezer,
    required this.priceTagTg,
    required this.priceTagIsland,
    required this.statusPopPromo,
    required this.kelengkapanItem,
    required this.kebersihanFreezer,
    required this.itemKosong,
    required this.absensiSpgId,
  });

  CheckOutModel copyWith({
    int? kualitasBaik,
    int? kualitasRusak,
    String? papanHargaFreezer,
    String? priceTagTg,
    String? priceTagIsland,
    String? statusPopPromo,
    int? kelengkapanItem,
    String? kebersihanFreezer,
    String? itemKosong,
    int? absensiSpgId,
  }) {
    return CheckOutModel(
      kualitasBaik: kualitasBaik ?? this.kualitasBaik,
      kualitasRusak: kualitasRusak ?? this.kualitasRusak,
      papanHargaFreezer: papanHargaFreezer ?? this.papanHargaFreezer,
      priceTagTg: priceTagTg ?? this.priceTagTg,
      priceTagIsland: priceTagIsland ?? this.priceTagIsland,
      statusPopPromo: statusPopPromo ?? this.statusPopPromo,
      kelengkapanItem: kelengkapanItem ?? this.kelengkapanItem,
      kebersihanFreezer: kebersihanFreezer ?? this.kebersihanFreezer,
      itemKosong: itemKosong ?? this.itemKosong,
      absensiSpgId: absensiSpgId ?? this.absensiSpgId,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'kualitasBaik': '$kualitasBaik',
      'kualitasRusak': '$kualitasRusak',
      'papanHargaFreezer': papanHargaFreezer,
      'priceTagTg': priceTagTg,
      'priceTagIsland': priceTagIsland,
      'statusPopPromo': statusPopPromo,
      'kelengkapanItem': '$kelengkapanItem',
      'kebersihanFreezer': kebersihanFreezer,
      'itemKosong': itemKosong,
      'absensiSpgId': '$absensiSpgId',
    };
  }

  factory CheckOutModel.fromMap(Map<String, dynamic> map) {
    return CheckOutModel(
      kualitasBaik: map['kualitasBaik'] as int,
      kualitasRusak: map['kualitasRusak'] as int,
      papanHargaFreezer: map['papanHargaFreezer'] as String,
      priceTagTg: map['priceTagTg'] as String,
      priceTagIsland: map['priceTagIsland'] as String,
      statusPopPromo: map['statusPopPromo'] as String,
      kelengkapanItem: map['kelengkapanItem'] as int,
      kebersihanFreezer: map['kebersihanFreezer'] as String,
      itemKosong: map['itemKosong'] as String,
      absensiSpgId: map['absensiSpgId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckOutModel.fromJson(String source) =>
      CheckOutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckOutModel(kualitasBaik: $kualitasBaik, kualitasRusak: $kualitasRusak, papanHargaFreezer: $papanHargaFreezer, priceTagTg: $priceTagTg, priceTagIsland: $priceTagIsland, statusPopPromo: $statusPopPromo, kelengkapanItem: $kelengkapanItem, kebersihanFreezer: $kebersihanFreezer, itemKosong: $itemKosong, absensiSpgId: $absensiSpgId)';
  }

  @override
  bool operator ==(covariant CheckOutModel other) {
    if (identical(this, other)) return true;
  
    return other.kualitasBaik == kualitasBaik &&
        other.kualitasRusak == kualitasRusak &&
        other.papanHargaFreezer == papanHargaFreezer &&
        other.priceTagTg == priceTagTg &&
        other.priceTagIsland == priceTagIsland &&
        other.statusPopPromo == statusPopPromo &&
        other.kelengkapanItem == kelengkapanItem &&
        other.kebersihanFreezer == kebersihanFreezer &&
        other.itemKosong == itemKosong &&
        other.absensiSpgId == absensiSpgId;
  }

  @override
  int get hashCode {
    return kualitasBaik.hashCode ^
        kualitasRusak.hashCode ^
        papanHargaFreezer.hashCode ^
        priceTagTg.hashCode ^
        priceTagIsland.hashCode ^
        statusPopPromo.hashCode ^
        kelengkapanItem.hashCode ^
        kebersihanFreezer.hashCode ^
        itemKosong.hashCode ^
        absensiSpgId.hashCode;
  }
}
