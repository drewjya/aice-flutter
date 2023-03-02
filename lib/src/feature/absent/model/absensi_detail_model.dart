// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aice/src/src.dart';
import 'package:flutter/foundation.dart';

class AbsensiDetailModel {
  final int absensiId;
  final int formAbsensiId;
  final String fotoDisplayProdukFreezer1;
  final String fotoDisplayProdukFreezer2;
  final String fotoDisplayProdukFreezer3;
  final String fotoDisplayProdukFreezerIsland1;
  final String fotoPopPromosi;
  final String fotoPosisiFreezerDariJauh;
  final String fotoSelfie;
  final String itemKosong;
  final String kebersihanFreezer;
  final int kelengkapanItem;
  final String kualitasProduk;
  final String produkRusak;
  final String namaToko;
  final String papanHargaFreezer;
  final int pilihanTokoId;
  final String priceTagIsland;
  final String priceTagTg;
  final List<ProdukReportModel> products;
  final String statusPopPromo;
  final String waktuCheckIn;
  final String waktuCheckOut;
  final num latitude;
  final num longitude;
  final String promosiAktif;
  final String periodePromo;
  AbsensiDetailModel({
    required this.absensiId,
    required this.formAbsensiId,
    required this.fotoDisplayProdukFreezer1,
    required this.fotoDisplayProdukFreezer2,
    required this.fotoDisplayProdukFreezer3,
    required this.fotoDisplayProdukFreezerIsland1,
    required this.fotoPopPromosi,
    required this.fotoPosisiFreezerDariJauh,
    required this.fotoSelfie,
    required this.itemKosong,
    required this.kebersihanFreezer,
    required this.kelengkapanItem,
    required this.kualitasProduk,
    required this.produkRusak,
    required this.namaToko,
    required this.papanHargaFreezer,
    required this.pilihanTokoId,
    required this.priceTagIsland,
    required this.priceTagTg,
    required this.products,
    required this.statusPopPromo,
    required this.waktuCheckIn,
    required this.waktuCheckOut,
    required this.latitude,
    required this.longitude,
    required this.promosiAktif,
    required this.periodePromo,
  });
  

