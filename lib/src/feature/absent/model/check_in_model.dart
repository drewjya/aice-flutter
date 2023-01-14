import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CheckInModel {
  final String namaToko;
  final String kodeToko;
  final Timestamp waktuCheckIn;
  Timestamp? timestamp;
  CheckInModel({required this.namaToko, required this.kodeToko, this.timestamp})
      : waktuCheckIn = timestamp ?? Timestamp.now();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaToko': namaToko,
      'kodeToko': kodeToko,
      'waktuCheckIn': waktuCheckIn,
    };
  }

  factory CheckInModel.fromMap(Map<String, dynamic> map) {
    return CheckInModel(
      namaToko: map['namaToko'] as String,
      kodeToko: map['kodeToko'] as String,
      timestamp: map['waktuCheckIn'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckInModel.fromJson(String source) =>
      CheckInModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
