import 'dart:convert';

class AbsensiModel {
  final int id;
  final int userId;
  final int? formAbsensiId;
  final int pilihanTokoId;
  final String namaToko;
  final String? waktuCheckIn;
  final String? waktuCheckOut;
  AbsensiModel({
    required this.id,
    required this.userId,
    this.formAbsensiId,
    required this.pilihanTokoId,
    required this.namaToko,
    this.waktuCheckIn,
    this.waktuCheckOut,
  });

  AbsensiModel copyWith({
    int? id,
    int? userId,
    int? formAbsensiId,
    int? pilihanTokoId,
    String? namaToko,
    String? waktuCheckIn,
    String? waktuCheckOut,
  }) {
    return AbsensiModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      formAbsensiId: formAbsensiId ?? this.formAbsensiId,
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
      namaToko: namaToko ?? this.namaToko,
      waktuCheckIn: waktuCheckIn ?? this.waktuCheckIn,
      waktuCheckOut: waktuCheckOut ?? this.waktuCheckOut,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'formAbsensiId': formAbsensiId,
      'pilihanTokoId': pilihanTokoId,
      'namaToko': namaToko,
      'waktuCheckIn': waktuCheckIn,
      'waktuCheckOut': waktuCheckOut,
    };
  }

  factory AbsensiModel.fromMap(Map<String, dynamic> map) {
    return AbsensiModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      formAbsensiId:
          map['formAbsensiId'] != null ? map['formAbsensiId'] as int : null,
      pilihanTokoId: map['pilihanTokoId'] as int,
      namaToko: map['namaToko'] as String,
      waktuCheckIn:
          map['waktuCheckIn'] != null ? map['waktuCheckIn'] as String : null,
      waktuCheckOut:
          map['waktuCheckOut'] != null ? map['waktuCheckOut'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsensiModel.fromJson(String source) =>
      AbsensiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AbsensiModel(id: $id, userId: $userId, formAbsensiId: $formAbsensiId, pilihanTokoId: $pilihanTokoId, namaToko: $namaToko, waktuCheckIn: $waktuCheckIn, waktuCheckOut: $waktuCheckOut)';
  }

  @override
  bool operator ==(covariant AbsensiModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.formAbsensiId == formAbsensiId &&
        other.pilihanTokoId == pilihanTokoId &&
        other.namaToko == namaToko &&
        other.waktuCheckIn == waktuCheckIn &&
        other.waktuCheckOut == waktuCheckOut;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        formAbsensiId.hashCode ^
        pilihanTokoId.hashCode ^
        namaToko.hashCode ^
        waktuCheckIn.hashCode ^
        waktuCheckOut.hashCode;
  }
}