  AbsensiDetailModel copyWith({
    int? absensiId,
    int? formAbsensiId,
    String? fotoDisplayProdukFreezer1,
    String? fotoDisplayProdukFreezer2,
    String? fotoDisplayProdukFreezer3,
    String? fotoDisplayProdukFreezerIsland1,
    String? fotoPopPromosi,
    String? fotoPosisiFreezerDariJauh,
    String? fotoSelfie,
    String? itemKosong,
    String? kebersihanFreezer,
    int? kelengkapanItem,
    String? kualitasProduk,
    String? produkRusak,
    String? namaToko,
    String? papanHargaFreezer,
    int? pilihanTokoId,
    String? priceTagIsland,
    String? priceTagTg,
    List<ProdukReportModel>? products,
    String? statusPopPromo,
    String? waktuCheckIn,
    String? waktuCheckOut,
    num? latitude,
    num? longitude,
    String? promosiAktif,
    String? periodePromo,
  }) {
    return AbsensiDetailModel(
      absensiId: absensiId ?? this.absensiId,
      formAbsensiId: formAbsensiId ?? this.formAbsensiId,
      fotoDisplayProdukFreezer1: fotoDisplayProdukFreezer1 ?? this.fotoDisplayProdukFreezer1,
      fotoDisplayProdukFreezer2: fotoDisplayProdukFreezer2 ?? this.fotoDisplayProdukFreezer2,
      fotoDisplayProdukFreezer3: fotoDisplayProdukFreezer3 ?? this.fotoDisplayProdukFreezer3,
      fotoDisplayProdukFreezerIsland1: fotoDisplayProdukFreezerIsland1 ?? this.fotoDisplayProdukFreezerIsland1,
      fotoPopPromosi: fotoPopPromosi ?? this.fotoPopPromosi,
      fotoPosisiFreezerDariJauh: fotoPosisiFreezerDariJauh ?? this.fotoPosisiFreezerDariJauh,
      fotoSelfie: fotoSelfie ?? this.fotoSelfie,
      itemKosong: itemKosong ?? this.itemKosong,
      kebersihanFreezer: kebersihanFreezer ?? this.kebersihanFreezer,
      kelengkapanItem: kelengkapanItem ?? this.kelengkapanItem,
      kualitasProduk: kualitasProduk ?? this.kualitasProduk,
      produkRusak: produkRusak ?? this.produkRusak,
      namaToko: namaToko ?? this.namaToko,
      papanHargaFreezer: papanHargaFreezer ?? this.papanHargaFreezer,
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
      priceTagIsland: priceTagIsland ?? this.priceTagIsland,
      priceTagTg: priceTagTg ?? this.priceTagTg,
      products: products ?? this.products,
      statusPopPromo: statusPopPromo ?? this.statusPopPromo,
      waktuCheckIn: waktuCheckIn ?? this.waktuCheckIn,
      waktuCheckOut: waktuCheckOut ?? this.waktuCheckOut,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      promosiAktif: promosiAktif ?? this.promosiAktif,
      periodePromo: periodePromo ?? this.periodePromo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'absensiId': absensiId,
      'formAbsensiId': formAbsensiId,
      'fotoDisplayProdukFreezer1': fotoDisplayProdukFreezer1,
      'fotoDisplayProdukFreezer2': fotoDisplayProdukFreezer2,
      'fotoDisplayProdukFreezer3': fotoDisplayProdukFreezer3,
      'fotoDisplayProdukFreezerIsland1': fotoDisplayProdukFreezerIsland1,
      'fotoPopPromosi': fotoPopPromosi,
      'fotoPosisiFreezerDariJauh': fotoPosisiFreezerDariJauh,
      'fotoSelfie': fotoSelfie,
      'itemKosong': itemKosong,
      'kebersihanFreezer': kebersihanFreezer,
      'kelengkapanItem': kelengkapanItem,
      'kualitasProduk': kualitasProduk,
      'produkRusak': produkRusak,
      'namaToko': namaToko,
      'papanHargaFreezer': papanHargaFreezer,
      'pilihanTokoId': pilihanTokoId,
      'priceTagIsland': priceTagIsland,
      'priceTagTg': priceTagTg,
      'products': products.map((x) => x.toMap()).toList(),
      'statusPopPromo': statusPopPromo,
      'waktuCheckIn': waktuCheckIn,
      'waktuCheckOut': waktuCheckOut,
      'latitude': latitude,
      'longitude': longitude,
      'promosiAktif': promosiAktif,
      'periodePromo': periodePromo,
    };
  }

