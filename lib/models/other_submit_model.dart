// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class OtherSubmitModel {
  final File pickedSelfie;
  final File farFreezer;
  final File closeFreezer;
  final File openedFreezer;
  final File po;
  final File freezerBawah;
  OtherSubmitModel({
    required this.pickedSelfie,
    required this.farFreezer,
    required this.closeFreezer,
    required this.openedFreezer,
    required this.po,
    required this.freezerBawah,
  });

  OtherSubmitModel copyWith({
    File? pickedSelfie,
    File? farFreezer,
    File? closeFreezer,
    File? openedFreezer,
    File? po,
    File? freezerBawah,
  }) {
    return OtherSubmitModel(
      pickedSelfie: pickedSelfie ?? this.pickedSelfie,
      farFreezer: farFreezer ?? this.farFreezer,
      closeFreezer: closeFreezer ?? this.closeFreezer,
      openedFreezer: openedFreezer ?? this.openedFreezer,
      po: po ?? this.po,
      freezerBawah: freezerBawah ?? this.freezerBawah,
    );
  }

  @override
  String toString() {
    return 'OtherSubmitModel(pickedSelfie: $pickedSelfie, farFreezer: $farFreezer, closeFreezer: $closeFreezer, openedFreezer: $openedFreezer, po: $po, freezerBawah: $freezerBawah)';
  }

  @override
  bool operator ==(covariant OtherSubmitModel other) {
    if (identical(this, other)) return true;

    return other.pickedSelfie == pickedSelfie &&
        other.farFreezer == farFreezer &&
        other.closeFreezer == closeFreezer &&
        other.openedFreezer == openedFreezer &&
        other.po == po &&
        other.freezerBawah == freezerBawah;
  }

  @override
  int get hashCode {
    return pickedSelfie.hashCode ^
        farFreezer.hashCode ^
        closeFreezer.hashCode ^
        openedFreezer.hashCode ^
        po.hashCode ^
        freezerBawah.hashCode;
  }
}
