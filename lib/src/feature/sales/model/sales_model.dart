// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aice/src/src.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OldSalesHistoryModel {
  final String namaToko;
  final String tanggal;
  final String kodeToko;
  final String jumlahPo;
  final String pilihanToko;
  final String dividerKulkas;
  final String jumlahItemTerdisplay;
  final String kualitasProduk;
  final String stickerFreezer;
  final String papanHarga;
  final String labelHarga;
  final String woblerPromo;
  final String spanduk;
  final String kepenuhanFreezerAtas;
  final String kebersihanDebuFreezer;
  final String brandLain;
  final String stockBrandLain;
  final String produkRetur;
  final String saranDanKendala;
  final String? fotoSelfie;
  final String? fotoKulkasDariJauh;
  final String? fotoKulkasTertutup;
  final String? fotoKulkasTerbuka;
  final String? fotoFreezerOne;
  final String? fotoFreezerTwo;
  final String? fotoFreezerThree;
  final String? fotoFreezerIsland1;
  final String? fotoFreezerIsland2;
  final String? fotoFreezerIsland3;
  final String? fotoFreezerBawah;
  final String? fotoPo;
  final String? fotoPop;
  final String? fotoPeralatan;
  OldSalesHistoryModel({
    required this.tanggal,
    required this.namaToko,
    required this.kodeToko,
    required this.jumlahPo,
    required this.pilihanToko,
    required this.dividerKulkas,
    required this.jumlahItemTerdisplay,
    required this.kualitasProduk,
    required this.stickerFreezer,
    required this.papanHarga,
    required this.labelHarga,
    required this.woblerPromo,
    required this.spanduk,
    required this.kepenuhanFreezerAtas,
    required this.kebersihanDebuFreezer,
    required this.brandLain,
    required this.stockBrandLain,
    required this.produkRetur,
    required this.saranDanKendala,
    required this.fotoSelfie,
    required this.fotoKulkasDariJauh,
    required this.fotoKulkasTertutup,
    required this.fotoKulkasTerbuka,
    required this.fotoFreezerOne,
    required this.fotoFreezerTwo,
    required this.fotoFreezerThree,
    required this.fotoFreezerIsland1,
    required this.fotoFreezerIsland2,
    required this.fotoFreezerIsland3,
    required this.fotoFreezerBawah,
    required this.fotoPo,
    required this.fotoPop,
    required this.fotoPeralatan,
  });

  OldSalesHistoryModel copyWith(
      {String? kodeToko,
      String? jumlahPo,
      String? pilihanToko,
      String? dividerKulkas,
      String? jumlahItemTerdisplay,
      String? kualitasProduk,
      String? stickerFreezer,
      String? papanHarga,
      String? labelHarga,
      String? woblerPromo,
      String? spanduk,
      String? kepenuhanFreezerAtas,
      String? kebersihanDebuFreezer,
      String? brandLain,
      String? stockBrandLain,
      String? produkRetur,
      String? saranDanKendala,
      String? fotoSelfie,
      String? fotoKulkasDariJauh,
      String? fotoKulkasTertutup,
      String? fotoKulkasTerbuka,
      String? fotoFreezerOne,
      String? fotoFreezerTwo,
      String? fotoFreezerThree,
      String? fotoFreezerIsland1,
      String? fotoFreezerIsland2,
      String? fotoFreezerIsland3,
      String? fotoFreezerBawah,
      String? fotoPo,
      String? fotoPop,
      String? fotoPeralatan,
      String? namaToko,
      String? tanggal}) {
    return OldSalesHistoryModel(
      tanggal: tanggal ?? this.tanggal,
      namaToko: namaToko ?? this.namaToko,
      kodeToko: kodeToko ?? this.kodeToko,
      jumlahPo: jumlahPo ?? this.jumlahPo,
      pilihanToko: pilihanToko ?? this.pilihanToko,
      dividerKulkas: dividerKulkas ?? this.dividerKulkas,
      jumlahItemTerdisplay: jumlahItemTerdisplay ?? this.jumlahItemTerdisplay,
      kualitasProduk: kualitasProduk ?? this.kualitasProduk,
      stickerFreezer: stickerFreezer ?? this.stickerFreezer,
      papanHarga: papanHarga ?? this.papanHarga,
      labelHarga: labelHarga ?? this.labelHarga,
      woblerPromo: woblerPromo ?? this.woblerPromo,
      spanduk: spanduk ?? this.spanduk,
      kepenuhanFreezerAtas: kepenuhanFreezerAtas ?? this.kepenuhanFreezerAtas,
      kebersihanDebuFreezer:
          kebersihanDebuFreezer ?? this.kebersihanDebuFreezer,
      brandLain: brandLain ?? this.brandLain,
      stockBrandLain: stockBrandLain ?? this.stockBrandLain,
      produkRetur: produkRetur ?? this.produkRetur,
      saranDanKendala: saranDanKendala ?? this.saranDanKendala,
      fotoSelfie: fotoSelfie ?? this.fotoSelfie,
      fotoKulkasDariJauh: fotoKulkasDariJauh ?? this.fotoKulkasDariJauh,
      fotoKulkasTertutup: fotoKulkasTertutup ?? this.fotoKulkasTertutup,
      fotoKulkasTerbuka: fotoKulkasTerbuka ?? this.fotoKulkasTerbuka,
      fotoFreezerOne: fotoFreezerOne ?? this.fotoFreezerOne,
      fotoFreezerTwo: fotoFreezerTwo ?? this.fotoFreezerTwo,
      fotoFreezerThree: fotoFreezerThree ?? this.fotoFreezerThree,
      fotoFreezerIsland1: fotoFreezerIsland1 ?? this.fotoFreezerIsland1,
      fotoFreezerIsland2: fotoFreezerIsland2 ?? this.fotoFreezerIsland2,
      fotoFreezerIsland3: fotoFreezerIsland3 ?? this.fotoFreezerIsland3,
      fotoFreezerBawah: fotoFreezerBawah ?? this.fotoFreezerBawah,
      fotoPo: fotoPo ?? this.fotoPo,
      fotoPop: fotoPop ?? this.fotoPop,
      fotoPeralatan: fotoPeralatan ?? this.fotoPeralatan,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kodeToko': kodeToko,
      'jumlahPo': jumlahPo,
      'pilihanToko': pilihanToko,
      'dividerKulkas': dividerKulkas,
      'jumlahItemTerdisplay': jumlahItemTerdisplay,
      'kualitasProduk': kualitasProduk,
      'stickerFreezer': stickerFreezer,
      'papanHarga': papanHarga,
      'labelHarga': labelHarga,
      'woblerPromo': woblerPromo,
      'spanduk': spanduk,
      'kepenuhanFreezerAtas': kepenuhanFreezerAtas,
      'kebersihanDebuFreezer': kebersihanDebuFreezer,
      'brandLain': brandLain,
      'stockBrandLain': stockBrandLain,
      'produkRetur': produkRetur,
      'saranDanKendala': saranDanKendala,
      'fotoSelfie': fotoSelfie,
      'fotoKulkasDariJauh': fotoKulkasDariJauh,
      'fotoKulkasTertutup': fotoKulkasTertutup,
      'fotoKulkasTerbuka': fotoKulkasTerbuka,
      'fotoFreezerOne': fotoFreezerOne,
      'fotoFreezerTwo': fotoFreezerTwo,
      'fotoFreezerThree': fotoFreezerThree,
      'fotoFreezerIsland1': fotoFreezerIsland1,
      'fotoFreezerIsland2': fotoFreezerIsland2,
      'fotoFreezerIsland3': fotoFreezerIsland3,
      'fotoFreezerBawah': fotoFreezerBawah,
      'fotoPo': fotoPo,
      'fotoPop': fotoPop,
      'fotoPeralatan': fotoPeralatan,
    };
  }

  factory OldSalesHistoryModel.fromMap(Map<String, dynamic> map) {
    for (var element in map.keys) {
      if (element == "Created At") {
        dPrint(map[element]);
      }
    }
    return OldSalesHistoryModel(
      tanggal: (map["Created At"] as Timestamp).toDate().toString(),
      namaToko: map["Nama Toko"] as String,
      kodeToko: map["Kode Toko"] as String,
      jumlahPo: map["Jumlah PO"] as String,
      pilihanToko: map["Pilihan Toko"] as String,
      dividerKulkas: map["Divider Kulkas"] as String,
      jumlahItemTerdisplay: map["Jumlah Item Terdisplay"] as String,
      kualitasProduk: map["Kualitas Produk"] as String,
      stickerFreezer: map["Sticker Freezer"] as String,
      papanHarga: map["Papan Harga"] as String,
      labelHarga: map["Label Harga"] as String,
      woblerPromo: map["Wobler Promo"] as String,
      spanduk: map["Spanduk"] as String,
      kepenuhanFreezerAtas: map["Kepenuhan Freezer Atas"] as String,
      kebersihanDebuFreezer: map["Kebersihan Debu Freezer"] as String,
      brandLain: map["Brand Lain"] as String,
      stockBrandLain: map["Stock Brand Lain"] as String,
      produkRetur: map["Produk Retur"] as String,
      saranDanKendala: map["Saran dan Kendala"] as String,
      fotoSelfie:
          map['Foto Selfie'] != null ? map['Foto Selfie'] as String : null,
      fotoKulkasDariJauh: map['Foto Kulkas Dari Jauh'] != null
          ? map['Foto Kulkas Dari Jauh'] as String
          : null,
      fotoKulkasTertutup: map['Foto Kulkas Tertutup'] != null
          ? map['Foto Kulkas Tertutup'] as String
          : null,
      fotoKulkasTerbuka: map['Foto Kulkas Terbuka'] != null
          ? map['Foto Kulkas Terbuka'] as String
          : null,
      fotoFreezerOne: map["Foto Freezer One"] != null
          ? map["Foto Freezer One"] as String
          : null,
      fotoFreezerTwo: map["Foto Freezer Two"] != null
          ? map["Foto Freezer Two"] as String
          : null,
      fotoFreezerThree: map["Foto Freezer Three"] != null
          ? map["Foto Freezer Three"] as String
          : null,
      fotoFreezerIsland1: map["Foto Freezer Island 1"] != null
          ? map["Foto Freezer Island 1"] as String
          : null,
      fotoFreezerIsland2: map["Foto Freezer Island 2"] != null
          ? map["Foto Freezer Island 2"] as String
          : null,
      fotoFreezerIsland3: map["Foto Freezer Island 3"] != null
          ? map["Foto Freezer Island 3"] as String
          : null,
      fotoFreezerBawah: map['Foto Freezer Bawah'] != null
          ? map['Foto Freezer Bawah'] as String
          : null,
      fotoPo: map['Foto PO'] != null ? map['Foto PO'] as String : null,
      fotoPop: map["Foto Pop"] != null ? map["Foto Pop"] as String : null,
      fotoPeralatan: map["Foto Peralatan"] != null
          ? map["Foto Peralatan"] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OldSalesHistoryModel.fromJson(String source) =>
      OldSalesHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OldSalesHistoryModel(kodeToko: $kodeToko, jumlahPo: $jumlahPo, pilihanToko: $pilihanToko, dividerKulkas: $dividerKulkas, jumlahItemTerdisplay: $jumlahItemTerdisplay, kualitasProduk: $kualitasProduk, stickerFreezer: $stickerFreezer, papanHarga: $papanHarga, labelHarga: $labelHarga, woblerPromo: $woblerPromo, spanduk: $spanduk, kepenuhanFreezerAtas: $kepenuhanFreezerAtas, kebersihanDebuFreezer: $kebersihanDebuFreezer, brandLain: $brandLain, stockBrandLain: $stockBrandLain, produkRetur: $produkRetur, saranDanKendala: $saranDanKendala, fotoSelfie: $fotoSelfie, fotoKulkasDariJauh: $fotoKulkasDariJauh, fotoKulkasTertutup: $fotoKulkasTertutup, fotoKulkasTerbuka: $fotoKulkasTerbuka, fotoFreezerOne: $fotoFreezerOne, fotoFreezerTwo: $fotoFreezerTwo, fotoFreezerThree: $fotoFreezerThree, fotoFreezerIsland1: $fotoFreezerIsland1, fotoFreezerIsland2: $fotoFreezerIsland2, fotoFreezerIsland3: $fotoFreezerIsland3, fotoFreezerBawah: $fotoFreezerBawah, fotoPo: $fotoPo, fotoPop: $fotoPop, fotoPeralatan: $fotoPeralatan)';
  }

  @override
  bool operator ==(covariant OldSalesHistoryModel other) {
    if (identical(this, other)) return true;

    return other.kodeToko == kodeToko &&
        other.jumlahPo == jumlahPo &&
        other.pilihanToko == pilihanToko &&
        other.dividerKulkas == dividerKulkas &&
        other.jumlahItemTerdisplay == jumlahItemTerdisplay &&
        other.kualitasProduk == kualitasProduk &&
        other.stickerFreezer == stickerFreezer &&
        other.papanHarga == papanHarga &&
        other.labelHarga == labelHarga &&
        other.woblerPromo == woblerPromo &&
        other.spanduk == spanduk &&
        other.kepenuhanFreezerAtas == kepenuhanFreezerAtas &&
        other.kebersihanDebuFreezer == kebersihanDebuFreezer &&
        other.brandLain == brandLain &&
        other.stockBrandLain == stockBrandLain &&
        other.produkRetur == produkRetur &&
        other.saranDanKendala == saranDanKendala &&
        other.fotoSelfie == fotoSelfie &&
        other.fotoKulkasDariJauh == fotoKulkasDariJauh &&
        other.fotoKulkasTertutup == fotoKulkasTertutup &&
        other.fotoKulkasTerbuka == fotoKulkasTerbuka &&
        other.fotoFreezerOne == fotoFreezerOne &&
        other.fotoFreezerTwo == fotoFreezerTwo &&
        other.fotoFreezerThree == fotoFreezerThree &&
        other.fotoFreezerIsland1 == fotoFreezerIsland1 &&
        other.fotoFreezerIsland2 == fotoFreezerIsland2 &&
        other.fotoFreezerIsland3 == fotoFreezerIsland3 &&
        other.fotoFreezerBawah == fotoFreezerBawah &&
        other.fotoPo == fotoPo &&
        other.fotoPop == fotoPop &&
        other.fotoPeralatan == fotoPeralatan;
  }

  @override
  int get hashCode {
    return kodeToko.hashCode ^
        jumlahPo.hashCode ^
        pilihanToko.hashCode ^
        dividerKulkas.hashCode ^
        jumlahItemTerdisplay.hashCode ^
        kualitasProduk.hashCode ^
        stickerFreezer.hashCode ^
        papanHarga.hashCode ^
        labelHarga.hashCode ^
        woblerPromo.hashCode ^
        spanduk.hashCode ^
        kepenuhanFreezerAtas.hashCode ^
        kebersihanDebuFreezer.hashCode ^
        brandLain.hashCode ^
        stockBrandLain.hashCode ^
        produkRetur.hashCode ^
        saranDanKendala.hashCode ^
        fotoSelfie.hashCode ^
        fotoKulkasDariJauh.hashCode ^
        fotoKulkasTertutup.hashCode ^
        fotoKulkasTerbuka.hashCode ^
        fotoFreezerOne.hashCode ^
        fotoFreezerTwo.hashCode ^
        fotoFreezerThree.hashCode ^
        fotoFreezerIsland1.hashCode ^
        fotoFreezerIsland2.hashCode ^
        fotoFreezerIsland3.hashCode ^
        fotoFreezerBawah.hashCode ^
        fotoPo.hashCode ^
        fotoPop.hashCode ^
        fotoPeralatan.hashCode;
  }
}