  factory AbsensiDetailModel.fromMap(Map<String, dynamic> map, List<ProdukModel> produkList) {
    return AbsensiDetailModel(
      absensiId: map['absensiId'] as int,
      formAbsensiId: map['formAbsensiId'] as int,
      fotoDisplayProdukFreezer1: map['fotoDisplayProdukFreezer1'] as String,
      fotoDisplayProdukFreezer2: map['fotoDisplayProdukFreezer2'] as String,
      fotoDisplayProdukFreezer3: map['fotoDisplayProdukFreezer3'] as String,
      fotoDisplayProdukFreezerIsland1: map['fotoDisplayProdukFreezerIsland1'] as String,
      fotoPopPromosi: map['fotoPopPromosi'] as String,
      fotoPosisiFreezerDariJauh: map['fotoPosisiFreezerDariJauh'] as String,
      fotoSelfie: map['fotoSelfie'] as String,
      itemKosong: map['itemKosong'] as String,
      kebersihanFreezer: map['kebersihanFreezer'] as String,
      kelengkapanItem: map['kelengkapanItem'] as int,
      kualitasProduk: map['kualitasProduk'] as String,
      produkRusak: map['produkRusak'] as String,
      namaToko: map['namaToko'] as String,
      papanHargaFreezer: map['papanHargaFreezer'] as String,
      pilihanTokoId: map['pilihanTokoId'] as int,
      priceTagIsland: map['priceTagIsland'] as String,
      priceTagTg: map['priceTagTg'] as String,
      products: List<ProdukReportModel>.from((map['products'] as List).map<ProdukReportModel>((x) => ProdukReportModel.fromMap(x as Map<String,dynamic>, produkList),),),
      statusPopPromo: map['statusPopPromo'] as String,
      waktuCheckIn: map['waktuCheckIn'] as String,
      waktuCheckOut: map['waktuCheckOut'] as String,
      latitude: map['latitude'] as num,
      longitude: map['longitude'] as num,
      promosiAktif: map['promosiAktif'] as String,
      periodePromo: map['periodePromo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AbsensiDetailModel(absensiId: $absensiId, formAbsensiId: $formAbsensiId, fotoDisplayProdukFreezer1: $fotoDisplayProdukFreezer1, fotoDisplayProdukFreezer2: $fotoDisplayProdukFreezer2, fotoDisplayProdukFreezer3: $fotoDisplayProdukFreezer3, fotoDisplayProdukFreezerIsland1: $fotoDisplayProdukFreezerIsland1, fotoPopPromosi: $fotoPopPromosi, fotoPosisiFreezerDariJauh: $fotoPosisiFreezerDariJauh, fotoSelfie: $fotoSelfie, itemKosong: $itemKosong, kebersihanFreezer: $kebersihanFreezer, kelengkapanItem: $kelengkapanItem, kualitasProduk: $kualitasProduk, produkRusak: $produkRusak, namaToko: $namaToko, papanHargaFreezer: $papanHargaFreezer, pilihanTokoId: $pilihanTokoId, priceTagIsland: $priceTagIsland, priceTagTg: $priceTagTg, products: $products, statusPopPromo: $statusPopPromo, waktuCheckIn: $waktuCheckIn, waktuCheckOut: $waktuCheckOut, latitude: $latitude, longitude: $longitude, promosiAktif: $promosiAktif, periodePromo: $periodePromo)';
  }

  @override
  bool operator ==(covariant AbsensiDetailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.absensiId == absensiId &&
      other.formAbsensiId == formAbsensiId &&
      other.fotoDisplayProdukFreezer1 == fotoDisplayProdukFreezer1 &&
      other.fotoDisplayProdukFreezer2 == fotoDisplayProdukFreezer2 &&
      other.fotoDisplayProdukFreezer3 == fotoDisplayProdukFreezer3 &&
      other.fotoDisplayProdukFreezerIsland1 == fotoDisplayProdukFreezerIsland1 &&
      other.fotoPopPromosi == fotoPopPromosi &&
      other.fotoPosisiFreezerDariJauh == fotoPosisiFreezerDariJauh &&
      other.fotoSelfie == fotoSelfie &&
      other.itemKosong == itemKosong &&
      other.kebersihanFreezer == kebersihanFreezer &&
      other.kelengkapanItem == kelengkapanItem &&
      other.kualitasProduk == kualitasProduk &&
      other.produkRusak == produkRusak &&
      other.namaToko == namaToko &&
      other.papanHargaFreezer == papanHargaFreezer &&
      other.pilihanTokoId == pilihanTokoId &&
      other.priceTagIsland == priceTagIsland &&
      other.priceTagTg == priceTagTg &&
      listEquals(other.products, products) &&
      other.statusPopPromo == statusPopPromo &&
      other.waktuCheckIn == waktuCheckIn &&
      other.waktuCheckOut == waktuCheckOut &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.promosiAktif == promosiAktif &&
      other.periodePromo == periodePromo;
  }

  @override
  int get hashCode {
    return absensiId.hashCode ^
      formAbsensiId.hashCode ^
      fotoDisplayProdukFreezer1.hashCode ^
      fotoDisplayProdukFreezer2.hashCode ^
      fotoDisplayProdukFreezer3.hashCode ^
      fotoDisplayProdukFreezerIsland1.hashCode ^
      fotoPopPromosi.hashCode ^
      fotoPosisiFreezerDariJauh.hashCode ^
      fotoSelfie.hashCode ^
      itemKosong.hashCode ^
      kebersihanFreezer.hashCode ^
      kelengkapanItem.hashCode ^
      kualitasProduk.hashCode ^
      produkRusak.hashCode ^
      namaToko.hashCode ^
      papanHargaFreezer.hashCode ^
      pilihanTokoId.hashCode ^
      priceTagIsland.hashCode ^
      priceTagTg.hashCode ^
      products.hashCode ^
      statusPopPromo.hashCode ^
      waktuCheckIn.hashCode ^
      waktuCheckOut.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      promosiAktif.hashCode ^
      periodePromo.hashCode;
  }
}
