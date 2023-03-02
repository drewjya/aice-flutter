import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

enum PilihanToko {
  alfamart("Alfamart", 1),
  alfamidi("Alfamidi", 2),
  indomaret("Indomaret", 3),
  superhyper("Superhyper", 4);

  final String name;
  final int value;
  const PilihanToko(this.name, this.value);

  factory PilihanToko.fromValue(int val) {
    switch (val) {
      case 1:
        return PilihanToko.alfamart;
      case 2:
        return PilihanToko.alfamidi;
      case 3:
        return PilihanToko.indomaret;
      case 4:
        return PilihanToko.superhyper;
      default:
        return PilihanToko.alfamart;
    }
  }
}

class SalesDetail {
  final int id;
  final String userId;
  final String createdAt;
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

  SalesDetail({
    required this.id,
    required this.userId,
    required this.createdAt,
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
    this.fotoSelfie,
    this.fotoKulkasDariJauh,
    this.fotoKulkasTertutup,
    this.fotoKulkasTerbuka,
    this.fotoFreezerOne,
    this.fotoFreezerTwo,
    this.fotoFreezerThree,
    this.fotoFreezerIsland1,
    this.fotoFreezerIsland2,
    this.fotoFreezerIsland3,
    this.fotoFreezerBawah,
    this.fotoPo,
    this.fotoPop,
    this.fotoPeralatan,
  });

  SalesDetail copyWith({
    int? id,
    String? userId,
    String? createdAt,
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
  }) {
    return SalesDetail(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
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
      'id': id,
      'userId': userId,
      'createdAt': createdAt,
      'pilihanTokoId': pilihanTokoId,
      'namaToko': namaToko,
      'kodeToko': kodeToko,
      'kualitasProduk': kualitasProduk,
      'stickerFreezer': stickerFreezer,
      'papanHarga': papanHarga,
      'dividerKulkas': dividerKulkas,
      'labelHarga': labelHarga,
      'woblerPromo': woblerPromo,
      'spanduk': spanduk,
      'brandLain': brandLain,
      'stockBrandLain': stockBrandLain,
      'stockDibawahFreezer': stockDibawahFreezer,
      'produkPromosi': produkPromosi,
      'kebersihanBungaEs': kebersihanBungaEs,
      'kepenuhanFreezerAtas': kepenuhanFreezerAtas,
      'kebersihanLemFreezer': kebersihanLemFreezer,
      'kebersihanDebuFreezer': kebersihanDebuFreezer,
      'posisiFreezer': posisiFreezer,
      'jumlahPO': jumlahPO,
      'jumlahItemTerdisplay': jumlahItemTerdisplay,
      'saranDanKendala': saranDanKendala,
      'produkRetur': produkRetur,
      'kategoriFreezer': kategoriFreezer,
      'namaDistributor': namaDistributor,
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

  factory SalesDetail.fromMap(Map<String, dynamic> map) {
    return SalesDetail(
      id: map['id'] as int,
      userId: map['userId'] as String,
      createdAt: map['createdAt'] as String,
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
      fotoSelfie:
          map['fotoSelfie'] != null ? map['fotoSelfie'] as String : null,
      fotoKulkasDariJauh: map['fotoKulkasDariJauh'] != null
          ? map['fotoKulkasDariJauh'] as String
          : null,
      fotoKulkasTertutup: map['fotoKulkasTertutup'] != null
          ? map['fotoKulkasTertutup'] as String
          : null,
      fotoKulkasTerbuka: map['fotoKulkasTerbuka'] != null
          ? map['fotoKulkasTerbuka'] as String
          : null,
      fotoFreezerOne: map['fotoFreezerOne'] != null
          ? map['fotoFreezerOne'] as String
          : null,
      fotoFreezerTwo: map['fotoFreezerTwo'] != null
          ? map['fotoFreezerTwo'] as String
          : null,
      fotoFreezerThree: map['fotoFreezerThree'] != null
          ? map['fotoFreezerThree'] as String
          : null,
      fotoFreezerIsland1: map['fotoFreezerIsland1'] != null
          ? map['fotoFreezerIsland1'] as String
          : null,
      fotoFreezerIsland2: map['fotoFreezerIsland2'] != null
          ? map['fotoFreezerIsland2'] as String
          : null,
      fotoFreezerIsland3: map['fotoFreezerIsland3'] != null
          ? map['fotoFreezerIsland3'] as String
          : null,
      fotoFreezerBawah: map['fotoFreezerBawah'] != null
          ? map['fotoFreezerBawah'] as String
          : null,
      fotoPo: map['fotoPo'] != null ? map['fotoPo'] as String : null,
      fotoPop: map['fotoPop'] != null ? map['fotoPop'] as String : null,
      fotoPeralatan:
          map['fotoPeralatan'] != null ? map['fotoPeralatan'] as String : null,
    );
  }

  @override
  String toString() {
    return 'SalesDetail(id: $id, userId: $userId, createdAt: $createdAt, pilihanTokoId: $pilihanTokoId, namaToko: $namaToko, kodeToko: $kodeToko, kualitasProduk: $kualitasProduk, stickerFreezer: $stickerFreezer, papanHarga: $papanHarga, dividerKulkas: $dividerKulkas, labelHarga: $labelHarga, woblerPromo: $woblerPromo, spanduk: $spanduk, brandLain: $brandLain, stockBrandLain: $stockBrandLain, stockDibawahFreezer: $stockDibawahFreezer, produkPromosi: $produkPromosi, kebersihanBungaEs: $kebersihanBungaEs, kepenuhanFreezerAtas: $kepenuhanFreezerAtas, kebersihanLemFreezer: $kebersihanLemFreezer, kebersihanDebuFreezer: $kebersihanDebuFreezer, posisiFreezer: $posisiFreezer, jumlahPO: $jumlahPO, jumlahItemTerdisplay: $jumlahItemTerdisplay, saranDanKendala: $saranDanKendala, produkRetur: $produkRetur, kategoriFreezer: $kategoriFreezer, namaDistributor: $namaDistributor, fotoSelfie: $fotoSelfie, fotoKulkasDariJauh: $fotoKulkasDariJauh, fotoKulkasTertutup: $fotoKulkasTertutup, fotoKulkasTerbuka: $fotoKulkasTerbuka, fotoFreezerOne: $fotoFreezerOne, fotoFreezerTwo: $fotoFreezerTwo, fotoFreezerThree: $fotoFreezerThree, fotoFreezerIsland1: $fotoFreezerIsland1, fotoFreezerIsland2: $fotoFreezerIsland2, fotoFreezerIsland3: $fotoFreezerIsland3, fotoFreezerBawah: $fotoFreezerBawah, fotoPo: $fotoPo, fotoPop: $fotoPop, fotoPeralatan: $fotoPeralatan)';
  }

  @override
  bool operator ==(covariant SalesDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.createdAt == createdAt &&
        other.pilihanTokoId == pilihanTokoId &&
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
        other.namaDistributor == namaDistributor &&
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
    return id.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        pilihanTokoId.hashCode ^
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
        namaDistributor.hashCode ^
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

  String toJson() => json.encode(toMap());

  factory SalesDetail.fromJson(String source) =>
      SalesDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
