// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class AuthModel {
  final int id;
  final String? email;
  final String name;
  final String jenisAkun;
  final String uuid;
  AuthModel({
    required this.id,
    required this.email,
    required this.name,
    required this.jenisAkun,
    required this.uuid,
  });

  

  AuthModel copyWith({
    int? id,
    String? email,
    String? name,
    String? jenisAkun,
    String? uuid,
  }) {
    return AuthModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      jenisAkun: jenisAkun ?? this.jenisAkun,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'jenisAkun': jenisAkun,
      'uuid': uuid,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    
    return AuthModel(
      id: int.tryParse(map['id'].toString()) ?? -1,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] as String,
      jenisAkun: map['jenisAkun'] as String,
      uuid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthModel(id: $id, email: $email, name: $name, jenisAkun: $jenisAkun, uuid: $uuid)';
  }

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;
  
    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.jenisAkun == jenisAkun &&
        other.uuid == uuid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        jenisAkun.hashCode ^
        uuid.hashCode;
  }
}
