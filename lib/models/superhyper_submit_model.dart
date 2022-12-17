// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class SuperhyperSubmitModel {
  final File pickedSelfie;
  final File farFreezer;
  final File closeFreezer;
  final File freezerOne;
  final File freezerTwo;
  final File freezerThree;
  final File freezerIslandOne;
  final File freezerIslandTwo;
  final File freezerIslandThree;
  final File freezerBawah;
  final File po;
  final File fotoPop;
  final File fotoPeralatan;

  const SuperhyperSubmitModel({
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
    return 'SuperhyperSubmitModel(pickedSelfie: $pickedSelfie, farFreezer: $farFreezer, closeFreezer: $closeFreezer, freezerOne: $freezerOne, freezerTwo: $freezerTwo, freezerThree: $freezerThree, freezerIslandOne: $freezerIslandOne, freezerIslandTwo: $freezerIslandTwo, freezerIslandThree: $freezerIslandThree, freezerBawah: $freezerBawah, po: $po, fotoPop: $fotoPop, fotoPeralatan: $fotoPeralatan)';
  }

  SuperhyperSubmitModel copyWith({
    File? pickedSelfie,
    File? farFreezer,
    File? closeFreezer,
    File? freezerOne,
    File? freezerTwo,
    File? freezerThree,
    File? freezerIslandOne,
    File? freezerIslandTwo,
    File? freezerIslandThree,
    File? freezerBawah,
    File? po,
    File? fotoPop,
    File? fotoPeralatan,
  }) {
    return SuperhyperSubmitModel(
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
  bool operator ==(covariant SuperhyperSubmitModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.pickedSelfie == pickedSelfie &&
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
}
