import 'dart:convert';

class AuthModel {
  final int id;
  final String? email;
  final String name;
  final String jenisAkun;
  AuthModel({
    required this.id,
    required this.email,
    required this.name,
    required this.jenisAkun,
  });

  AuthModel copyWith({
    int? id,
    String? email,
    String? name,
    String? jenisAkun,
  }) {
    return AuthModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      jenisAkun: jenisAkun ?? this.jenisAkun,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'jenisAkun': jenisAkun,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: int.tryParse(map['id'].toString()) ?? 0,
      email: map['email'] as String?,
      name: map['name'] as String,
      jenisAkun: map['jenisAkun'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthModel(id: $id, email: $email, name: $name, jenisAkun: $jenisAkun)';
  }

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.jenisAkun == jenisAkun;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ name.hashCode ^ jenisAkun.hashCode;
  }
}
