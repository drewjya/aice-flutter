// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SalesHistoryModel {
  final int id;
  final int userId;
  final String createdAt;
  final int pilihanTokoId;
  final String namaToko;
  final String kodeToko;
  SalesHistoryModel({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.pilihanTokoId,
    required this.namaToko,
    required this.kodeToko,
  });

  SalesHistoryModel copyWith({
    int? id,
    int? userId,
    String? createdAt,
    int? pilihanTokoId,
    String? namaToko,
    String? kodeToko,
  }) {
    return SalesHistoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
      namaToko: namaToko ?? this.namaToko,
      kodeToko: kodeToko ?? this.kodeToko,
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
    };
  }

  factory SalesHistoryModel.fromMap(Map<String, dynamic> map) {
    return SalesHistoryModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      createdAt: map['createdAt'],
      pilihanTokoId: map['pilihanTokoId'] as int,
      namaToko: map['namaToko'] as String,
      kodeToko: map['kodeToko'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesHistoryModel.fromJson(String source) =>
      SalesHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SalesHistoryModel(id: $id, userId: $userId, createdAt: $createdAt, pilihanTokoId: $pilihanTokoId, namaToko: $namaToko, kodeToko: $kodeToko)';
  }

  @override
  bool operator ==(covariant SalesHistoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.createdAt == createdAt &&
        other.pilihanTokoId == pilihanTokoId &&
        other.namaToko == namaToko &&
        other.kodeToko == kodeToko;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        pilihanTokoId.hashCode ^
        namaToko.hashCode ^
        kodeToko.hashCode;
  }
}
