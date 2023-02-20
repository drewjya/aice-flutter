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
  final String promosiAktif;
  CheckOutModel({
    required this.kualitasBaik,
    required this.kualitasRusak,
    required this.promosiAktif,
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
    String? promosiAktif,
    int? absensiSpgId,
  }) {
    return CheckOutModel(
      kualitasBaik: kualitasBaik ?? this.kualitasBaik,
      kualitasRusak: kualitasRusak ?? this.kualitasRusak,
      papanHargaFreezer: papanHargaFreezer ?? this.papanHargaFreezer,
      priceTagTg: priceTagTg ?? this.priceTagTg,
      priceTagIsland: priceTagIsland ?? this.priceTagIsland,
      promosiAktif: promosiAktif ?? this.promosiAktif,
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
      'promosiAktif': promosiAktif,
    };
  }


  String toJson() => json.encode(toMap());

  
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
