// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckOutModel {
  final String kualitasProduk;
  final String produkRusak;
  final String papanHargaFreezer;
  final String priceTagTg;
  final String priceTagIsland;
  final String statusPopPromo;
  final int kelengkapanItem;
  final String kebersihanFreezer;
  final String itemKosong;
  final int absensiSpgId;
  final String promosiAktif;
  final String periodePromo;
  CheckOutModel({
    required this.kualitasProduk,
    required this.produkRusak,
    required this.papanHargaFreezer,
    required this.priceTagTg,
    required this.priceTagIsland,
    required this.statusPopPromo,
    required this.kelengkapanItem,
    required this.kebersihanFreezer,
    required this.itemKosong,
    required this.absensiSpgId,
    required this.promosiAktif,
    required this.periodePromo,
  });
 

  CheckOutModel copyWith({
    String? kualitasProduk,
    String? produkRusak,
    String? papanHargaFreezer,
    String? priceTagTg,
    String? priceTagIsland,
    String? statusPopPromo,
    int? kelengkapanItem,
    String? kebersihanFreezer,
    String? itemKosong,
    int? absensiSpgId,
    String? promosiAktif,
    String? periodePromo,
  }) {
    return CheckOutModel(
      kualitasProduk: kualitasProduk ?? this.kualitasProduk,
      produkRusak: produkRusak ?? this.produkRusak,
      papanHargaFreezer: papanHargaFreezer ?? this.papanHargaFreezer,
      priceTagTg: priceTagTg ?? this.priceTagTg,
      priceTagIsland: priceTagIsland ?? this.priceTagIsland,
      statusPopPromo: statusPopPromo ?? this.statusPopPromo,
      kelengkapanItem: kelengkapanItem ?? this.kelengkapanItem,
      kebersihanFreezer: kebersihanFreezer ?? this.kebersihanFreezer,
      itemKosong: itemKosong ?? this.itemKosong,
      absensiSpgId: absensiSpgId ?? this.absensiSpgId,
      promosiAktif: promosiAktif ?? this.promosiAktif,
      periodePromo: periodePromo ?? this.periodePromo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kualitasProduk': kualitasProduk,
      'produkRusak': produkRusak,
      'papanHargaFreezer': papanHargaFreezer,
      'priceTagTg': priceTagTg,
      'priceTagIsland': priceTagIsland,
      'statusPopPromo': statusPopPromo,
      'kelengkapanItem': "$kelengkapanItem",
      'kebersihanFreezer': kebersihanFreezer,
      'itemKosong': itemKosong,
      'absensiSpgId': "$absensiSpgId",
      'promosiAktif': promosiAktif,
      'periodePromo': periodePromo,
    };
  }

  factory CheckOutModel.fromMap(Map<String, dynamic> map) {
    return CheckOutModel(
      kualitasProduk: map['kualitasProduk'] as String,
      produkRusak: map['produkRusak'] as String,
      papanHargaFreezer: map['papanHargaFreezer'] as String,
      priceTagTg: map['priceTagTg'] as String,
      priceTagIsland: map['priceTagIsland'] as String,
      statusPopPromo: map['statusPopPromo'] as String,
      kelengkapanItem: map['kelengkapanItem'] as int,
      kebersihanFreezer: map['kebersihanFreezer'] as String,
      itemKosong: map['itemKosong'] as String,
      absensiSpgId: map['absensiSpgId'] as int,
      promosiAktif: map['promosiAktif'] as String,
      periodePromo: map['periodePromo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckOutModel.fromJson(String source) =>
      CheckOutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckOutModel(kualitasProduk: $kualitasProduk, produkRusak: $produkRusak, papanHargaFreezer: $papanHargaFreezer, priceTagTg: $priceTagTg, priceTagIsland: $priceTagIsland, statusPopPromo: $statusPopPromo, kelengkapanItem: $kelengkapanItem, kebersihanFreezer: $kebersihanFreezer, itemKosong: $itemKosong, absensiSpgId: $absensiSpgId, promosiAktif: $promosiAktif, periodePromo: $periodePromo)';
  }

  @override
  bool operator ==(covariant CheckOutModel other) {
    if (identical(this, other)) return true;
  
    return other.kualitasProduk == kualitasProduk &&
        other.produkRusak == produkRusak &&
        other.papanHargaFreezer == papanHargaFreezer &&
        other.priceTagTg == priceTagTg &&
        other.priceTagIsland == priceTagIsland &&
        other.statusPopPromo == statusPopPromo &&
        other.kelengkapanItem == kelengkapanItem &&
        other.kebersihanFreezer == kebersihanFreezer &&
        other.itemKosong == itemKosong &&
        other.absensiSpgId == absensiSpgId &&
        other.promosiAktif == promosiAktif &&
        other.periodePromo == periodePromo;
  }

  @override
  int get hashCode {
    return kualitasProduk.hashCode ^
        produkRusak.hashCode ^
        papanHargaFreezer.hashCode ^
        priceTagTg.hashCode ^
        priceTagIsland.hashCode ^
        statusPopPromo.hashCode ^
        kelengkapanItem.hashCode ^
        kebersihanFreezer.hashCode ^
        itemKosong.hashCode ^
        absensiSpgId.hashCode ^
        promosiAktif.hashCode ^
        periodePromo.hashCode;
  }
}
