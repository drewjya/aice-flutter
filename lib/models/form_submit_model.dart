// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FormSubmitModel {
final String id;
final String storeName;
final String kodeToko;
final String jumlahPo;
final String jumlahItemTerdisplay;
final String saranDanKendala;
final String produkRetur;
final String pilihanToko;
final String kualitasProduk;
final String kategoriFreezer;
final String stickerFreezer;
final String papanHarga;
final String dividerKulkas;
final String labelHarga;
final String woblerPromo;
final String spanduk;
final String kepenuhanFreezerAtas;
final String debuFreezer;
final String brandLain;
final String stockBrandLain;
final String bekasLemFreezer;
final String posisiFreezer;
final String stockDibawahFreezer;
final String kebersihanBungaEs;
final String produkPromosi;
  FormSubmitModel({
    required this.id,
    required this.storeName,
    required this.kodeToko,
    required this.jumlahPo,
    required this.jumlahItemTerdisplay,
    required this.saranDanKendala,
    required this.produkRetur,
    required this.pilihanToko,
    required this.kualitasProduk,
    required this.kategoriFreezer,
    required this.stickerFreezer,
    required this.papanHarga,
    required this.dividerKulkas,
    required this.labelHarga,
    required this.woblerPromo,
    required this.spanduk,
    required this.kepenuhanFreezerAtas,
    required this.debuFreezer,
    required this.brandLain,
    required this.stockBrandLain,
    required this.bekasLemFreezer,
    required this.posisiFreezer,
    required this.stockDibawahFreezer,
    required this.kebersihanBungaEs,
    required this.produkPromosi,
  });

  FormSubmitModel copyWith({
    String? id,
    String? storeName,
    String? kodeToko,
    String? jumlahPo,
    String? jumlahItemTerdisplay,
    String? saranDanKendala,
    String? produkRetur,
    String? pilihanToko,
    String? kualitasProduk,
    String? kategoriFreezer,
    String? stickerFreezer,
    String? papanHarga,
    String? dividerKulkas,
    String? labelHarga,
    String? woblerPromo,
    String? spanduk,
    String? kepenuhanFreezerAtas,
    String? debuFreezer,
    String? brandLain,
    String? stockBrandLain,
    String? bekasLemFreezer,
    String? posisiFreezer,
    String? stockDibawahFreezer,
    String? kebersihanBungaEs,
    String? produkPromosi,
  }) {
    return FormSubmitModel(
      id: id ?? this.id,
      storeName: storeName ?? this.storeName,
      kodeToko: kodeToko ?? this.kodeToko,
      jumlahPo: jumlahPo ?? this.jumlahPo,
      jumlahItemTerdisplay: jumlahItemTerdisplay ?? this.jumlahItemTerdisplay,
      saranDanKendala: saranDanKendala ?? this.saranDanKendala,
      produkRetur: produkRetur ?? this.produkRetur,
      pilihanToko: pilihanToko ?? this.pilihanToko,
      kualitasProduk: kualitasProduk ?? this.kualitasProduk,
      kategoriFreezer: kategoriFreezer ?? this.kategoriFreezer,
      stickerFreezer: stickerFreezer ?? this.stickerFreezer,
      papanHarga: papanHarga ?? this.papanHarga,
      dividerKulkas: dividerKulkas ?? this.dividerKulkas,
      labelHarga: labelHarga ?? this.labelHarga,
      woblerPromo: woblerPromo ?? this.woblerPromo,
      spanduk: spanduk ?? this.spanduk,
      kepenuhanFreezerAtas: kepenuhanFreezerAtas ?? this.kepenuhanFreezerAtas,
      debuFreezer: debuFreezer ?? this.debuFreezer,
      brandLain: brandLain ?? this.brandLain,
      stockBrandLain: stockBrandLain ?? this.stockBrandLain,
      bekasLemFreezer: bekasLemFreezer ?? this.bekasLemFreezer,
      posisiFreezer: posisiFreezer ?? this.posisiFreezer,
      stockDibawahFreezer: stockDibawahFreezer ?? this.stockDibawahFreezer,
      kebersihanBungaEs: kebersihanBungaEs ?? this.kebersihanBungaEs,
      produkPromosi: produkPromosi ?? this.produkPromosi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'storeName': storeName,
      'kodeToko': kodeToko,
      'jumlahPo': jumlahPo,
      'jumlahItemTerdisplay': jumlahItemTerdisplay,
      'saranDanKendala': saranDanKendala,
      'produkRetur': produkRetur,
      'pilihanToko': pilihanToko,
      'kualitasProduk': kualitasProduk,
      'kategoriFreezer': kategoriFreezer,
      'stickerFreezer': stickerFreezer,
      'papanHarga': papanHarga,
      'dividerKulkas': dividerKulkas,
      'labelHarga': labelHarga,
      'woblerPromo': woblerPromo,
      'spanduk': spanduk,
      'kepenuhanFreezerAtas': kepenuhanFreezerAtas,
      'debuFreezer': debuFreezer,
      'brandLain': brandLain,
      'stockBrandLain': stockBrandLain,
      'bekasLemFreezer': bekasLemFreezer,
      'posisiFreezer': posisiFreezer,
      'stockDibawahFreezer': stockDibawahFreezer,
      'kebersihanBungaEs': kebersihanBungaEs,
      'produkPromosi': produkPromosi,
    };
  }

  factory FormSubmitModel.fromMap(Map<String, dynamic> map) {
    return FormSubmitModel(
      id: map['id'] as String,
      storeName: map['storeName'] as String,
      kodeToko: map['kodeToko'] as String,
      jumlahPo: map['jumlahPo'] as String,
      jumlahItemTerdisplay: map['jumlahItemTerdisplay'] as String,
      saranDanKendala: map['saranDanKendala'] as String,
      produkRetur: map['produkRetur'] as String,
      pilihanToko: map['pilihanToko'] as String,
      kualitasProduk: map['kualitasProduk'] as String,
      kategoriFreezer: map['kategoriFreezer'] as String,
      stickerFreezer: map['stickerFreezer'] as String,
      papanHarga: map['papanHarga'] as String,
      dividerKulkas: map['dividerKulkas'] as String,
      labelHarga: map['labelHarga'] as String,
      woblerPromo: map['woblerPromo'] as String,
      spanduk: map['spanduk'] as String,
      kepenuhanFreezerAtas: map['kepenuhanFreezerAtas'] as String,
      debuFreezer: map['debuFreezer'] as String,
      brandLain: map['brandLain'] as String,
      stockBrandLain: map['stockBrandLain'] as String,
      bekasLemFreezer: map['bekasLemFreezer'] as String,
      posisiFreezer: map['posisiFreezer'] as String,
      stockDibawahFreezer: map['stockDibawahFreezer'] as String,
      kebersihanBungaEs: map['kebersihanBungaEs'] as String,
      produkPromosi: map['produkPromosi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormSubmitModel.fromJson(String source) => FormSubmitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FormSubmitModel(id: $id, storeName: $storeName, kodeToko: $kodeToko, jumlahPo: $jumlahPo, jumlahItemTerdisplay: $jumlahItemTerdisplay, saranDanKendala: $saranDanKendala, produkRetur: $produkRetur, pilihanToko: $pilihanToko, kualitasProduk: $kualitasProduk, kategoriFreezer: $kategoriFreezer, stickerFreezer: $stickerFreezer, papanHarga: $papanHarga, dividerKulkas: $dividerKulkas, labelHarga: $labelHarga, woblerPromo: $woblerPromo, spanduk: $spanduk, kepenuhanFreezerAtas: $kepenuhanFreezerAtas, debuFreezer: $debuFreezer, brandLain: $brandLain, stockBrandLain: $stockBrandLain, bekasLemFreezer: $bekasLemFreezer, posisiFreezer: $posisiFreezer, stockDibawahFreezer: $stockDibawahFreezer, kebersihanBungaEs: $kebersihanBungaEs, produkPromosi: $produkPromosi)';
  }

  @override
  bool operator ==(covariant FormSubmitModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.storeName == storeName &&
      other.kodeToko == kodeToko &&
      other.jumlahPo == jumlahPo &&
      other.jumlahItemTerdisplay == jumlahItemTerdisplay &&
      other.saranDanKendala == saranDanKendala &&
      other.produkRetur == produkRetur &&
      other.pilihanToko == pilihanToko &&
      other.kualitasProduk == kualitasProduk &&
      other.kategoriFreezer == kategoriFreezer &&
      other.stickerFreezer == stickerFreezer &&
      other.papanHarga == papanHarga &&
      other.dividerKulkas == dividerKulkas &&
      other.labelHarga == labelHarga &&
      other.woblerPromo == woblerPromo &&
      other.spanduk == spanduk &&
      other.kepenuhanFreezerAtas == kepenuhanFreezerAtas &&
      other.debuFreezer == debuFreezer &&
      other.brandLain == brandLain &&
      other.stockBrandLain == stockBrandLain &&
      other.bekasLemFreezer == bekasLemFreezer &&
      other.posisiFreezer == posisiFreezer &&
      other.stockDibawahFreezer == stockDibawahFreezer &&
      other.kebersihanBungaEs == kebersihanBungaEs &&
      other.produkPromosi == produkPromosi;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      storeName.hashCode ^
      kodeToko.hashCode ^
      jumlahPo.hashCode ^
      jumlahItemTerdisplay.hashCode ^
      saranDanKendala.hashCode ^
      produkRetur.hashCode ^
      pilihanToko.hashCode ^
      kualitasProduk.hashCode ^
      kategoriFreezer.hashCode ^
      stickerFreezer.hashCode ^
      papanHarga.hashCode ^
      dividerKulkas.hashCode ^
      labelHarga.hashCode ^
      woblerPromo.hashCode ^
      spanduk.hashCode ^
      kepenuhanFreezerAtas.hashCode ^
      debuFreezer.hashCode ^
      brandLain.hashCode ^
      stockBrandLain.hashCode ^
      bekasLemFreezer.hashCode ^
      posisiFreezer.hashCode ^
      stockDibawahFreezer.hashCode ^
      kebersihanBungaEs.hashCode ^
      produkPromosi.hashCode;
  }
}
