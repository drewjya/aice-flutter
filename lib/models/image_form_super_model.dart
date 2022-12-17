// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageFormSuperModel {
  final String pickedSelfie;
  final String farFreezer;
  final String closeFreezer;
  final String freezerOne;
  final String freezerTwo;
  final String freezerThree;
  final String freezerIslandOne;
  final String freezerIslandTwo;
  final String freezerIslandThree;
  final String freezerBawah;
  final String po;
  final String fotoPop;
  final String fotoPeralatan;

  const ImageFormSuperModel({
    required this.pickedSelfie,
    required this.farFreezer,
    required this.closeFreezer,
    required this.freezerOne,
    required this.freezerTwo,
    required this.freezerThree,
    required this.freezerIslandOne,
    required this.freezerIslandTwo,
    required this.freezerIslandThree,
    required this.freezerBawah,
    required this.po,
    required this.fotoPop,
    required this.fotoPeralatan,
  });

  @override
  String toString() {
    return 'ImageFormSuperModel(pickedSelfie: $pickedSelfie, farFreezer: $farFreezer, closeFreezer: $closeFreezer, freezerOne: $freezerOne, freezerTwo: $freezerTwo, freezerThree: $freezerThree, freezerIslandOne: $freezerIslandOne, freezerIslandTwo: $freezerIslandTwo, freezerIslandThree: $freezerIslandThree, freezerBawah: $freezerBawah, po: $po, fotoPop: $fotoPop, fotoPeralatan: $fotoPeralatan)';
  }

  ImageFormSuperModel copyWith({
    String? pickedSelfie,
    String? farFreezer,
    String? closeFreezer,
    String? freezerOne,
    String? freezerTwo,
    String? freezerThree,
    String? freezerIslandOne,
    String? freezerIslandTwo,
    String? freezerIslandThree,
    String? freezerBawah,
    String? po,
    String? fotoPop,
    String? fotoPeralatan,
  }) {
    return ImageFormSuperModel(
      pickedSelfie: pickedSelfie ?? this.pickedSelfie,
      farFreezer: farFreezer ?? this.farFreezer,
      closeFreezer: closeFreezer ?? this.closeFreezer,
      freezerOne: freezerOne ?? this.freezerOne,
      freezerTwo: freezerTwo ?? this.freezerTwo,
      freezerThree: freezerThree ?? this.freezerThree,
      freezerIslandOne: freezerIslandOne ?? this.freezerIslandOne,
      freezerIslandTwo: freezerIslandTwo ?? this.freezerIslandTwo,
      freezerIslandThree: freezerIslandThree ?? this.freezerIslandThree,
      freezerBawah: freezerBawah ?? this.freezerBawah,
      po: po ?? this.po,
      fotoPop: fotoPop ?? this.fotoPop,
      fotoPeralatan: fotoPeralatan ?? this.fotoPeralatan,
    );
  }

  @override
  bool operator ==(covariant ImageFormSuperModel other) {
    if (identical(this, other)) return true;

    return other.pickedSelfie == pickedSelfie &&
        other.farFreezer == farFreezer &&
        other.closeFreezer == closeFreezer &&
        other.freezerOne == freezerOne &&
        other.freezerTwo == freezerTwo &&
        other.freezerThree == freezerThree &&
        other.freezerIslandOne == freezerIslandOne &&
        other.freezerIslandTwo == freezerIslandTwo &&
        other.freezerIslandThree == freezerIslandThree &&
        other.freezerBawah == freezerBawah &&
        other.po == po &&
        other.fotoPop == fotoPop &&
        other.fotoPeralatan == fotoPeralatan;
  }

  @override
  int get hashCode {
    return pickedSelfie.hashCode ^
        farFreezer.hashCode ^
        closeFreezer.hashCode ^
        freezerOne.hashCode ^
        freezerTwo.hashCode ^
        freezerThree.hashCode ^
        freezerIslandOne.hashCode ^
        freezerIslandTwo.hashCode ^
        freezerIslandThree.hashCode ^
        freezerBawah.hashCode ^
        po.hashCode ^
        fotoPop.hashCode ^
        fotoPeralatan.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pickedSelfie': pickedSelfie,
      'farFreezer': farFreezer,
      'closeFreezer': closeFreezer,
      'freezerOne': freezerOne,
      'freezerTwo': freezerTwo,
      'freezerThree': freezerThree,
      'freezerIslandOne': freezerIslandOne,
      'freezerIslandTwo': freezerIslandTwo,
      'freezerIslandThree': freezerIslandThree,
      'freezerBawah': freezerBawah,
      'po': po,
      'fotoPop': fotoPop,
      'fotoPeralatan': fotoPeralatan,
    };
  }

  factory ImageFormSuperModel.fromMap(Map<String, dynamic> map) {
    return ImageFormSuperModel(
      pickedSelfie: map['Foto Selfie'] as String,
      farFreezer: map['Foto Kulkas Dari Jauh'] as String,
      closeFreezer: map['Foto Kulkas Tertutup'] as String,
      freezerOne: map["Foto Freezer One"] as String,
      freezerTwo: map["Foto Freezer Two"] as String,
      freezerThree: map["Foto Freezer Three"] as String,
      freezerIslandOne: map["Foto Freezer Island 1"] as String,
      freezerIslandTwo: map["Foto Freezer Island 2"] as String,
      freezerIslandThree: map["Foto Freezer Island 3"] as String,
      freezerBawah: map['Foto Freezer Bawah'] as String,
      po: map['Foto PO'] as String,
      fotoPop: map["Foto Pop"] as String,
      fotoPeralatan: map["Foto Peralatan"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageFormSuperModel.fromJson(String source) =>
      ImageFormSuperModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
