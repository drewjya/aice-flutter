import 'dart:convert';


class CheckInModel {
  final String namaToko;
  final int pilihanTokoId;
  CheckInModel({
    required this.namaToko,
    required this.pilihanTokoId,
  });

  CheckInModel copyWith({
    String? namaToko,
    int? pilihanTokoId,
  }) {
    return CheckInModel(
      namaToko: namaToko ?? this.namaToko,
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaToko': namaToko,
      'pilihanTokoId': pilihanTokoId.toString(),
    };
  }

  factory CheckInModel.fromMap(Map<String, dynamic> map) {
    return CheckInModel(
      namaToko: map['namaToko'] as String,
      pilihanTokoId: map['pilihanTokoId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckInModel.fromJson(String source) =>
      CheckInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CheckInModel(namaToko: $namaToko, pilihanTokoId: $pilihanTokoId)';

  @override
  bool operator ==(covariant CheckInModel other) {
    if (identical(this, other)) return true;

    return other.namaToko == namaToko && other.pilihanTokoId == pilihanTokoId;
  }

  @override
  int get hashCode => namaToko.hashCode ^ pilihanTokoId.hashCode;
}
