import 'dart:convert';

import 'package:aice/src/feature/absent/absent.dart';
import 'package:collection/collection.dart';

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
  final int kualitasBaik;
  final int kualitasRusak;
  final String namaToko;
  final String papanHargaFreezer;
  final int pilihanTokoId;
  final String priceTagIsland;
  final String priceTagTg;
  final List<ProdukReportModel> products;
  final String statusPopPromo;
  final String waktuCheckIn;
  final String waktuCheckOut;
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
    required this.kualitasBaik,
    required this.kualitasRusak,
    required this.namaToko,
    required this.papanHargaFreezer,
    required this.pilihanTokoId,
    required this.priceTagIsland,
    required this.priceTagTg,
    required this.products,
    required this.statusPopPromo,
    required this.waktuCheckIn,
    required this.waktuCheckOut,
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
    int? kualitasBaik,
    int? kualitasRusak,
    String? namaToko,
    String? papanHargaFreezer,
    int? pilihanTokoId,
    String? priceTagIsland,
    String? priceTagTg,
    List<ProdukReportModel>? products,
    String? statusPopPromo,
    String? waktuCheckIn,
    String? waktuCheckOut,
  }) {
    return AbsensiDetailModel(
      absensiId: absensiId ?? this.absensiId,
      formAbsensiId: formAbsensiId ?? this.formAbsensiId,
      fotoDisplayProdukFreezer1:
          fotoDisplayProdukFreezer1 ?? this.fotoDisplayProdukFreezer1,
      fotoDisplayProdukFreezer2:
          fotoDisplayProdukFreezer2 ?? this.fotoDisplayProdukFreezer2,
      fotoDisplayProdukFreezer3:
          fotoDisplayProdukFreezer3 ?? this.fotoDisplayProdukFreezer3,
      fotoDisplayProdukFreezerIsland1: fotoDisplayProdukFreezerIsland1 ??
          this.fotoDisplayProdukFreezerIsland1,
      fotoPopPromosi: fotoPopPromosi ?? this.fotoPopPromosi,
      fotoPosisiFreezerDariJauh:
          fotoPosisiFreezerDariJauh ?? this.fotoPosisiFreezerDariJauh,
      fotoSelfie: fotoSelfie ?? this.fotoSelfie,
      itemKosong: itemKosong ?? this.itemKosong,
      kebersihanFreezer: kebersihanFreezer ?? this.kebersihanFreezer,
      kelengkapanItem: kelengkapanItem ?? this.kelengkapanItem,
      kualitasBaik: kualitasBaik ?? this.kualitasBaik,
      kualitasRusak: kualitasRusak ?? this.kualitasRusak,
      namaToko: namaToko ?? this.namaToko,
      papanHargaFreezer: papanHargaFreezer ?? this.papanHargaFreezer,
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
      priceTagIsland: priceTagIsland ?? this.priceTagIsland,
      priceTagTg: priceTagTg ?? this.priceTagTg,
      products: products ?? this.products,
      statusPopPromo: statusPopPromo ?? this.statusPopPromo,
      waktuCheckIn: waktuCheckIn ?? this.waktuCheckIn,
      waktuCheckOut: waktuCheckOut ?? this.waktuCheckOut,
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
      'kualitasBaik': kualitasBaik,
      'kualitasRusak': kualitasRusak,
      'namaToko': namaToko,
      'papanHargaFreezer': papanHargaFreezer,
      'pilihanTokoId': pilihanTokoId,
      'priceTagIsland': priceTagIsland,
      'priceTagTg': priceTagTg,
      'products': products,
      'statusPopPromo': statusPopPromo,
      'waktuCheckIn': waktuCheckIn,
      'waktuCheckOut': waktuCheckOut,
    };
  }

  factory AbsensiDetailModel.fromMap(Map<String, dynamic> map) {
    return AbsensiDetailModel(
      absensiId: map['absensiId'].toInt() as int,
      formAbsensiId: map['formAbsensiId'].toInt() as int,
      fotoDisplayProdukFreezer1: map['fotoDisplayProdukFreezer1'] as String,
      fotoDisplayProdukFreezer2: map['fotoDisplayProdukFreezer2'] as String,
      fotoDisplayProdukFreezer3: map['fotoDisplayProdukFreezer3'] as String,
      fotoDisplayProdukFreezerIsland1:
          map['fotoDisplayProdukFreezerIsland1'] as String,
      fotoPopPromosi: map['fotoPopPromosi'] as String,
      fotoPosisiFreezerDariJauh: map['fotoPosisiFreezerDariJauh'] as String,
      fotoSelfie: map['fotoSelfie'] as String,
      itemKosong: map['itemKosong'] as String,
      kebersihanFreezer: map['kebersihanFreezer'] as String,
      kelengkapanItem: map['kelengkapanItem'].toInt() as int,
      kualitasBaik: map['kualitasBaik'].toInt() as int,
      kualitasRusak: map['kualitasRusak'].toInt() as int,
      namaToko: map['namaToko'] as String,
      papanHargaFreezer: map['papanHargaFreezer'] as String,
      pilihanTokoId: map['pilihanTokoId'].toInt() as int,
      priceTagIsland: map['priceTagIsland'] as String,
      priceTagTg: map['priceTagTg'] as String,
      products: (map['products'] as List<dynamic>)
          .map((e) => ProdukReportModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      statusPopPromo: map['statusPopPromo'] as String,
      waktuCheckIn: map['waktuCheckIn'] as String,
      waktuCheckOut: map['waktuCheckOut'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsensiDetailModel.fromJson(String source) =>
      AbsensiDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AbsensiDetailModel(absensiId: $absensiId, formAbsensiId: $formAbsensiId, fotoDisplayProdukFreezer1: $fotoDisplayProdukFreezer1, fotoDisplayProdukFreezer2: $fotoDisplayProdukFreezer2, fotoDisplayProdukFreezer3: $fotoDisplayProdukFreezer3, fotoDisplayProdukFreezerIsland1: $fotoDisplayProdukFreezerIsland1, fotoPopPromosi: $fotoPopPromosi, fotoPosisiFreezerDariJauh: $fotoPosisiFreezerDariJauh, fotoSelfie: $fotoSelfie, itemKosong: $itemKosong, kebersihanFreezer: $kebersihanFreezer, kelengkapanItem: $kelengkapanItem, kualitasBaik: $kualitasBaik, kualitasRusak: $kualitasRusak, namaToko: $namaToko, papanHargaFreezer: $papanHargaFreezer, pilihanTokoId: $pilihanTokoId, priceTagIsland: $priceTagIsland, priceTagTg: $priceTagTg, products: $products, statusPopPromo: $statusPopPromo, waktuCheckIn: $waktuCheckIn, waktuCheckOut: $waktuCheckOut)';
  }

  @override
  bool operator ==(covariant AbsensiDetailModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.absensiId == absensiId &&
        other.formAbsensiId == formAbsensiId &&
        other.fotoDisplayProdukFreezer1 == fotoDisplayProdukFreezer1 &&
        other.fotoDisplayProdukFreezer2 == fotoDisplayProdukFreezer2 &&
        other.fotoDisplayProdukFreezer3 == fotoDisplayProdukFreezer3 &&
        other.fotoDisplayProdukFreezerIsland1 ==
            fotoDisplayProdukFreezerIsland1 &&
        other.fotoPopPromosi == fotoPopPromosi &&
        other.fotoPosisiFreezerDariJauh == fotoPosisiFreezerDariJauh &&
        other.fotoSelfie == fotoSelfie &&
        other.itemKosong == itemKosong &&
        other.kebersihanFreezer == kebersihanFreezer &&
        other.kelengkapanItem == kelengkapanItem &&
        other.kualitasBaik == kualitasBaik &&
        other.kualitasRusak == kualitasRusak &&
        other.namaToko == namaToko &&
        other.papanHargaFreezer == papanHargaFreezer &&
        other.pilihanTokoId == pilihanTokoId &&
        other.priceTagIsland == priceTagIsland &&
        other.priceTagTg == priceTagTg &&
        listEquals(other.products, products) &&
        other.statusPopPromo == statusPopPromo &&
        other.waktuCheckIn == waktuCheckIn &&
        other.waktuCheckOut == waktuCheckOut;
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
        kualitasBaik.hashCode ^
        kualitasRusak.hashCode ^
        namaToko.hashCode ^
        papanHargaFreezer.hashCode ^
        pilihanTokoId.hashCode ^
        priceTagIsland.hashCode ^
        priceTagTg.hashCode ^
        products.hashCode ^
        statusPopPromo.hashCode ^
        waktuCheckIn.hashCode ^
        waktuCheckOut.hashCode;
  }
}
