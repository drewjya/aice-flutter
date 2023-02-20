// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckInModel {
  final String namaToko;
  final int pilihanTokoId;
  final double latitude;
  final double longitude;
  CheckInModel({
    required this.namaToko,
    required this.pilihanTokoId,
    required this.latitude,
    required this.longitude,
  });
  

 

  CheckInModel copyWith({
    String? namaToko,
    int? pilihanTokoId,
    double? latitude,
    double? longitude,
  }) {
    return CheckInModel(
      namaToko: namaToko ?? this.namaToko,
      pilihanTokoId: pilihanTokoId ?? this.pilihanTokoId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaToko': namaToko,
      'pilihanTokoId': "$pilihanTokoId",
      'latitude': "$latitude",
      'longitude': "$longitude",
    };
  }


  factory CheckInModel.fromMap(Map<String, dynamic> map) {
    return CheckInModel(
      namaToko: map['namaToko'] as String,
      pilihanTokoId: map['pilihanTokoId'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckInModel.fromJson(String source) =>
      CheckInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckInModel(namaToko: $namaToko, pilihanTokoId: $pilihanTokoId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant CheckInModel other) {
    if (identical(this, other)) return true;
  
    return other.namaToko == namaToko &&
        other.pilihanTokoId == pilihanTokoId &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return namaToko.hashCode ^
        pilihanTokoId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
