// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SalesDto {
  final int pilihanTokoId;
  final String namaToko;
  final String kodeToko;
  final String kualitasProduk;
  final String stickerFreezer;
  final String papanHarga;
  final String dividerKulkas;
  final String labelHarga;
  final String woblerPromo;
  final String spanduk;
  final String brandLain;
  final String stockBrandLain;
  final String stockDibawahFreezer;
  final String produkPromosi;
  final String kebersihanBungaEs;
  final String kepenuhanFreezerAtas;
  final String kebersihanLemFreezer;
  final String kebersihanDebuFreezer;
  final String posisiFreezer;
  final int jumlahPO;
  final int jumlahItemTerdisplay;
  final String saranDanKendala;
  final String produkRetur;
  final String kategoriFreezer;
  final String namaDistributor;
  SalesDto({
    required this.pilihanTokoId,
    required this.namaToko,
    required this.kodeToko,
    required this.kualitasProduk,
    required this.stickerFreezer,
    required this.papanHarga,
    required this.dividerKulkas,
    required this.labelHarga,
    required this.woblerPromo,
    required this.spanduk,
    required this.brandLain,
    required this.stockBrandLain,
    required this.stockDibawahFreezer,
    required this.produkPromosi,
    required this.kebersihanBungaEs,
    required this.kepenuhanFreezerAtas,
    required this.kebersihanLemFreezer,
    required this.kebersihanDebuFreezer,
    required this.posisiFreezer,
    required this.jumlahPO,
    required this.jumlahItemTerdisplay,
    required this.saranDanKendala,
    required this.produkRetur,
    required this.kategoriFreezer,
    required this.namaDistributor,
  });

  SalesDto copyWith({
    int? pilihanTokoId,
    String? namaToko,
    String? kodeToko,
    String? kualitasProduk,
    String? stickerFreezer,
    String? papanHarga,
    String? dividerKulkas,
    String? labelHarga,
    String? woblerPromo,
    String? spanduk,
    String? brandLain,
    String? stockBrandLain,
    String? stockDibawahFreezer,
    String? produkPromosi,
    String? kebersihanBungaEs,
    String? kepenuhanFreezerAtas,
    String? kebersihanLemFreezer,
    String? kebersihanDebuFreezer,
    String? posisiFreezer,
    int? jumlahPO,
    int? jumlahItemTerdisplay,
    String? saranDanKendala,
    String? produkRetur,
    String? kategoriFreezer,
    String? namaDistributor,
  }) {
    return SalesDto(
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
      namaToko: namaToko ?? this.namaToko,
      kodeToko: kodeToko ?? this.kodeToko,
      kualitasProduk: kualitasProduk ?? this.kualitasProduk,
      stickerFreezer: stickerFreezer ?? this.stickerFreezer,
      papanHarga: papanHarga ?? this.papanHarga,
      dividerKulkas: dividerKulkas ?? this.dividerKulkas,
      labelHarga: labelHarga ?? this.labelHarga,
      woblerPromo: woblerPromo ?? this.woblerPromo,
      spanduk: spanduk ?? this.spanduk,
      brandLain: brandLain ?? this.brandLain,
      stockBrandLain: stockBrandLain ?? this.stockBrandLain,
      stockDibawahFreezer: stockDibawahFreezer ?? this.stockDibawahFreezer,
      produkPromosi: produkPromosi ?? this.produkPromosi,
      kebersihanBungaEs: kebersihanBungaEs ?? this.kebersihanBungaEs,
      kepenuhanFreezerAtas: kepenuhanFreezerAtas ?? this.kepenuhanFreezerAtas,
      kebersihanLemFreezer: kebersihanLemFreezer ?? this.kebersihanLemFreezer,
      kebersihanDebuFreezer:
          kebersihanDebuFreezer ?? this.kebersihanDebuFreezer,
      posisiFreezer: posisiFreezer ?? this.posisiFreezer,
      jumlahPO: jumlahPO ?? this.jumlahPO,
      jumlahItemTerdisplay: jumlahItemTerdisplay ?? this.jumlahItemTerdisplay,
      saranDanKendala: saranDanKendala ?? this.saranDanKendala,
      produkRetur: produkRetur ?? this.produkRetur,
      kategoriFreezer: kategoriFreezer ?? this.kategoriFreezer,
      namaDistributor: namaDistributor ?? this.namaDistributor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pilihanTokoId': pilihanTokoId.toString(),
      'namaToko': namaToko.toString(),
      'kodeToko': kodeToko.toString(),
      'kualitasProduk': kualitasProduk.toString(),
      'stickerFreezer': stickerFreezer.toString(),
      'papanHarga': papanHarga.toString(),
      'dividerKulkas': dividerKulkas.toString(),
      'labelHarga': labelHarga.toString(),
      'woblerPromo': woblerPromo.toString(),
      'spanduk': spanduk.toString(),
      'brandLain': brandLain.toString(),
      'stockBrandLain': stockBrandLain.toString(),
      'stockDibawahFreezer': stockDibawahFreezer.toString(),
      'produkPromosi': produkPromosi.toString(),
      'kebersihanBungaEs': kebersihanBungaEs.toString(),
      'kepenuhanFreezerAtas': kepenuhanFreezerAtas.toString(),
      'kebersihanLemFreezer': kebersihanLemFreezer.toString(),
      'kebersihanDebuFreezer': kebersihanDebuFreezer.toString(),
      'posisiFreezer': posisiFreezer.toString(),
      'jumlahPO': jumlahPO.toString(),
      'jumlahItemTerdisplay': jumlahItemTerdisplay.toString(),
      'saranDanKendala': saranDanKendala.toString(),
      'produkRetur': produkRetur.toString(),
      'kategoriFreezer': kategoriFreezer.toString(),
      'namaDistributor': namaDistributor.toString(),
    };
  }

  factory SalesDto.fromMap(Map<String, dynamic> map) {
    return SalesDto(
      pilihanTokoId: map['pilihanTokoId'] as int,
      namaToko: map['namaToko'] as String,
      kodeToko: map['kodeToko'] as String,
      kualitasProduk: map['kualitasProduk'] as String,
      stickerFreezer: map['stickerFreezer'] as String,
      papanHarga: map['papanHarga'] as String,
      dividerKulkas: map['dividerKulkas'] as String,
      labelHarga: map['labelHarga'] as String,
      woblerPromo: map['woblerPromo'] as String,
      spanduk: map['spanduk'] as String,
      brandLain: map['brandLain'] as String,
      stockBrandLain: map['stockBrandLain'] as String,
      stockDibawahFreezer: map['stockDibawahFreezer'] as String,
      produkPromosi: map['produkPromosi'] as String,
      kebersihanBungaEs: map['kebersihanBungaEs'] as String,
      kepenuhanFreezerAtas: map['kepenuhanFreezerAtas'] as String,
      kebersihanLemFreezer: map['kebersihanLemFreezer'] as String,
      kebersihanDebuFreezer: map['kebersihanDebuFreezer'] as String,
      posisiFreezer: map['posisiFreezer'] as String,
      jumlahPO: map['jumlahPO'] as int,
      jumlahItemTerdisplay: map['jumlahItemTerdisplay'] as int,
      saranDanKendala: map['saranDanKendala'] as String,
      produkRetur: map['produkRetur'] as String,
      kategoriFreezer: map['kategoriFreezer'] as String,
      namaDistributor: map['namaDistributor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesDto.fromJson(String source) =>
      SalesDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SalesDto(pilihanTokoId: $pilihanTokoId, namaToko: $namaToko, kodeToko: $kodeToko, kualitasProduk: $kualitasProduk, stickerFreezer: $stickerFreezer, papanHarga: $papanHarga, dividerKulkas: $dividerKulkas, labelHarga: $labelHarga, woblerPromo: $woblerPromo, spanduk: $spanduk, brandLain: $brandLain, stockBrandLain: $stockBrandLain, stockDibawahFreezer: $stockDibawahFreezer, produkPromosi: $produkPromosi, kebersihanBungaEs: $kebersihanBungaEs, kepenuhanFreezerAtas: $kepenuhanFreezerAtas, kebersihanLemFreezer: $kebersihanLemFreezer, kebersihanDebuFreezer: $kebersihanDebuFreezer, posisiFreezer: $posisiFreezer, jumlahPO: $jumlahPO, jumlahItemTerdisplay: $jumlahItemTerdisplay, saranDanKendala: $saranDanKendala, produkRetur: $produkRetur, kategoriFreezer: $kategoriFreezer, namaDistributor: $namaDistributor)';
  }

  @override
  bool operator ==(covariant SalesDto other) {
    if (identical(this, other)) return true;

    return other.pilihanTokoId == pilihanTokoId &&
        other.namaToko == namaToko &&
        other.kodeToko == kodeToko &&
        other.kualitasProduk == kualitasProduk &&
        other.stickerFreezer == stickerFreezer &&
        other.papanHarga == papanHarga &&
        other.dividerKulkas == dividerKulkas &&
        other.labelHarga == labelHarga &&
        other.woblerPromo == woblerPromo &&
        other.spanduk == spanduk &&
        other.brandLain == brandLain &&
        other.stockBrandLain == stockBrandLain &&
        other.stockDibawahFreezer == stockDibawahFreezer &&
        other.produkPromosi == produkPromosi &&
        other.kebersihanBungaEs == kebersihanBungaEs &&
        other.kepenuhanFreezerAtas == kepenuhanFreezerAtas &&
        other.kebersihanLemFreezer == kebersihanLemFreezer &&
        other.kebersihanDebuFreezer == kebersihanDebuFreezer &&
        other.posisiFreezer == posisiFreezer &&
        other.jumlahPO == jumlahPO &&
        other.jumlahItemTerdisplay == jumlahItemTerdisplay &&
        other.saranDanKendala == saranDanKendala &&
        other.produkRetur == produkRetur &&
        other.kategoriFreezer == kategoriFreezer &&
        other.namaDistributor == namaDistributor;
  }

  @override
  int get hashCode {
    return pilihanTokoId.hashCode ^
        namaToko.hashCode ^
        kodeToko.hashCode ^
        kualitasProduk.hashCode ^
        stickerFreezer.hashCode ^
        papanHarga.hashCode ^
        dividerKulkas.hashCode ^
        labelHarga.hashCode ^
        woblerPromo.hashCode ^
        spanduk.hashCode ^
        brandLain.hashCode ^
        stockBrandLain.hashCode ^
        stockDibawahFreezer.hashCode ^
        produkPromosi.hashCode ^
        kebersihanBungaEs.hashCode ^
        kepenuhanFreezerAtas.hashCode ^
        kebersihanLemFreezer.hashCode ^
        kebersihanDebuFreezer.hashCode ^
        posisiFreezer.hashCode ^
        jumlahPO.hashCode ^
        jumlahItemTerdisplay.hashCode ^
        saranDanKendala.hashCode ^
        produkRetur.hashCode ^
        kategoriFreezer.hashCode ^
        namaDistributor.hashCode;
  }
}
